package codling.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.InformationDao;

@WebServlet("/applicant_status")
public class Applicant_statusServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getCorpName(id);
		String name = map.get(id);
		request.setAttribute("name", name);
		
		int no = 0;
		String no_ = request.getParameter("no");
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		
		request.getRequestDispatcher("/WEB-INF/corporation/applicant_status.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}