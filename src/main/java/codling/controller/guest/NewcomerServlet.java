package codling.controller.guest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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

@WebServlet("/newcomer")
public class NewcomerServlet extends HttpServlet{
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
		
		CorporationDao corpDao = new CorporationDao();
		
		ArrayList<Announcement> announcement = corpDao.newcomerContents();
		List<String> fieldNames = corpDao.getAllFieldName();
		
		request.setAttribute("announcement", announcement);
		request.setAttribute("fieldNames", fieldNames);
		
		request.getRequestDispatcher("/WEB-INF/guest/newcomer.jsp").forward(request, response);
	}
}
