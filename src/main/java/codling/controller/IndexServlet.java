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

@WebServlet("/index")
public class IndexServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationDao corpDao = new CorporationDao();
		
		ArrayList<Announcement> announcement = corpDao.indexContents();
		
		request.setAttribute("announcement", announcement);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
