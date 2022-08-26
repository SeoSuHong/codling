package codling.controller.individual;

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
import codling.identity.Career;
import codling.identity.CoverLetter;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

@WebServlet("/resume_preview")
public class Resume_previewServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		String corpId = (String)session.getAttribute("corpId");
		
		String c_no = request.getParameter("coverLetter_no");
		int coverLetter_no = 0;
		if(c_no != null && !c_no.equals("")) coverLetter_no = Integer.parseInt(c_no);
		
		InformationDao infoDao = new InformationDao();
		IndividualDao indiDao = new IndividualDao();
		
		Map<String, String> map = infoDao.getIndiName(indiId);
		String name = map.get(indiId);
		Individual individual = indiDao.getIndividual(indiId);
		Education education = indiDao.getEducation(indiId);
		Career career = indiDao.getCareer(indiId);
		License license = indiDao.getLicense(indiId);
		Portfolio portfolio = indiDao.getportfolio(indiId);
		Portfolio fileupload = indiDao.getfileupload(indiId);
		String escape = "\r\n" ;
		List<CoverLetter> coverLetter = indiDao.getCoverLetter(indiId);
		List<Apply> apply = indiDao.getApply(indiId);
		
		request.setAttribute("coverLetter_no", coverLetter_no);
		request.setAttribute("apply", apply);
		request.setAttribute("coverLetter", coverLetter);
		request.setAttribute("escape", escape);
		request.setAttribute("fileupload", fileupload);
		request.setAttribute("portfolio", portfolio);
		request.setAttribute("license", license);
		request.setAttribute("career", career);
		request.setAttribute("education", education);
		request.setAttribute("individual", individual);
		request.setAttribute("name", name);	

		// resume_preview.jsp로 이동
		request.getRequestDispatcher("/WEB-INF/individual/resume_preview.jsp").forward(request, response);
	}
}