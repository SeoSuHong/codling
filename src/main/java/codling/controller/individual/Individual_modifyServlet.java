package codling.controller.individual;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.IndividualDao;
import codling.dao.InformationDao;
import codling.identity.Individual;

@WebServlet("/individual_modify")
public class Individual_modifyServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		String password = request.getParameter("password");
		
		InformationDao infoDao = new InformationDao();
		
		boolean check = infoDao.checkIndiId(id, password);
		
		if(check) {
			IndividualDao indiDao = new IndividualDao();
			Individual individual = indiDao.getIndividual(id);
			
			request.setAttribute("individual", individual);
			request.getRequestDispatcher("/WEB-INF/individual/individual_modify.jsp").forward(request, response);
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>alert('비밀번호가 일치하지 않습니다.'); location.href = 'individualInfo';</script>");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = "010" + request.getParameter("phone");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		Individual individual = new Individual(id, password, name, birth, gender, email, phone, address, detailAddress);
		InformationDao infoDao = new InformationDao();
		
		boolean result = infoDao.updateIndividual(individual);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result) {
			out.print("<script>alert('회원정보 수정이 완료되었습니다.'); location.href = 'individualInfo'</script>");
		} else {
			out.print("<script>alert('회원정보 수정에 실패하었습니다.'); location.href = 'individualInfo'</script>");
		}
	}
}