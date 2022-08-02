package codling.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.InformationDao;
import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/job_accountment")
public class Job_accountmentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationDao corpDao = new CorporationDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		Corporation corporation = corpDao.getCorporation(id);
		JobOpening jobOpening = corpDao.getJobOpening(id);
		int no = Integer.parseInt(request.getParameter("no"));
		Field field = corpDao.getField(no);
		
		request.setAttribute("corporation", corporation);
		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("field", field);
		request.setAttribute("replaceChar", "\n"); // 줄바꿈 <br>처리를 위해
		
		request.getRequestDispatcher("job_accountment.jsp").forward(request, response);
	}
}
