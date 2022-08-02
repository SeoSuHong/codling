package codling.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indiId = request.getParameter("perId");
		String corpId = request.getParameter("comId");
		
		InformationDao dao = new InformationDao();
		Map<String, String> indiMap = dao.getIndiName(indiId);
		Map<String, String> corpMap = dao.getCorpName(corpId);
		
		HttpSession session = request.getSession();
		
		if(indiMap != null) {
			for(String key : indiMap.keySet()) {
				if(key.equals(indiId))
					session.setAttribute("indiId", indiId);
			}
		}
		
		if(corpMap != null) {
			for(String key : corpMap.keySet()) {
				if(key.equals(corpMap))
					session.setAttribute("corpId", corpId);
			}
		}
		response.sendRedirect("index");
	}
}