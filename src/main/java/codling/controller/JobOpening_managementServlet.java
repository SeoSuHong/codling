package codling.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.InformationDao;
import codling.identity.AllJobOpening;

@WebServlet("/jobOpening_management")
public class JobOpening_managementServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getCorpName(id);
		
		String name = map.get(id);
		request.setAttribute("name", name);
		
		CorporationDao corpDao = new CorporationDao();
		List<AllJobOpening> jobOpenings = corpDao.getAllJobOpening(id);
		
		request.setAttribute("jobOpenings", jobOpenings);
		
		request.getRequestDispatcher("/WEB-INF/corporation/jobOpening_management.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
