package codling.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import codling.identity.Education;

@WebServlet("/resume_writing")
public class Resume_writingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		if(indiId != null) {		
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
		}
		// resume_writing.jsp로 이동
		request.getRequestDispatcher("/WEB-INF/individual/resume_writing.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		List<Education> educationList = new ArrayList<Education>();
		//학력정보
		String[] school = request.getParameterValues("school");
		String[] schoolName = request.getParameterValues("schoolName");
		String[] schoolDateStart = request.getParameterValues("schoolDateStart");
		String[] schoolDateEnd = request.getParameterValues("schoolDateEnd");
		String[] status = request.getParameterValues("status");
		String[] department = request.getParameterValues("department");
		String[] score = request.getParameterValues("score");
		
		for(int i = 0; i < school.length; i++) {
			Education education = new Education(0, indiId, school[i], schoolName[i], schoolDateStart[i], schoolDateEnd[i], status[i], department[i], score[i]);
			educationList.add(education);
		}
		
		IndividualDao dao = new IndividualDao();
		boolean educationResult = dao.setEducation(educationList);
		
		//resumetitle stack update
		String resumetitle = request.getParameter("resumetitle");
		String stack = request.getParameter("stack");
		boolean resumeTitleStack = dao.upDateResumeTitleStack(resumetitle, stack, indiId);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(educationResult && resumeTitleStack)
			out.print("<script>alert('이력서 등록에 성공하였습니다.'); location.href = 'resume_management';</script>");
		else
			out.print("<script>alert('이력서 등록에 실패하였습니다.'); location.href = 'resume_writing';</script>");
	}
}