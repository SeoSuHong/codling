package codling.controller.individual;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Career;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

@WebServlet("/resume_update")
public class Resume_updateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("indiId");
		
		// DAO
		InformationDao infoDao = new InformationDao();
		IndividualDao indiDao = new IndividualDao();
		
		String name = infoDao.getIndividualName(id);
		request.setAttribute("name", name);
		
		// 개인회원 정보
		Individual individual = indiDao.getIndividual(id);
		
		// 학력 정보
		List<Education> educations = indiDao.getEducation(id);
		
		// 경력 정보
		List<Career> careers = indiDao.getCareer(id);
		
		// 자격증 정보
		List<License> licenses = indiDao.getLicense(id);
		
		// 포트폴리오 정보
		List<Portfolio> portfolios = indiDao.getPortfolio(id);
		
		request.setAttribute("individual", individual);
		request.setAttribute("educations", educations);
		request.setAttribute("careers", careers);
		request.setAttribute("licenses", licenses);
		request.setAttribute("portfolios", portfolios);
		
		request.getRequestDispatcher("/WEB-INF/individual/resume_update.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}