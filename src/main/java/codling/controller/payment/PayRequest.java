package codling.controller.payment;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import codling.dao.InformationDao;

@WebServlet("/payRequest")
public class PayRequest extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("corpId");
		InformationDao infoDao = new InformationDao();
		List<String> list = infoDao.getCorpPhoneEmail(id);
		
		String jobOpening_no = request.getParameter("jobOpening_no");
		/*
		*******************************************************
		* <결제요청 파라미터>
		* 결제시 Form 에 보내는 결제요청 파라미터입니다.
		* 샘플페이지에서는 기본(필수) 파라미터만 예시되어 있으며, 
		* 추가 가능한 옵션 파라미터는 연동메뉴얼을 참고하세요.
		*******************************************************
		*/
		String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키
		String merchantID 		= "nicepay00m";	 				// 상점아이디
		String goodsName 		= "나이스페이"; 					// 결제상품명
		String price 			= "100"; 						// 결제상품금액	
		String buyerName 		= id; 							// 구매자명
		String buyerTel 		= list.get(0);	 				// 구매자연락처
		String buyerEmail 		= list.get(1);		 			// 구매자메일주소
		String moid 			= "mnoid1234567890"; 			// 상품주문번호	
		String returnURL 		= "http://localhost:8080/nicepay3.0_utf-8/payResult_utf.jsp"; // 결과페이지(절대경로) - 모바일 결제창 전용

		/*
		*******************************************************
		* <해쉬암호화> (수정하지 마세요)
		* SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다. 
		*******************************************************
		*/
		DataEncrypt sha256Enc 	= new DataEncrypt();
		String ediDate 			= getyyyyMMddHHmmss();	
		String hashString 		= sha256Enc.encrypt(ediDate + merchantID + price + merchantKey);
		
		request.setAttribute("jobOpening_no", jobOpening_no);
		request.setAttribute("goodsName", goodsName);
		request.setAttribute("price", price);
		request.setAttribute("merchantID", merchantID);
		request.setAttribute("moid", moid);
		request.setAttribute("buyerName", buyerName);
		request.setAttribute("buyerEmail", buyerEmail);
		request.setAttribute("buyerTel", buyerTel);
		request.setAttribute("returnURL", returnURL);
		request.setAttribute("ediDate", ediDate);
		request.setAttribute("hashString", hashString);
		
		request.getRequestDispatcher("/WEB-INF/corporation/payRequest.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public final synchronized String getyyyyMMddHHmmss(){
		SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
		return yyyyMMddHHmmss.format(new Date());
	}

}
