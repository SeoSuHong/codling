package codling.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Announcement;
import codling.identity.Education;
import codling.identity.Individual;

@WebServlet("/resume_management")
public class Resume_managementServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		IndividualDao indiviDao = new IndividualDao();
		if(indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
			
			Individual individual = indiviDao.getIndividual(indiId);
			ArrayList<Education> Education = indiviDao.getEducation(indiId);
			
			request.setAttribute("Individual", individual);
			request.setAttribute("Education", Education);
		} 
		
		request.getRequestDispatcher("/WEB-INF/individual/resume_management.jsp").forward(request, response);
	}
}