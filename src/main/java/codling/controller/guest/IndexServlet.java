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
		
		for(int i = 0; i < rankJobOpenings.size(); i++) {
			JobOpening jobOpening = rankJobOpenings.get(i);
			int no = jobOpening.getNo();
			String corporation_id = jobOpening.getCorporation_id();
			
			Corporation corporation = corpDao.getCorporation(corporation_id);
			String corporateName = corporation.getCorporateName();
			
			String title = jobOpening.getTitle();
			
			String fieldName = "";
			String stack = "";
			String career = "";
			String position = "";
			String workDay = "";
			List<Field> rankFields = corpDao.getAllField(no);
			for(int j = 0; j < rankFields.size(); j++) {
				Field field = rankFields.get(j);
				
				fieldName += field.getName();
				
				String[] stacks = field.getStack().split("/");
				for(int k = 0; k < stacks.length; k++) {
					stack += stacks[k];
					if(k != stacks.length - 1) stack += " · ";
				}

				String[] careers = field.getCareer().split("/");
				for(int k = 0; k < careers.length; k++) {
					if(careers.length > 1) {
						if(careers[k].equals("신입"))
							career += careers[k] + " or ";
						else
							career += careers[k] + "년↑";
					} else {
						if(careers[k].equals("신입"))
							career += careers[k];
						else
							career += careers[k] + "년↑";
					}
				}
				position += field.getPosition();
				String wd = field.getWorkDay();
				if(wd.equals("월-금")) wd = "주5일(월~금)";
				workDay += wd;
				
				if(j != rankFields.size() - 1) {
					fieldName += " | ";
					stack += " | ";
					career += " | ";
					position += " | ";
					workDay += " | ";
				}
				
			}
			String region = jobOpening.getRegion();
			if(jobOpening.getDetailRegion() != null)
				region += " " + jobOpening.getDetailRegion();
			String date = "";
			String[] startDate = jobOpening.getStartDate().split("-");
			String[] endDate = jobOpening.getEndDate().split("-");
			for(int j = 0; j < startDate.length; j++) {
				date += startDate[j];
				if(j != startDate.length - 1) date += ".";
			}
			
			date += " - ";
			
			for(int j = 0; j < endDate.length; j++) {
				date += endDate[j];
				if(j != endDate.length - 1) date += ".";
			}
			
			RankJobOpening rankJobOpening = new RankJobOpening(no, corporateName, title, fieldName, stack, career, position, workDay, region, date);
			ranks.add(rankJobOpening);
		}
		
		ArrayList<Announcement> announcement = corpDao.indexContents();
		
		List<String> fieldNames = corpDao.getAllFieldName();
		
		request.setAttribute("ranks", ranks);
		request.setAttribute("fieldNames", fieldNames);
		request.setAttribute("announcement", announcement);
		request.getRequestDispatcher("/WEB-INF/guest/index.jsp").forward(request, response);
	}
}