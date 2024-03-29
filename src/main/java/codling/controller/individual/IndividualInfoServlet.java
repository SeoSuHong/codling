package codling.controller.individual;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Individual;

@WebServlet("/individualInfo")
public class IndividualInfoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getIndiName(id);
		String name = map.get(id);
		request.setAttribute("name", name);
		
		IndividualDao dao = new IndividualDao();
		Individual individual = dao.getIndividual(id);
		
		request.setAttribute("individual", individual);
		request.getRequestDispatcher("/WEB-INF/individual/individual_info.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		String password = request.getParameter("password");
		
		InformationDao dao = new InformationDao();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		boolean check = dao.checkIndiId(id, password);
		if(check) {
			boolean Result = dao.deleteIndividual(id);	
			if(Result) {
				out.print("<script>alert('회원탈퇴가 완료되었습니다.'); location.href='index';</script>");
				out.flush();
				session.invalidate();
			} else {
				out.print("<script>alert('회원탈퇴에 실패하였습니다.'); location.href='individualInfo';</script>");
				out.flush();
			}
		} else {
			out.print("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='individualInfo'</script>");
		}
	}
}