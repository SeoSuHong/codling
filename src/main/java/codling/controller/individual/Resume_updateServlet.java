package codling.controller.individual;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.InformationDao;

@WebServlet("/resume_update")
public class Resume_updateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		String name = infoDao.getIndividualName(id);
		
		request.setAttribute("name", name);
		
		
		
		request.getRequestDispatcher("/WEB-INF/individual/resume_update.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}