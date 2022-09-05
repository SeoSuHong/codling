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
import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;
import codling.identity.RankJobOpening;

@WebServlet("/index")
public class IndexServlet extends HttpServlet{
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
		
		List<RankJobOpening> ranks = new ArrayList<RankJobOpening>();
		List<JobOpening> rankJobOpenings = corpDao.getRankJobOpening();
		
		RankJobOpening rank = new RankJobOpening();
		
		for(int i = 0; i < rankJobOpenings.size(); i++) {
			JobOpening jobOpening = rankJobOpenings.get(i);
			int no = jobOpening.getNo();
			String corporation_id = jobOpening.getCorporation_id();
			
			Corporation corporation = corpDao.getCorporation(corporation_id);
			String corporateName = corporation.getCorporateName();
			
			String title = jobOpening.getTitle();
			
			String fieldName = "";
			List<Field> rankFields = corpDao.getAllField(no);
			for(int j = 0; j < rankFields.size(); j++) {
				Field field = rankFields.get(i);
				String name = field.getName();
				fieldName += name;
				if(j != rankFields.size() - 1) fieldName += " | ";
			}
		}
		
		
		ArrayList<Announcement> announcement = corpDao.indexContents();
		
		List<String> fieldNames = corpDao.getAllFieldName();
		
		request.setAttribute("fieldNames", fieldNames);
		request.setAttribute("announcement", announcement);
		request.getRequestDispatcher("/WEB-INF/guest/index.jsp").forward(request, response);
	}
}