package codling.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Apply;

@WebServlet("/resume_management")
public class Resume_managementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		// 회원 이름 가져오기
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getIndiName(id);
		String name = map.get(id);
		request.setAttribute("name", name);
		
		// 지원한 공고 데이터 가져오기
		IndividualDao indiDao = new IndividualDao();
		List<Apply> applys = indiDao.getApply(id);
		request.setAttribute("applys", applys);
		
		request.getRequestDispatcher("/WEB-INF/individual/resume_management.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
