package codling.controller.guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codling.dao.InformationDao;

@WebServlet("/idCheck")
public class IdCheckServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String position = request.getParameter("position");
		boolean check = false;
		
		InformationDao infoDao = new InformationDao();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(position.equals("individual")) {
			check = infoDao.checkIndividualId(id);
			out.print(check);
			
		} else if(position.equals("corporation")) {
			check = infoDao.checkCorporationId(id);
			out.print(check);
		}
	}
}