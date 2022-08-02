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
import codling.identity.JobOpeningManagement;
@WebServlet("/jobOpening_Management")
public class JobOpening_Management extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationDao corpDao = new CorporationDao();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		id = "ezen";
		ArrayList<JobOpeningManagement> jobOpeningManagement = corpDao.jobOpeningManagement(id);
		
		request.setAttribute("id", id);
		request.setAttribute("jobOpeningManagement", jobOpeningManagement);
		request.getRequestDispatcher("jobOpening_management.jsp").forward(request, response);
	}
}
