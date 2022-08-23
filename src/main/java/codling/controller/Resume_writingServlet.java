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
		String[] schoolStartDate = request.getParameterValues("schoolStartDate");
		String[] schoolEndDate = request.getParameterValues("schoolEndDate");
		String[] status = request.getParameterValues("status");
		String[] department = request.getParameterValues("department");
		String[] score = request.getParameterValues("score");
		
		for(int i = 0; i < school.length; i++) {
			Education education = new Education(0, indiId, school[i], schoolName[i], schoolStartDate[i], schoolEndDate[i], status[i], department[i], score[i]);
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
		String[] license_name_ = request.getParameterValues("license_name");
		String[] agency_ = request.getParameterValues("agency");
		String[] pass_ = request.getParameterValues("pass");
		String[] acquireDate_ = request.getParameterValues("acquireDate");
		String license_name = "";
		String agency = "";
		String pass = "";
		String acquireDate = "";
		
		for(int i = 0; i < license_name_.length-1; i++) {
			if(i != license_name_.length-2) {
				license_name += (license_name_ [i] + " / ");
				agency += (agency_ [i] + " / ");
				pass += (pass_ [i] + " / ");
				acquireDate += (acquireDate_ [i] + " / ");
			}else {
				license_name += license_name_ [i];
				agency += agency_ [i];
				pass += pass_ [i];
				acquireDate += acquireDate_ [i];
			}
		}
		
		int licenseResult = 0;
		
		if(!license_name.equals("") && license_name != "") {
				License license = new License(0, indiId, license_name, agency, pass, acquireDate);
				licenseList.add(license);
				licenseResult = dao.setLicense(licenseList);
		}
		
		//포트폴리오
		List<Portfolio> portfolioList = new ArrayList<Portfolio>();
		
		String[] portfolio_name_ = request.getParameterValues("portfolio_name");
		String[] detail_ = request.getParameterValues("detail");
		String[] url_ = request.getParameterValues("url");
		String portfolio_name = "";
		String detail = "";
		String url = "";
		for(int i = 0; i < portfolio_name_.length-1; i++) {
			if(i != portfolio_name_.length -2) {
				portfolio_name += (portfolio_name_[i] + " | ");
				detail += (detail_[i] + " | ");
				url += (url_[i] + " | ");
			}else {
				portfolio_name += portfolio_name_[i];
				detail += detail_[i];
				url += url_[i];
			}
		}
		
		int portfolioResult = 0;
		if(!portfolio_name.equals("") && portfolio_name != "") {
				Portfolio portfolio = new Portfolio(0, indiId, portfolio_name, detail, url, "", "", "", "","");
				portfolioList.add(portfolio);
				portfolioResult = dao.setportfolio(portfolioList);
		}
		
		//첨부파일
		List<Portfolio> fileuploadList = new ArrayList<Portfolio>();
		Collection<Part> parts = request.getParts(); //파일 열러개 검사
		StringBuilder builder = new StringBuilder();
		StringBuilder builders = new StringBuilder();
		StringBuilder builder_fileaddress = new StringBuilder();
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
			
			builder_fileaddress.append(filePath);
			builder_fileaddress.append(" | ");
			
			byte[] buf = new byte[1024];
			int fileSize_;
			while((fileSize_ = fis.read(buf)) != -1)
				fos.write(buf,0,fileSize_);
			
			fos.close();
			fis.close();
			
		}
		
		if(builder.toString() != "" && !builder.toString().equals("")) {
			builder.delete(builder.length()-2, builder.length());
			builders.delete(builders.length()-2, builders.length());
		}
		
		String[] fileTitle_ = request.getParameterValues("fileTitle");
		String[] file_detail_ = request.getParameterValues("file_detail");
		String fileTitle = "";
		String file_detail = "";
		
		for(int i = 0; i < fileTitle_.length-1; i++) {
			if(i != fileTitle_.length-2) {
				fileTitle += (fileTitle_[i] + " / ");
				file_detail += (file_detail_[i] + " / ");
			}else {
				fileTitle += fileTitle_[i];
				file_detail += file_detail_[i];
			}
		}
		
		boolean fileuploadResult = false;
		if(!fileTitle.equals("") && fileTitle != "") {
				Portfolio fileupload = new Portfolio(0, indiId, "", "", "", fileTitle, builder.toString(), builder_fileaddress.toString(), file_detail, builders.toString());
				fileuploadList.add(fileupload);
				fileuploadResult = dao.setfile(fileuploadList);
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
