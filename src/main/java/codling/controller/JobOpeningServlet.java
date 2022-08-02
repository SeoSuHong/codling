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

@WebServlet("/jobOpening")
public class JobOpeningServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = 0;
		String no_ = request.getParameter("no");
		if(!no_.equals("") && no_ != null) no = Integer.parseInt(no_);
		
		CorporationDao dao = new CorporationDao();
		JobOpening jobOpening = dao.getJobOpening(no);
		Field field = dao.getField(no);
		
		String id = jobOpening.getCorporation_id();
		Corporation corporation = dao.getCorporation(id);
		
		request.setAttribute("corporation", corporation);
		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("field", field);
		request.setAttribute("replaceChar", "\n"); // 줄바꿈 <br>처리를 위해
		
		request.getRequestDispatcher("/WEB-INF/corporation/jobOpening.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
