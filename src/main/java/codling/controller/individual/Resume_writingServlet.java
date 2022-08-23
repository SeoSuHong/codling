package codling.controller.individual;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import codling.dao.InformationDao;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024, 
	maxFileSize = 1024 * 1024 * 50,
	maxRequestSize = 1024 * 1024 * 50 * 5
)
@WebServlet("/resume_writing")
public class Resume_writingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("indiId");
		
		InformationDao infoDao = new InformationDao();
		Map<String, String> map = infoDao.getIndiName(id);
		String name = map.get(id);
		
		request.setAttribute("name", name);
		request.getRequestDispatcher("/WEB-INF/individual/resume_writing.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		Collection<Part> parts = request.getParts();
//		StringBuilder builder = new StringBuilder();
//		
//		for(Part p : parts) {
//			if(!p.getName().equals("file")) continue;
//			
//			Part file = p;
//			String fileName = file.getSubmittedFileName();
//			builder.append(fileName);
//			builder.append("/");
//			
//			InputStream fis = file.getInputStream();
//			
//			String realPath = request.getServletContext().getRealPath("/portfolio_file");
//			String filePath = realPath + File.separator + fileName;
//			FileOutputStream fos = new FileOutputStream(filePath);
//			
//			byte[] buf = new byte[1024];
//			int size = 0;
//			while((size = fis.read(buf)) != -1)
//				fos.write(buf, 0, size);
//			
//			fos.close();
//			fis.close();
//		}
//		builder.delete(builder.length() - 1, builder.length());
	}

}
