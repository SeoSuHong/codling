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

import codling.dao.CorporationDao;
import codling.dao.InformationDao;
import codling.identity.Field;
import codling.identity.JobOpening;

@WebServlet("/jobOpening_update")
public class JobOpening_updateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getCorpName(id);
		String name = map.get(id);
		
		request.setAttribute("name", name);
		
		String no_ = request.getParameter("no");
		int no = 0;
		if(no_ != null && !no_.equals("")) no = Integer.parseInt(no_);
		
		CorporationDao corpDao = new CorporationDao();
		JobOpening jobOpening = corpDao.getJobOpening(no);
		List<Field> fields = corpDao.getAllField(no);
		request.setAttribute("jobOpening", jobOpening);
		request.setAttribute("fields", fields);
		request.setAttribute("replaceChar", "\n"); // 줄바꿈 <br>처리를 위해
		
		request.getRequestDispatcher("/WEB-INF/corporation/jobOpening_update.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("corpId");
//		
//		String title             = request.getParameter("title");
//		String address           = request.getParameter("address");
//		String detailAddress     = request.getParameter("detailAddress");
//		String region            = address + " " + detailAddress;
//		String startDate         = request.getParameter("startDate");
//		String endDate           = request.getParameter("endDate");
//		String process           = request.getParameter("process");
//		
//		String[] nameList        = request.getParameterValues("name");
//		String[] careerList      = request.getParameterValues("career");
//		String[] positionList    = request.getParameterValues("position");
//		String[] payList         = request.getParameterValues("pay");
//		String[] workDayList     = request.getParameterValues("workday");
//		String[] stackList       = request.getParameterValues("stack");
//		String[] workList        = request.getParameterValues("work");
//		String[] requirementList = request.getParameterValues("requirement");
//		String[] preferenceList  = request.getParameterValues("preference");
//		
//		JobOpening jobOpening = new JobOpening(0, id, title, region, process, startDate, endDate, 0);
//		
//		CorporationDao corpDao = new CorporationDao();
//		boolean jobOpening_result = corpDao.insertJobOpening(jobOpening);
//		
//		List<Field> fields = new ArrayList<Field>();
//		int no = corpDao.getRecentJobOpeningNo(id);
//
//		for(int i = 0; i < nameList.length - 1; i++) {
//			Field field = new Field(0, no, nameList[i], careerList[i], positionList[i], payList[i], workDayList[i], workList[i], stackList[i], requirementList[i], preferenceList[i]);
//			fields.add(field);
//		}
//
//		boolean field_result = corpDao.insertField(fields);
//		
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		if(jobOpening_result && field_result)
//			out.print("<script>alert('공고작성이 완료되었습니다.'); location.href = 'jobOpening_management';</script>");
//		else
//			out.print("<script>alert('공고작성에 실패하였습니다.'); location.href = 'jobOpening_writing';</script>");
	}
}