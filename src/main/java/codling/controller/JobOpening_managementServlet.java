package codling.controller;

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
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/jobOpening_management")
public class JobOpening_managementServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getCorpName(id);
		
		String name = map.get(id);
		request.setAttribute("name", name);
		
		CorporationDao corpDao = new CorporationDao();
		List<JobOpening> allJobOpening = corpDao.getAllJobOpening(id);
		List<Field> fields = new ArrayList<Field>();
		for(JobOpening jobOpening : allJobOpening) {
			int no = jobOpening.getNo();
			List<Field> allField = corpDao.getAllField(no);
			for(Field field : allField) {
				fields.add(field);
			}
		}
		request.setAttribute("allJobOpening", allJobOpening);
		request.setAttribute("fields", fields);
		
		request.getRequestDispatcher("/WEB-INF/corporation/jobOpening_management.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
