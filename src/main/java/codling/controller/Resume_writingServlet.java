package codling.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Collection;

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
	fileSizeThreshold = 1024*1024,
	maxFileSize = 1024*1024*50,
	maxRequestSize = 1024*1024*50*5 
)
@WebServlet("/resume_writing")
public class Resume_writingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		if(indiId != null) {		
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
		}
		// resume_writing.jsp로 이동
		request.getRequestDispatcher("/WEB-INF/individual/resume_writing.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		List<Education> educationList = new ArrayList<Education>();
		//학력정보
		String[] school = request.getParameterValues("school");
		String[] schoolName = request.getParameterValues("schoolName");
		String[] schoolDateStart = request.getParameterValues("schoolDateStart");
		String[] schoolDateEnd = request.getParameterValues("schoolDateEnd");
		String[] status = request.getParameterValues("status");
		String[] department = request.getParameterValues("department");
		String[] score = request.getParameterValues("score");
		
		for(int i = 0; i < school.length; i++) {
			Education education = new Education(0, indiId, school[i], schoolName[i], schoolDateStart[i], schoolDateEnd[i], status[i], department[i], score[i]);
			educationList.add(education);
		}
		
		IndividualDao dao = new IndividualDao();
		boolean educationResult = dao.setEducation(educationList);
		
		//resumetitle stack update
		String resumetitle = request.getParameter("resumetitle");
		String stack = request.getParameter("stack");
		boolean resumeTitleStack = dao.upDateResumeTitleStack(resumetitle, stack, indiId);
		
		//경력사항
		List<Career> careerList = new ArrayList<Career>();
		String[] perv_company = request.getParameterValues("perv_company");
		String[] tenureStart = request.getParameterValues("tenureStart");
		String[] tenureEnd = request.getParameterValues("tenureEnd");
		String[] position = request.getParameterValues("position");
		String[] company_department = request.getParameterValues("company_department");
		String[] work_content = request.getParameterValues("work_content");
		
		int careerResult = 0;
		if(!perv_company[0].equals("")) {
			for(int i = 0; i < perv_company.length; i++) {
				Career career = new Career(0, indiId, perv_company[i], tenureStart[i], tenureEnd[i], position[i], company_department[i], work_content[i]);
				careerList.add(career);
				careerResult = dao.setCareer(careerList);
			}
		}
		
		//자격증내역
		List<License> licenseList = new ArrayList<License>();
		String[] license_name = request.getParameterValues("license_name");
		String[] agency = request.getParameterValues("agency");
		String[] pass = request.getParameterValues("pass");
		String[] acquireDate = request.getParameterValues("acquireDate");
		
		int licenseResult = 0;
		if(!license_name[0].equals("")) {
			for(int i = 0; i < license_name.length-1; i++) {
				License license = new License(0, indiId, license_name[i], agency[i], pass[i], acquireDate[i]);
				licenseList.add(license);
				licenseResult = dao.setLicense(licenseList);
			}
		}
		
		//포트폴리오
		List<Portfolio> portfolioList = new ArrayList<Portfolio>();
		
		String[] portfolio_name_ = request.getParameterValues("portfolio_name");
		String[] detail_ = request.getParameterValues("detail");
		String[] url_ = request.getParameterValues("url");
		String portfolio_name = null;
		String detail = null;
		String url = null;
		for(int i = 0; i < portfolio_name_.length; i++) {
			if(i < portfolio_name_.length) {
				portfolio_name += (portfolio_name_[i] + " / ");
				detail += (detail_[i] + " / ");
				url += (url_[i] + " / ");
			}else {
				portfolio_name += portfolio_name_[i];
				detail += detail_[i];
				url += url_[i];
			}
		}
		
		int portfolioResult = 0;
		if(!portfolio_name.equals("") && portfolio_name != "") {
				Portfolio portfolio = new Portfolio(0, indiId, portfolio_name, detail, url, "", "", "","");
				portfolioList.add(portfolio);
				portfolioResult = dao.setportfolio(portfolioList);
		}
		
		//첨부파일
		Collection<Part> parts = request.getParts(); //파일 열러개 검사
		StringBuilder builder = new StringBuilder();
		StringBuilder builders = new StringBuilder();
		for(Part p : parts) { //파일 여러개 가지고오기
			
			if(!p.getName().equals("fileName")) continue;
			if(p.getSize() == 0) continue;
			
			Part filePart = p; // 업로드한 파일 가지고오기
			String fileName_ = filePart.getSubmittedFileName(); //파일명 읽어오기
			builder.append(fileName_);
			builder.append(" / ");
			builders.append(p.getSize());
			builders.append(" / ");
			
			InputStream fis = filePart.getInputStream();
			
			String realPath = request.getServletContext().getRealPath("/upload");
			
			File path = new File(realPath);
			if(!path.exists())
				path.mkdirs();
			
			String filePath = realPath + File.separator + fileName_;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int fileSize_;
			while((fileSize_ = fis.read(buf)) != -1)
				fos.write(buf,0,fileSize_);
			
			fos.close();
			fis.close();
			
		}
		
		builder.delete(builder.length()-1, builder.length());
		builders.delete(builders.length()-1, builders.length());
		String[] fileTitle_ = request.getParameterValues("fileTitle");
		String[] file_detail_ = request.getParameterValues("file_detail");
		String fileTitle = null;
		String file_detail = null;
		
		for(int i = 0; i < fileTitle_.length; i++) {
			if(i < fileTitle_.length) {
				fileTitle += (fileTitle_[i] + " / ");
				file_detail += (file_detail_[i] + " / ");
			}else {
				fileTitle += fileTitle_[i];
				file_detail += file_detail_[i];
			}
		}
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(educationResult && resumeTitleStack)
			out.print("<script>alert('이력서 등록에 성공하였습니다.'); location.href = 'resume_management';</script>");
		else
			out.print("<script>alert('이력서 등록에 실패하였습니다.'); location.href = 'resume_writing';</script>");
	}

}