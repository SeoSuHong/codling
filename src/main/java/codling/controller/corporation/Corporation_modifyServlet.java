package codling.controller.corporation;

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

import codling.dao.CorporationDao;
import codling.dao.InformationDao;
import codling.identity.Corporation;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024, 
	maxFileSize = 1024 * 1024 * 50,
	maxRequestSize = 1024 * 1024 * 50 * 5
)
@WebServlet("/corporation_modify")
public class Corporation_modifyServlet extends HttpServlet{
	String id;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		id = (String)session.getAttribute("corpId");
		String password = request.getParameter("password");
		
		InformationDao infoDao = new InformationDao();
		boolean check = infoDao.checkCorpId(id, password);
		
		if(check) {
			CorporationDao corpDao = new CorporationDao();
			Corporation corporation = corpDao.getCorporation(id);
			
			request.setAttribute("corporation", corporation);
			request.getRequestDispatcher("/WEB-INF/corporation/corporation_modify.jsp").forward(request, response);
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>alert('비밀번호가 일치하지 않습니다.'); location.href = 'corporationInfo';</script>");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String password        = request.getParameter("password");
		String corporateName   = request.getParameter("corporateName");
		String corporatePhone  = "010" + request.getParameter("corporatePhone");
		String ceoName         = request.getParameter("ceoName");
		String corporateNumber = request.getParameter("corporateNumber");
		String fileName        = request.getParameter("fileName");
		String email           = request.getParameter("email");
		String address         = request.getParameter("address");
		String detailAddress   = request.getParameter("detailAddress");
		String logoName        = request.getParameter("logoName");
		
		
		Part file = request.getPart("file");
		if(file != null && file.getSize() != 0) {
			String realPath = request.getServletContext().getRealPath("/corporateNumber_files");
			
			// 기존 첨부파일 삭제
			if(fileName != null && !fileName.equals("")) {
				String deleteFilePath = realPath + File.separator + fileName;
				File deleteFile = new File(deleteFilePath);
				if(deleteFile.exists()) deleteFile.delete();
			}
			
			fileName = file.getSubmittedFileName();
			
			InputStream fis = file.getInputStream();
			
			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size = fis.read(buf)) != -1)
				fos.write(buf, 0, size);
			
			fos.close();
			fis.close();
		}
		
		Part logo = request.getPart("logo");
		if(logo != null && logo.getSize() != 0) {
			String realPath = request.getServletContext().getRealPath("/corporation_logo");
			
			// 기존 첨부파일 삭제
			if(logoName != null && !logoName.equals("")) {
				String deleteFilePath = realPath + File.separator + logoName;
				File deleteFile = new File(deleteFilePath);
				if(deleteFile.exists()) deleteFile.delete();
			}
			
			logoName = logo.getSubmittedFileName();
			
			InputStream fis = logo.getInputStream();
			
			String filePath = realPath + File.separator + logoName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size = fis.read(buf)) != -1)
				fos.write(buf, 0, size);
			
			fos.close();
			fis.close();
		}
		
		Corporation corporation = new Corporation(id, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, email, address, detailAddress, logoName);
		
		InformationDao infoDao = new InformationDao();
				
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		boolean result = infoDao.updateCorporation(corporation);
		if(result) {
			out.print("<script>alert('회원정보를 수정하였습니다.'); location.href = 'corporationInfo';</script>");
		} else {
			out.print("<script>alert('회원정보 수정에 실패하였습니다.'); location.href = 'corporationInfo';</script>");
		}
	}
}
