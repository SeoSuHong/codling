package codling.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.InformationDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/public/logIn.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indiId = request.getParameter("perId");
		String corpId = request.getParameter("comId");
		
		InformationDao dao = new InformationDao();
		Map<String, String> indiMap = dao.getIndiName(indiId);
		Map<String, String> corpMap = dao.getCorpName(corpId);
		
		HttpSession session = request.getSession();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(indiMap != null) {
			for(String key : indiMap.keySet()) {
				if(key.equals(indiId)) {
					String name = indiMap.get(key);
					session.setAttribute("indiId", indiId);
					out.print("<script>alert('" + name + "님 환영합니다.'); location.href = 'index';</script>");
				}
			}
		} else if(corpMap != null) {
			for(String key : corpMap.keySet()) {
				if(key.equals(corpId)) {
					String name = corpMap.get(key);
					session.setAttribute("corpId", corpId);
					out.print("<script>alert('" + name + "님 환영합니다.'); location.href = 'index';</script>");
				}
			}
		} else {
			out.print("<script>alert('아이디 또는 비밀번호를 확인해 주세요.'); history.back();</script>");
		}
	}
}