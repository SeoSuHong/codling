package codling.controller.individual;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getIndiName(id);
		String name = map.get(id);
		
		request.setAttribute("name", name);
		request.getRequestDispatcher("/WEB-INF/individual/resume_writing.jsp").forward(request, response);
	}

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
		for(int i = 0; i < schools.length; i++) {
			Education education = new Education(0, id, schools[i], schoolNames[i], schoolStartDates[i], schoolEndDates[i], statuses[i], departments[i], scores[i]);
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
		for(int i = 0; i < prev_companies.length; i++) {
			Career career = new Career(0, id, prev_companies[i], tenureStartDates[i], tenureEndDates[i], positions[i], departments[i], work_contents[i]);
			boolean result = indiDao.insertCareer(career);
			if(!result) careerResult = false;
		}
		
		// 자격증
		String[] names        = request.getParameterValues("name");
		String[] agencies     = request.getParameterValues("agency");
		String[] passes       = request.getParameterValues("pass");
		String[] acquireDates = request.getParameterValues("acquireDate");
		
		boolean licenseResult = true;
		for(int i = 0; i < names.length; i++) {
			License license = new License(0, id, names[i], agencies[i], passes[i], acquireDates[i]);
			boolean result = indiDao.insertLicense(license);
			if(!result) licenseResult = false;
		}
		
		// 포트폴리오
		String[] portfolioNames = request.getParameterValues("portfolioName");
		String[] urls           = request.getParameterValues("url");
		String[] details        = request.getParameterValues("detail");
		String[] fileNames      = null;
		int[]    fileSizes      = null;
		
		boolean portfolioResult = true;
		for(int i = 0; i < portfolioNames.length; i++) {
			Portfolio portfolio = new Portfolio(i, id, portfolioNames[i], details[i], urls[i], fileNames[i], fileSizes[i]);
			boolean result = indiDao.insertPortfolio(portfolio);
			if(!result) portfolioResult = false;
		}
		
		
		
		
//		Collection<Part> parts = request.getParts();
//		StringBuilder builder = new StringBuilder();
//		String[] fileCounts = request.getParameterValues("fileCount");
//		
//		for(Part p : parts) {
//			if(!p.getName().equals("file")) continue;
//			
//			Part file = p;
//			String fileName = file.getSubmittedFileName();
//			builder.append(fileName);
//			builder.append("|");
//			
//			InputStream fis = file.getInputStream();
//			
//			String realPath = request.getServletContext().getRealPath("/portfolio_files");
//			String filePath = realPath + File.separator + fileName;
//			FileOutputStream fos = new FileOutputStream(filePath);
//			
//			byte[] buf = new byte[1024];
//			int size = 0;
//			while((size = fis.read(buf)) != -1)
//				fos.write(buf, 0, size);
//			
//			fos.close();
//			fis.close();
//		}
//		builder.delete(builder.length() - 1, builder.length());
	}
	

}
