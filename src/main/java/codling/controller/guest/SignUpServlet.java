package codling.controller.guest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import codling.dao.InformationDao;
import codling.identity.Corporation;
import codling.identity.Individual;
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024, 
	maxFileSize = 1024 * 1024 * 50,
	maxRequestSize = 1024 * 1024 * 50 * 5
)
@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/guest/signUp.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		InformationDao infoDao = new InformationDao();
		String position = request.getParameter("position");
		
		boolean result = false;
		if(position.equals("individual")) {  // 개인 회원가입
			
			String id = request.getParameter("iId");
			String password = request.getParameter("iPassword");
			String name = request.getParameter("name");
			String birth = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
			String gender = request.getParameter("gender");
			String email = request.getParameter("iEmail");
			String phone = request.getParameter("iPhone1")+request.getParameter("iPhone2");
			String address = request.getParameter("iAddress");
			String detailAddress = request.getParameter("iDetailAddress");
			
			Individual individual = new Individual(id, password, name, birth, gender, email, phone, address, detailAddress);
			result = infoDao.insertIndividual(individual);
			
		} else if(position.equals("corporation")) {  // 기업 회원가입
			String id = request.getParameter("cId");
			String password = request.getParameter("cPassword");
			String corporateName = request.getParameter("corporateName");
			String corporatePhone = request.getParameter("cPhone1")+request.getParameter("cPhone2");
			String ceoName = request.getParameter("ceoName");
			String corporateNumber = request.getParameter("corporateNumber");
			String fileName = "";
			String email = request.getParameter("cEmail");
			String address = request.getParameter("cAddress");
			String detailAddress = request.getParameter("cDetailAddress");
			
			Part file = request.getPart("file");
			if(file != null && file.getSize() != 0) {
				fileName = file.getSubmittedFileName();
				
				String realPath = request.getServletContext().getRealPath("corporateNumber_files");
				String filePath = realPath + File.separator + fileName;
				
				InputStream fis = file.getInputStream();
				FileOutputStream fos = new FileOutputStream(filePath);
				
				byte[] buf = new byte[1024];
				int size = 0;
				while((size = fis.read(buf)) != 1)
					fos.write(buf, 0, size);
				
				fos.close();
				fis.close();
			}
			System.out.println(id);
			System.out.println(password);
			System.out.println(corporateName);
			System.out.println(corporatePhone);
			System.out.println(ceoName);
			System.out.println(corporateNumber);
			System.out.println(fileName);
			System.out.println(email);
			System.out.println(address);
			System.out.println(detailAddress);
			Corporation corporation = new Corporation(id, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, email, address, detailAddress);
			result = infoDao.insertCorporation(corporation);
		}
		
		if(result) {
			out.print("<script>alert('Welcome🍏'); location.href = 'login';</script>");
			out.flush();
		} else {
			out.print("<script>alert('회원가입에 실패하였습니다. 다시 시도해주세요.'); location.href = 'signUp';</script>");
			out.flush();
		}
	}
}