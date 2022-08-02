package codling.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Individual;

@WebServlet("/individualInfo")
public class IndiInfoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		IndividualDao dao = new IndividualDao();
		Individual individual = dao.getIndividual(id);
		
		request.setAttribute("individual", individual);
		request.getRequestDispatcher("individual_info.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		InformationDao dao = new InformationDao();
		boolean result = dao.deleteIndividual(id);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result) {
			out.print("<script>alert('회원탈퇴가 완료되었습니다.');location.href='index.jsp';</script>");
			out.flush();
			session.invalidate();
		} else {
			out.print("<script>alert('회원탈퇴에 실패하였습니다.');location.href='individualInfo';</script>");
			out.flush();
		}
	}
}
