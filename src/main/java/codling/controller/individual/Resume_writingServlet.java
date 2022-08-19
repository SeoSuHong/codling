package codling.controller.individual;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.InformationDao;

@WebServlet("/resume_writing")
public class Resume_writingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getIndiName(id);
		String name = map.get(id);
		
		request.setAttribute("name", name);
		request.getRequestDispatcher("/WEB-INF/individual/resume_writing.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
