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
import codling.identity.CoverLetter;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

@WebServlet("/resume_preview")
public class Resume_previewServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		InformationDao infoDao = new InformationDao();
		String name = "";
		if(session.getAttribute("indiId") != null) {
			String id = (String)session.getAttribute("indiId");
			name = infoDao.getIndividualName(id);
		} else if(session.getAttribute("corpId") != null) {
			String id = (String)session.getAttribute("corpId");
			name = infoDao.getCorporationName(id);
		}
		request.setAttribute("name", name);
		
		String id = request.getParameter("id");
		String coverLetter_no_ = request.getParameter("coverLetter_no");
		int coverLetter_no = 0;
		
		if(coverLetter_no_ != null && !coverLetter_no_.equals(""))
			coverLetter_no = Integer.parseInt(coverLetter_no_);
		
		IndividualDao dao = new IndividualDao();
		// 개인회원 정보
		Individual individual = dao.getIndividual(id);
		
		// 이력서 학력사항
		List<Education> educations = dao.getEducation(id);
		
		// 이력서 경력사항
		List<Career> careers = dao.getCareer(id);
		
		// 이력서 자격증
		List<License> licenses = dao.getLicense(id);
		
		// 이력서 포트폴리오
		List<Portfolio> portfolios = dao.getPortfolio(id);
		
		// 자기소개서
		CoverLetter coverLetter = dao.getCoverLetter(coverLetter_no);
		
		request.setAttribute("individual", individual);
		request.setAttribute("educations", educations);
		request.setAttribute("careers", careers);
		request.setAttribute("licenses", licenses);
		request.setAttribute("portfolios", portfolios);
		request.setAttribute("coverLetter", coverLetter);
		
		request.getRequestDispatcher("/WEB-INF/individual/resume_preview.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}