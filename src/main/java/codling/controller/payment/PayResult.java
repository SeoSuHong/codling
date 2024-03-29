package codling.controller.payment;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import codling.dao.CorporationDao;

/**
 * Servlet implementation class PayResult
 */
@WebServlet("/payResult")
public class PayResult extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		/*
		****************************************************************************************
		* <인증 결과 파라미터>
		****************************************************************************************
		*/
		String authResultCode 	= (String)request.getParameter("AuthResultCode"); 	// 인증결과 : 0000(성공)
		String authResultMsg 	= (String)request.getParameter("AuthResultMsg"); 	// 인증결과 메시지
		String nextAppURL 		= (String)request.getParameter("NextAppURL"); 		// 승인 요청 URL
		String txTid 			= (String)request.getParameter("TxTid"); 			// 거래 ID
		String authToken 		= (String)request.getParameter("AuthToken"); 		// 인증 TOKEN
		String payMethod 		= (String)request.getParameter("PayMethod"); 		// 결제수단
		String mid 				= (String)request.getParameter("MID"); 				// 상점 아이디
		String moid 			= (String)request.getParameter("Moid"); 			// 상점 주문번호
		String amt 				= (String)request.getParameter("Amt"); 				// 결제 금액
		String reqReserved 		= (String)request.getParameter("ReqReserved"); 		// 상점 예약필드
		String netCancelURL 	= (String)request.getParameter("NetCancelURL"); 	// 망취소 요청 URL
		String jobOpening_no_   = (String)request.getParameter("jobOpening_no");	// 공고 번호
		int    jobOpening_no    = 0;
		if(jobOpening_no_ != null && !jobOpening_no_.equals("")) jobOpening_no = Integer.parseInt(jobOpening_no_);
		//String authSignature = (String)request.getParameter("Signature");			// Nicepay에서 내려준 응답값의 무결성 검증 Data

		/*  
		****************************************************************************************
		* Signature : 요청 데이터에 대한 무결성 검증을 위해 전달하는 파라미터로 허위 결제 요청 등 결제 및 보안 관련 이슈가 발생할 만한 요소를 방지하기 위해 연동 시 사용하시기 바라며 
		* 위변조 검증 미사용으로 인해 발생하는 이슈는 당사의 책임이 없음 참고하시기 바랍니다.
		****************************************************************************************
		 */
		DataEncrypt sha256Enc 	= new DataEncrypt();
		String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키

		//인증 응답 Signature = hex(sha256(AuthToken + MID + Amt + MerchantKey)
		//String authComparisonSignature = sha256Enc.encrypt(authToken + mid + amt + merchantKey);

		/*
		****************************************************************************************
		* <승인 결과 파라미터 정의>
		* 샘플페이지에서는 승인 결과 파라미터 중 일부만 예시되어 있으며, 
		* 추가적으로 사용하실 파라미터는 연동메뉴얼을 참고하세요.
		****************************************************************************************
		*/
		String ResultCode 	= ""; String ResultMsg 	= ""; String PayMethod 	= "";
		String GoodsName 	= ""; String Amt 		= ""; String TID 		= ""; 
		//String Signature = ""; String paySignature = "";


		/*
		****************************************************************************************
		* <인증 결과 성공시 승인 진행>
		****************************************************************************************
		*/
		String resultJsonStr = "";
		if(authResultCode.equals("0000") /*&& authSignature.equals(authComparisonSignature)*/){
			/*
			****************************************************************************************
			* <해쉬암호화> (수정하지 마세요)
			* SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다. 
			****************************************************************************************
			*/
			String ediDate			= getyyyyMMddHHmmss();
			String signData 		= sha256Enc.encrypt(authToken + mid + amt + ediDate + merchantKey);

			/*
			****************************************************************************************
			* <승인 요청>
			* 승인에 필요한 데이터 생성 후 server to server 통신을 통해 승인 처리 합니다.
			****************************************************************************************
			*/
			StringBuffer requestData = new StringBuffer();
			requestData.append("TID=").append(txTid).append("&");
			requestData.append("AuthToken=").append(authToken).append("&");
			requestData.append("MID=").append(mid).append("&");
			requestData.append("Amt=").append(amt).append("&");
			requestData.append("EdiDate=").append(ediDate).append("&");
			requestData.append("CharSet=").append("utf-8").append("&");
			requestData.append("SignData=").append(signData);

			try {
				resultJsonStr = connectToServer(requestData.toString(), nextAppURL);
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			HashMap resultData = new HashMap();
			boolean paySuccess = false;
			if("9999".equals(resultJsonStr)){
				/*
				*************************************************************************************
				* <망취소 요청>
				* 승인 통신중에 Exception 발생시 망취소 처리를 권고합니다.
				*************************************************************************************
				*/
				StringBuffer netCancelData = new StringBuffer();
				requestData.append("&").append("NetCancel=").append("1");
				String cancelResultJsonStr = null;
				try {
					cancelResultJsonStr = connectToServer(requestData.toString(), netCancelURL);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				HashMap cancelResultData = null;
				try {
					cancelResultData = jsonStringToHashMap(cancelResultJsonStr);
				} catch (Exception e) {
					e.printStackTrace();
				}
				ResultCode = (String)cancelResultData.get("ResultCode");
				ResultMsg = (String)cancelResultData.get("ResultMsg");
				/*Signature = (String)cancelResultData.get("Signature");
				String CancelAmt = (String)cancelResultData.get("CancelAmt");
				paySignature = sha256Enc.encrypt(TID + mid + CancelAmt + merchantKey);*/
			}else{
				try {
					resultData = jsonStringToHashMap(resultJsonStr);
				} catch (Exception e) {
					e.printStackTrace();
				}
				ResultCode 	= (String)resultData.get("ResultCode");	// 결과코드 (정상 결과코드:3001)
				ResultMsg 	= (String)resultData.get("ResultMsg");	// 결과메시지
				PayMethod 	= (String)resultData.get("PayMethod");	// 결제수단
				GoodsName   = (String)resultData.get("GoodsName");	// 상품명
				Amt       	= (String)resultData.get("Amt");		// 결제 금액
				TID       	= (String)resultData.get("TID");		// 거래번호
				// Signature : Nicepay에서 내려준 응답값의 무결성 검증 Data
				// 가맹점에서 무결성을 검증하는 로직을 구현하여야 합니다.
				/*Signature = (String)resultData.get("Signature");
				paySignature = sha256Enc.encrypt(TID + mid + Amt + merchantKey);*/
				
				/*
				*************************************************************************************
				* <결제 성공 여부 확인>
				*************************************************************************************
				*/
				if(PayMethod != null){
					if(PayMethod.equals("CARD")){
						if(ResultCode.equals("3001")) paySuccess = true; // 신용카드(정상 결과코드:3001)       	
					}else if(PayMethod.equals("BANK")){
						if(ResultCode.equals("4000")) paySuccess = true; // 계좌이체(정상 결과코드:4000)	
					}else if(PayMethod.equals("CELLPHONE")){
						if(ResultCode.equals("A000")) paySuccess = true; // 휴대폰(정상 결과코드:A000)	
					}else if(PayMethod.equals("VBANK")){
						if(ResultCode.equals("4100")) paySuccess = true; // 가상계좌(정상 결과코드:4100)
					}else if(PayMethod.equals("SSG_BANK")){
						if(ResultCode.equals("0000")) paySuccess = true; // SSG은행계좌(정상 결과코드:0000)
					}else if(PayMethod.equals("CMS_BANK")){
						if(ResultCode.equals("0000")) paySuccess = true; // 계좌간편결제(정상 결과코드:0000)
					}
					CorporationDao corpDao = new CorporationDao();
					corpDao.updateGrade(jobOpening_no);
				}
			}
		}else/*if(authSignature.equals(authComparisonSignature))*/{
			ResultCode 	= authResultCode; 	
			ResultMsg 	= authResultMsg;
		}/*else{
			System.out.println("인증 응답 Signature : " + authSignature);
			System.out.println("인증 생성 Signature : " + authComparisonSignature);
		}*/
		
		request.setAttribute("resultJsonStr", resultJsonStr);
		request.setAttribute("ResultCode", ResultCode);
		request.setAttribute("ResultMsg", ResultMsg);
		request.setAttribute("PayMethod", PayMethod);
		request.setAttribute("GoodsName", GoodsName);
		request.setAttribute("Amt", Amt);
		request.setAttribute("TID", TID);

		request.getRequestDispatcher("/WEB-INF/corporation/payResult.jsp").forward(request, response);
	}
	
	public final synchronized String getyyyyMMddHHmmss(){
		SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
		return yyyyMMddHHmmss.format(new Date());
	}
	
	//server to server 통신
	public String connectToServer(String data, String reqUrl) throws Exception{
		HttpURLConnection conn 		= null;
		BufferedReader resultReader = null;
		PrintWriter pw 				= null;
		URL url 					= null;
		
		int statusCode = 0;
		StringBuffer recvBuffer = new StringBuffer();
		try{
			url = new URL(reqUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setConnectTimeout(15000);
			conn.setReadTimeout(25000);
			conn.setDoOutput(true);
			
			pw = new PrintWriter(conn.getOutputStream());
			pw.write(data);
			pw.flush();
			
			statusCode = conn.getResponseCode();
			resultReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			for(String temp; (temp = resultReader.readLine()) != null;){
				recvBuffer.append(temp).append("\n");
			}
			
			if(!(statusCode == HttpURLConnection.HTTP_OK)){
				throw new Exception();
			}
			
			return recvBuffer.toString().trim();
		}catch (Exception e){
			return "9999";
		}finally{
			recvBuffer.setLength(0);
			
			try{
				if(resultReader != null){
					resultReader.close();
				}
			}catch(Exception ex){
				resultReader = null;
			}
			
			try{
				if(pw != null) {
					pw.close();
				}
			}catch(Exception ex){
				pw = null;
			}
			
			try{
				if(conn != null) {
					conn.disconnect();
				}
			}catch(Exception ex){
				conn = null;
			}
		}
	}

	//JSON String -> HashMap 변환
	private static HashMap jsonStringToHashMap(String str) throws Exception{
		HashMap dataMap = new HashMap();
		JSONParser parser = new JSONParser();
		try{
			Object obj = parser.parse(str);
			JSONObject jsonObject = (JSONObject)obj;

			Iterator<String> keyStr = jsonObject.keySet().iterator();
			while(keyStr.hasNext()){
				String key = keyStr.next();
				Object value = jsonObject.get(key);
				
				dataMap.put(key, value);
			}
		}catch(Exception e){
			
		}
		return dataMap;
	}

}
