package codling.controller.individual;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024, 
		maxFileSize = 1024 * 1024 * 50,
		maxRequestSize = 1024 * 1024 * 50 * 5
	)
@WebServlet("/resume_update")
public class Resume_updateServlet extends HttpServlet {
	int eduSize, carSize, licSize, porSize;  // 기존 사항들의 size
	int[] eduNo, carNo, licNo, porNo;  // 기존 사항들의 no
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("indiId");
		
		// DAO
		InformationDao infoDao = new InformationDao();
		IndividualDao indiDao = new IndividualDao();
		
		String name = infoDao.getIndividualName(id);
		request.setAttribute("name", name);
		
		// 개인회원 정보
		Individual individual = indiDao.getIndividual(id);
		
		// 학력 정보
		List<Education> educations = indiDao.getEducation(id);
		eduSize = educations.size();
		eduNo = new int[eduSize];
		for(int i = 0; i < eduSize; i++) {
			eduNo[i] = educations.get(i).getNo();
		}
		
		// 경력 정보
		List<Career> careers = indiDao.getCareer(id);
		carSize = careers.size();
		carNo = new int[carSize];
		for(int i = 0; i < carSize; i++) {
			carNo[i] = careers.get(i).getNo();
		}
		
		// 자격증 정보
		List<License> licenses = indiDao.getLicense(id);
		licSize = licenses.size();
		licNo = new int[licSize];
		for(int i = 0; i < licSize; i++) {
			licNo[i] = licenses.get(i).getNo();
		}
		
		// 포트폴리오 정보
		List<Portfolio> portfolios = indiDao.getPortfolio(id);
		porSize = portfolios.size();
		porNo = new int[porSize];
		for(int i = 0; i < porSize; i++) {
			porNo[i] = portfolios.get(i).getNo();
		}
		
		request.setAttribute("individual", individual);
		request.setAttribute("educations", educations);
		request.setAttribute("careers", careers);
		request.setAttribute("licenses", licenses);
		request.setAttribute("portfolios", portfolios);
		
