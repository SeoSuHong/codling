package codling.controller.individual;

import java.io.IOException;
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

@WebServlet("/individual_modify")
public class Individual_modifyServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String indiId = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		if(indiId != null) {
			Map<String, String> map = infoDao.getIndiName(indiId);
			String indiName = map.get(indiId);
			request.setAttribute("indiName", indiName);
		}
		
		// id값으로 기업회원 정보 가져오기
		IndividualDao dao = new IndividualDao();
		Individual individual = dao.getIndividual(indiId);
		
		request.setAttribute("individual", individual);
		request.getRequestDispatcher("/WEB-INF/individual/individual_modify.jsp").forward(request, response);
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
