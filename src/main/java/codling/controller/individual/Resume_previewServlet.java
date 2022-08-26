package codling.controller.individual;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
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
	int no; // 지원no
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		InformationDao infoDao = new InformationDao();
		String name = ""; // 회원 이름
		if(session.getAttribute("indiId") != null) {
			String id = (String)session.getAttribute("indiId");
			name = infoDao.getIndividualName(id);
		} else if(session.getAttribute("corpId") != null) {
			String id = (String)session.getAttribute("corpId");
			name = infoDao.getCorporationName(id);
		}
		request.setAttribute("name", name);
		
		// DAO
		IndividualDao indiDao = new IndividualDao();
		CorporationDao corpDao = new CorporationDao();
		
		String id = request.getParameter("id"); // 개인회원 id
		String coverLetter_no_ = request.getParameter("coverLetter_no");
		int coverLetter_no = 0; // 자기소개서no
		
		if(coverLetter_no_ != null && !coverLetter_no_.equals(""))
			coverLetter_no = Integer.parseInt(coverLetter_no_);
		
		
		// 지원상태 (미열람 -> 열람)
		String no_ = request.getParameter("no");
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		String status = request.getParameter("status"); // 지원상태(미열람, 열람, 수락, 거절)
		if(status != null && status.equals("미열람")) {
			corpDao.updateStatus(no, "열람");
		}
		// 개인회원 정보
		Individual individual = indiDao.getIndividual(id);
		
		// 이력서 학력사항
		List<Education> educations = indiDao.getEducation(id);
		
		// 이력서 경력사항
		List<Career> careers = indiDao.getCareer(id);
		
		// 이력서 자격증
		List<License> licenses = indiDao.getLicense(id);
		
		// 이력서 포트폴리오
		List<Portfolio> portfolios = indiDao.getPortfolio(id);
		
		// 자기소개서
		CoverLetter coverLetter = indiDao.getCoverLetter(coverLetter_no);
		
		request.setAttribute("individual", individual);
		request.setAttribute("educations", educations);
		request.setAttribute("careers", careers);
		request.setAttribute("licenses", licenses);
		request.setAttribute("portfolios", portfolios);
		request.setAttribute("coverLetter", coverLetter);
		
		request.setAttribute("status", status);
		
		request.getRequestDispatcher("/WEB-INF/individual/resume_preview.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		CorporationDao corpDao = new CorporationDao();
		int jobOpening_no = corpDao.getJobOpening_no(no);  // 공고no
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String ar = request.getParameter("ar");
		// 이력서 수락(accept)
		if(ar.equals("a")) {
			
			boolean result = corpDao.updateStatus(no, "수락");
			if(result)
				out.print("<script>alert('이력서를 수락하였습니다.');"
						+ "location.href = 'applicant_status?no=" + jobOpening_no + "';</script>");
		
		// 이력서 거절(refuse)
		} else if(ar.equals("r")) { 
			
			boolean result = corpDao.updateStatus(no, "거절");
			if(result)
				out.print("<script>alert('이력서를 거절하였습니다.');"
						+ "location.href = 'applicant_status?no=" + jobOpening_no + "';</script>");
			
		}
	}
}