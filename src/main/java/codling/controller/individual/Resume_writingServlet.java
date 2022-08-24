package codling.controller.individual;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Career;
import codling.identity.Education;
import codling.identity.License;
import codling.identity.Portfolio;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024, 
	maxFileSize = 1024 * 1024 * 50,
	maxRequestSize = 1024 * 1024 * 50 * 5
)
@WebServlet("/resume_writing")
public class Resume_writingServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getIndiName(id);
		String name = map.get(id);
		
		request.setAttribute("name", name);
		request.getRequestDispatcher("/WEB-INF/individual/resume_writing.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		IndividualDao indiDao = new IndividualDao();
		
		// 이력서 제목
		String title = request.getParameter("title");
		boolean titleResult = indiDao.insertResumeTitle(id, title);
		
		// 학력사항
		String[] schools          = request.getParameterValues("school");
		String[] schoolNames      = request.getParameterValues("schoolName");
		String[] schoolStartDates = request.getParameterValues("schoolStartDate");
		String[] schoolEndDates   = request.getParameterValues("schoolEndDate");
		String[] statuses         = request.getParameterValues("status");
		String[] departments      = request.getParameterValues("department");
		String[] scores           = request.getParameterValues("score");
		
		boolean educationResult = true;
		for(int i = 0; i < schools.length - 1; i++) {
			Education education = new Education(0, id, schools[i], schoolNames[i], schoolStartDates[i] + "-00", schoolEndDates[i] + "-00", statuses[i], departments[i], scores[i]);
			boolean result = indiDao.insertEducation(education);
			if(!result) educationResult = false;
		}
		
		// 스택
		String stack = request.getParameter("stacks");
		boolean stackResult = indiDao.insertStack(id, stack);
		
		// 경력사항
		String[] prev_companies     = request.getParameterValues("prev_company");
		String[] tenureStartDates   = request.getParameterValues("tenureStartDate");
		String[] tenureEndDates     = request.getParameterValues("tenureEndDate");
		String[] positions          = request.getParameterValues("position");
		String[] career_departments = request.getParameterValues("career_department");
		String[] work_contents      = request.getParameterValues("work_content");
		
		boolean careerResult = true;
		for(int i = 0; i < prev_companies.length - 1; i++) {
			Career career = new Career(0, id, prev_companies[i], tenureStartDates[i] + "-00", tenureEndDates[i] + "-00", positions[i], career_departments[i], work_contents[i]);
			boolean result = indiDao.insertCareer(career);
			if(!result) careerResult = false;
		}
		
		// 자격증
		String[] names        = request.getParameterValues("name");
		String[] agencies     = request.getParameterValues("agency");
		String[] passes       = request.getParameterValues("pass");
		String[] acquireDates = request.getParameterValues("acquireDate");
		
		boolean licenseResult = true;
		for(int i = 0; i < names.length - 1; i++) {
			License license = new License(0, id, names[i], agencies[i], passes[i], acquireDates[i]);
			boolean result = indiDao.insertLicense(license);
			if(!result) licenseResult = false;
		}
		
		// 포트폴리오
		String[] portfolioNames = request.getParameterValues("portfolioName");
		String[] details        = request.getParameterValues("detail");
		String[] urls           = request.getParameterValues("url");
		String[] urlCount_      = request.getParameterValues("urlCount");
		int[]    urlCount       = new int[urlCount_.length];
		for(int i = 0; i < urlCount_.length - 1; i++) {
			if(urlCount_[i] != null && !urlCount_.equals(""))
				urlCount[i] = Integer.parseInt(urlCount_[i]);
		}
		String[] fileCount_     = request.getParameterValues("fileCount");
		int[]    fileCount      = new int[fileCount_.length];
		for(int i = 0; i < fileCount_.length - 1; i++) {
			if(fileCount_[i] != null && !fileCount_[i].equals(""))
				fileCount[i] = Integer.parseInt(fileCount_[i]);
		}
		
		Collection<Part> parts = request.getParts();
		List<StringBuilder> builderNames = new ArrayList<StringBuilder>();
		List<String> builderSizes = new ArrayList<String>();
		
		for(Part p : parts) {
			if(!p.getName().equals("file") || p.getSize() == 0) continue;
			
			Part file = p;
			String fileName = file.getSubmittedFileName();
			StringBuilder builder = new StringBuilder();
			builder.append(fileName);
			builderNames.add(builder);
			
			long fileSize_ = file.getSize();
			String fileSize = Long.toString(fileSize_);
			builderSizes.add(fileSize);
			
			InputStream fis = file.getInputStream();
			
			String realPath = request.getServletContext().getRealPath("/portfolio_files");
			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size = fis.read(buf)) != -1)
				fos.write(buf, 0, size);
			
			fos.close();
			fis.close();
		}

		boolean portfolioResult = true;
		int urlIdx = 0;
		int fileIdx = 0;
		for(int i = 0; i < portfolioNames.length - 1; i++) {
			String url = "";
			for(int j = 0; j < urlCount[i]; j++) {
				if(j < urlCount[i] - 1)
					url += urls[urlIdx] + "|";
				else
					url += urls[urlIdx];
				urlIdx++;
			}
			
			String fileName = "";
			String fileSize = "";
			for(int j = 0; j < fileCount[i]; j++) {
				if(j < fileCount[i] - 1) {
					fileName += builderNames.get(fileIdx) + "/";
					fileSize += builderSizes.get(fileIdx) + "/";
				} else {
					fileName += builderNames.get(fileIdx);
					fileSize += builderSizes.get(fileIdx);
				}
				fileIdx++;
			}

			Portfolio portfolio = new Portfolio(0, id, portfolioNames[i], details[i], url, fileName, fileSize);
			boolean result = indiDao.insertPortfolio(portfolio);
			if(!result) portfolioResult = false;
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(titleResult && educationResult && careerResult && stackResult && licenseResult && portfolioResult) {
			out.print("<script>alert('이력서를 작성하였습니다.'); location.href = 'resume_management';</script>");
		} else {
			out.print("<script>alert('이력서 작성에 실패하였습니다.'); location.href = 'resume_management';</script>");
		}
	}
}