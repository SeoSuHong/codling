package codling.controller.guest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.InformationDao;
import codling.identity.Announcement;
import codling.identity.Field;

@WebServlet("/search")
public class SearchServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		String corpId = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		if(indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
		} else if(corpId != null) {
			Map<String, String> map = infoDao.getCorpName(corpId);
			String corpName = map.get(corpId);
			request.setAttribute("corpName", corpName);
		}
		
		String search = request.getParameter("search");
		String[] zone = request.getParameterValues("zone");
		String[] career = request.getParameterValues("career");
		String[] task = request.getParameterValues("task");
		
		CorporationDao corpDao = new CorporationDao();
		ArrayList<Field> filed = corpDao.getSearch();
		
		
		ArrayList<Announcement> announcement = corpDao.indexContents();
		
		request.setAttribute("zone", zone);
		request.setAttribute("career", career);
		request.setAttribute("task", task);
		request.setAttribute("search", search);
		request.setAttribute("filed", filed);
		request.setAttribute("announcement", announcement);
		request.getRequestDispatcher("/WEB-INF/guest/search.jsp").forward(request, response);
	}
}