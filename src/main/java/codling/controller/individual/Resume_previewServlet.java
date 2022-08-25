package codling.controller.individual;

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
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

@MultipartConfig(
	fileSizeThreshold = 1024*1024,
	maxFileSize = 1024*1024*50,
	maxRequestSize = 1024*1024*50*5 
)
@WebServlet("/resume_preview")
public class Resume_previewServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		IndividualDao indiDao = new IndividualDao();
		if(indiId != null) {		
			Map<String, String> map = infoDao.getIndiName(indiId);
			String name = map.get(indiId);
			Individual individual = indiDao.getIndividual(indiId);
			Education education = indiDao.getEducation(indiId);
			Career career = indiDao.getCareer(indiId);
			License license = indiDao.getLicense(indiId);
			Portfolio portfolio = indiDao.getportfolio(indiId);
			Portfolio fileupload = indiDao.getfileupload(indiId);
			
			request.setAttribute("fileupload", fileupload);
			request.setAttribute("portfolio", portfolio);
			request.setAttribute("license", license);
			request.setAttribute("career", career);
			request.setAttribute("education", education);
			request.setAttribute("individual", individual);
			request.setAttribute("name", name);	
		}
		// resume_preview.jsp로 이동
		request.getRequestDispatcher("/WEB-INF/individual/resume_preview.jsp").forward(request, response);
	}
}