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

@WebServlet("/search")
public class searchServlet extends HttpServlet{
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
		
		// 검색 키워드
		String search = request.getParameter("search");
		
		// 지역 키워드
		String area = "";
		String[] areas = request.getParameterValues("area");
		
		if(areas != null) {
			for(int i = 0; i < areas.length; i++) {
				if(i != areas.length - 1) area += areas[i] + "|";
				else area += areas[i];
			}
		} else {
			area = "[가-힇]|[a-z]|[0-9]";
		}
		
		// 분야 키워드
		String field = "";
		String[] fields = request.getParameterValues("field");
		
		if(fields != null) {
			for(int i = 0; i < fields.length; i++) {
				if(i != fields.length - 1) field += fields[i] + "|";
				else field += fields[i];
			}
		} else {
			field = "[가-힇]|[a-z]|[0-9]";
		}
		
		// 경력 키워드
		String career = "";
		String[] careers = request.getParameterValues("career");
		
		if(careers != null) {
			for(int i = 0; i < careers.length; i++) {
				if(careers[i].equals("신입")) {
					career = "신입";
				}
				else {
					
				}
			}
		} else {
			career = "[가-힇]|[a-z]|[0-9]";
		}
		
		// 급여 키워드
		String pay = "";
		String[] pays = request.getParameterValues("pay");
		
		List<String> fieldNames = corpDao.getAllFieldName();
		ArrayList<Announcement> announcement = null;
		
		request.setAttribute("fieldNames", fieldNames);
		request.setAttribute("announcement", announcement);
		request.getRequestDispatcher("/WEB-INF/guest/search.jsp").forward(request, response);
	}
}