package codling.controller.corporation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/job_accountment")
public class Job_accountmentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		CorporationDao corpDao = new CorporationDao();
		
		String no_ = request.getParameter("no");
		int no = 0;
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		Corporation corporation = corpDao.getCorporation(id);
		JobOpening jobOpening = corpDao.getJobOpening(no);
		List<Field> fields = corpDao.getAllField(no);
		
		request.setAttribute("corporation", corporation);
		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("fields", fields);
		request.setAttribute("replaceChar", "\n"); // 줄바꿈 <br>처리를 위해
		
		request.getRequestDispatcher("/WEB-INF/corporation/job_accountment.jsp").forward(request, response);
	}
}
