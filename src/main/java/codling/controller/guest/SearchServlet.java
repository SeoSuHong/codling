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
		
		// 급여 키워드
		String strPay = "";
		int intPay = 0;
		String pay = request.getParameter("pay");
		
		ArrayList<Announcement> announcement = null;		
		
		if(pay != null) {
			intPay = Integer.parseInt(pay);
			announcement = corpDao.searchJobOpening(search, area, field, intPay);
			
		} else {
			strPay = "[가-힇]|[a-z]|[0-9]";
			announcement = corpDao.searchJobOpening(search, area, field, strPay);
		}
		
		// 경력 키워드 (선택한 경력의 이상 경력 삭제)
		int career = 0;
		String career_ = request.getParameter("career");
		if(career_ != null && !career_.equals("신입")) career = Integer.parseInt(career_);
		
		
		for(int i = announcement.size() - 1; i >= 0; i--) {
			if (career_ != null && career_.equals("신입")) {
				String annoCareer = announcement.get(i).getCareer();
				if(!annoCareer.contains("신입")) {
					announcement.remove(i);
				}
				System.out.println(i);
			} else if(career != 0) {
				String[] annoCareers = announcement.get(i).getCareer().split("/");
				for(String car : annoCareers) {
					if(!car.equals("신입")) {
						int intCar = Integer.parseInt(car);
						if(intCar > career) announcement.remove(i);
					}
				}
			}
		}
		
		List<String> fieldNames = corpDao.getAllFieldName();
		
		List<String>areaList = new ArrayList<String>();
		
		if(areas != null) {
			for(String a : areas) {
				areaList.add(a);
			}
		}
		
		List<String>fieldList = new ArrayList<String>();
		
		if(fields != null) {
			for(String f : fields) {
				fieldList.add(f);
			}
		}
		
		request.setAttribute("s", search);
		request.setAttribute("a", areaList);
		request.setAttribute("f", fieldList);
		request.setAttribute("c", career_);
		request.setAttribute("p", pay);
		
		request.setAttribute("fieldNames", fieldNames);
		request.setAttribute("announcement", announcement);
		request.getRequestDispatcher("/WEB-INF/guest/search.jsp").forward(request, response);
	}
}