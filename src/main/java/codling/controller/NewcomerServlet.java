package codling.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.identity.Announcement;

@WebServlet("/newcomer")
public class NewcomerServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationDao corpDao = new CorporationDao();

		ArrayList<Announcement> announcement = corpDao.newcomerContents();
		
		request.setAttribute("announcement", announcement);
		
		request.getRequestDispatcher("/WEB-INF/public/newcomer.jsp").forward(request, response);
	}
}