		request.getRequestDispatcher("/WEB-INF/individual/resume_update.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		IndividualDao indiDao = new IndividualDao();
		
		// 이력서 제목 and 스택
		String title = request.getParameter("title");
		String stack = request.getParameter("stacks");
		boolean resumeResult = indiDao.updateResume(id, title, stack);
		
		
		// 학력사항
		String[] schools          = request.getParameterValues("school");
		String[] schoolNames      = request.getParameterValues("schoolName");
		String[] schoolStartDates = request.getParameterValues("schoolStartDate");
		String[] schoolEndDates   = request.getParameterValues("schoolEndDate");
		String[] statuses         = request.getParameterValues("status");
		String[] departments      = request.getParameterValues("department");
		String[] scores_          = request.getParameterValues("score");
		
		double[] scores = new double[scores_.length];
		for(int  i = 0; i < scores_.length; i++) {
			if(scores_[i] != null && !scores_[i].equals("")) scores[i] = Double.parseDouble(scores_[i]);
		}
		
		boolean educationResult = true;
		for(int i = 0; i < schools.length - 1; i++) {
			if(i < eduSize) {  // 수정한 갯수가 기존 갯수보다 작거나 같으면 UPDATE
				Education education = new Education(eduNo[i], id, schools[i], schoolNames[i], schoolStartDates[i] + "-00", schoolEndDates[i] + "-00", statuses[i], departments[i], scores[i]);
				boolean result = indiDao.updateEducation(education);
				if(!result) educationResult = false;
			}
		}
		
		List<Education> educations = indiDao.getEducation(id);  // 업데이트 된 학력사항
		if(schools.length - 1 < eduSize) {
			for(int i = 0; i < schools.length - 1; i++) {
				for(int j = 0; j < educations.size(); j++) {
					if(!educations.get(j).getSchoolName().equals(schoolNames[i])) {
						boolean result = indiDao.deleteEducation(educations.get(j).getNo());
						if(!result) educationResult = false;
					}
				}
			}
		} else if(schools.length - 1 > eduSize) {
			for(int i = eduSize; i < schools.length - 1; i++) {
				Education education = new Education(0, id, schools[i], schoolNames[i], schoolStartDates[i] + "-00", schoolEndDates[i] + "-00", statuses[i], departments[i], scores[i]);
				boolean result = indiDao.insertEducation(education);
				if(!result) educationResult = false;
			}
		}
		
		// 경력사항
		String[] prev_companies     = request.getParameterValues("prev_company");
		String[] tenureStartDates   = request.getParameterValues("tenureStartDate");
		String[] tenureEndDates     = request.getParameterValues("tenureEndDate");
		String[] positions          = request.getParameterValues("position");
		String[] career_departments = request.getParameterValues("career_department");
		String[] work_contents      = request.getParameterValues("work_content");
		
		boolean careerResult = true;
		for(int i = 0; i < prev_companies.length - 1; i++) {
			if(i < carSize) {
				Career career = new Career(carNo[i], id, prev_companies[i], tenureStartDates[i] + "-00", tenureEndDates[i] + "-00", positions[i], career_departments[i], work_contents[i]);
				boolean result = indiDao.updateCareer(career);
				if(!result) careerResult = false;
			}
		}
		
		List<Career> careers = indiDao.getCareer(id);
		if(prev_companies.length - 1 < carSize) {
			for(int i = 0; i < prev_companies.length - 1; i++) {
				for(int j = 0; j < careers.size(); j++) {
					if(!careers.get(j).getPrev_company().equals(prev_companies[i])) {
						boolean result = indiDao.deleteCareer(careers.get(j).getNo());
						if(!result) careerResult = false;
					}
				}
			}
		} else if(prev_companies.length - 1 > carSize) {
			for(int i = carSize; i < prev_companies.length - 1; i++) {
				Career career = new Career(0, id, prev_companies[i], tenureStartDates[i] + "-00", tenureEndDates[i] + "-00", positions[i], departments[i], work_contents[i]);
				boolean result = indiDao.insertCareer(career);
				if(!result) careerResult = false;
			}
		}
		
		// 자격증
		String[] names        = request.getParameterValues("name");
		String[] agencies     = request.getParameterValues("agency");
		String[] passes       = request.getParameterValues("pass");
		String[] acquireDates = request.getParameterValues("acquireDate");
		
		boolean licenseResult = true;
		for(int i = 0; i < names.length - 1; i++) {
			if(i < licSize) {
				License license = new License(licNo[i], id, names[i], agencies[i], passes[i], acquireDates[i]);
				boolean result = indiDao.updateLicense(license);
				if(!result) licenseResult = false;
			}
		}
		
		List<License> licenses = indiDao.getLicense(id);
		if(names.length - 1 < licSize) {
			for(int i = 0; i < names.length - 1; i++) {
				for(int j = 0; j < licenses.size(); j++) {
					if(!licenses.get(j).getName().equals(names[i])) {
						boolean result = indiDao.deleteLicense(licenses.get(j).getNo());
						if(!result) licenseResult = false;
					}
				}
			}
		} else if(names.length - 1 > licSize) {
			for(int i = licSize; i < names.length - 1; i++) {
				License license = new License(0, id, names[i], agencies[i], passes[i], acquireDates[i]);
				boolean result = indiDao.insertLicense(license);
				if(!result) licenseResult = false;
			}
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
		String[] prev_file_      = request.getParameterValues("prev_file");
		List<String> prev_file = new ArrayList<String>();
		for(int i = 0; i < prev_file_.length; i++) {
			prev_file.add(prev_file_[i]);
		}
		
		Collection<Part> parts = request.getParts();
		List<StringBuilder> builderNames = new ArrayList<StringBuilder>();
		List<String> builderSizes = new ArrayList<String>();
		
		String realPath = request.getServletContext().getRealPath("/portfolio_files");  // 업로드 파일 관리 폴더의 절대경로
		
		List<Portfolio> portfolios = indiDao.getPortfolio(id);
		List<String> deleteFiles = new ArrayList<String>();
		for(int i = 0; i < portfolios.size(); i++) {
			String[] curr_file = portfolios.get(i).getFileName().split("/");
			for(int j = 0; j < curr_file.length; j++) {
				if(!prev_file.contains(curr_file[j])) deleteFiles.add(curr_file[j]);
			}
		}
		
		for(int i = 0; i < deleteFiles.size(); i++) {
			System.out.println(deleteFiles.get(i));
		}
//		String deleteFileName = portfolios.get(i).getFileName();
//		String deleteFilePath = realPath + File.separator + deleteFileName;
//		File deleteFile = new File(deleteFilePath);
//		if(deleteFile.exists()) deleteFile.delete();

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
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(resumeResult && educationResult && careerResult && licenseResult && portfolioResult) {
			out.print("<script>alert('이력서를 수정하였습니다.'); location.href = 'resume_preview?id=" + id + "';</script>");
		} else {
			out.print("<script>alert('이력서 수정에 실패하였습니다.'); location.href = 'resume_preview?id=" + id + "';</script>");
		}
	}
}