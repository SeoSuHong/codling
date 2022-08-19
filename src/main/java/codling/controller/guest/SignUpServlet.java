package codling.controller.guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.CorporationDao;
import codling.dao.IndividualDao;
import codling.identity.Corporation;
import codling.identity.Individual;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/guest/signUp.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		String num_ = request.getParameter("num");
		int num = 0;
		
		if(num_ != null && !num_.equals("")) num = Integer.parseInt(num_);
		
		if(num == 1) {  // 개인 회원가입
			
			String iId = request.getParameter("id");
			String iPw = request.getParameter("pw");
			String iName = request.getParameter("name");
			String iBirth = request.getParameter("yy")+request.getParameter("mm")+request.getParameter("dd");
			String iGender = request.getParameter("gender");
			String iEmail = request.getParameter("email");
			String iPhone = request.getParameter("phoneInd1")+request.getParameter("phoneInd2");
			String iAddress = request.getParameter("address")+" "+request.getParameter("detailAddress")+" "+request.getParameter("extraAddress");
			Individual individual = new Individual(iId, iPw, iName, iBirth, iGender, iEmail, iPhone, iAddress,"");
			
			IndividualDao dao = new IndividualDao();
			boolean result = dao.insertIndividual(individual);
			
			PrintWriter out = response.getWriter();
			if(result) {
				out.print("<script>	alert(\"Welcome🍏\");location.href='login';</script>");
				out.flush();
			} else {
				out.print("<script>alert('회원가입에 실패하였습니다. 다시 시도해주세요.');location.href='signUp';</script>");
				out.flush();
			}
			
			
		} else if(num == 2) {  // 기업 회원가입
			String cId = request.getParameter("corId");
			String cPw = request.getParameter("corPw");
			String cPhone = request.getParameter("localNum")+request.getParameter("corptel");
			String cName = request.getParameter("companyName");
			String cCeo = request.getParameter("representative");
			String cNumber = request.getParameter("companyNum");
			String fileName = request.getParameter("fileName");
			String cAddress = request.getParameter("address2")+" "+request.getParameter("detailAddress2")+" "+request.getParameter("extraAddress2");
			Corporation corporation = new Corporation(cId, cPw, cName, cPhone, cCeo, cNumber, fileName, cAddress);
			
			CorporationDao dao = new CorporationDao();
			boolean result = dao.insertCorporation(corporation);
			PrintWriter out = response.getWriter();
			if(result) {
				out.print("<script>	alert(\"Welcome🍏\");location.href='login';</script>");
				out.flush();
			} else {
				out.print("<script>alert('회원가입에 실패하였습니다. 다시 시도해주세요.');location.href='signUp';</script>");
				out.flush();
			}
		}
	}
}
	
