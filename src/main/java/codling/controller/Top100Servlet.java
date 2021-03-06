package codling.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codling.dao.CorporationDao;
import codling.identity.Announcement;

@WebServlet("/top100")
public class Top100Servlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationDao corpDao = new CorporationDao();
		
		ArrayList<Announcement> announcement = corpDao.top100Contents();
		
		request.setAttribute("announcement", announcement);
		
		request.getRequestDispatcher("/WEB-INF/public/top100.jsp").forward(request, response);
	}
}
