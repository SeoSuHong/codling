package codling.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.identity.Corporation;

@WebServlet("/corporation_modify")
public class Corporation_modifyServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		String corporateName = (String)session.getAttribute("corpcorporateName");
		
		
		// id값으로 기업회원 정보 가져오기
		CorporationDao dao = new CorporationDao();
		Corporation corporation = dao.getCorporation(id);
		
		request.setAttribute("corporation", corporation);
		request.getRequestDispatcher("/WEB-INF/corporation/corporation_modify.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// form에서 가져온 값 DB에 넣기 
//		String id = request.getParameter("id");
//		String corporateName = request.getParameter("corporateName");
//		String password = request.getParameter("password");
//		String corporatePhone = request.getParameter("corporatePhone");
//		String corporateNumber = request.getParameter("corporateNumber");
//		String fileName = request.getParameter("fileName");
//		String address = request.getParameter("address");
//		
//		
//		Corporation corporation = new Corporation(id, corporateName, password, corporatePhone, corporateNumber, fileName, address);
	}
}
