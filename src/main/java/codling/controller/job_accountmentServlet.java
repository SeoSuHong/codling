package codling.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codling.dao.CorporationDao;
import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/job_accountmentServlet")
public class job_accountmentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationDao corpDao = new CorporationDao();
		
		Corporation corporation = corpDao.getCorporation("ezen");
		JobOpening jobOpening = corpDao.getJobOpening("ezen");
		int no = jobOpening.getNo();
		Field field = corpDao.getField(no);
		
		request.setAttribute("coporation", corporation);
		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("field", field);
		
		request.getRequestDispatcher("job_accountment.jsp").forward(request, response);
	}

}
