<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>NICEPAY PAY REQUEST(UTF-8)</title>
<meta charset="utf-8">
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
<script src="js/payRequest.js"></script>
<link rel="stylesheet" href="css/payRequest.css">
</head>
<body>
	<header>
        <a href="index"><img src="img/logo.png" alt="logo image" id="logo"></a>
    </header>
    <section>
        <article>
            <h1 class="title">파워광고 결제</h1><hr>
			<form name="payForm" method="post" action="payResult">
				<table>
					<tr>
						<th><span>결제 수단</span></th>
						<td><input type="text" name="PayMethod" value=""></td>
					</tr>
					<tr>
						<th><span>결제 상품명</span></th>
						<td><input type="text" name="GoodsName" value="${goodsName}"></td>
					</tr>
					<tr>
						<th><span>결제 상품금액</span></th>
						<td><input type="text" name="Amt" value="${price}"></td>
					</tr>				
					<tr>
						<th><span>상점 아이디</span></th>
						<td><input type="text" name="MID" value="${merchantID}"></td>
					</tr>	
					<tr>
						<th><span>상품 주문번호</span></th>
						<td><input type="text" name="Moid" value="${moid}"></td>
					</tr> 
					<tr>
						<th><span>구매자명</span></th>
						<td><input type="text" name="BuyerName" value="${buyerName}"></td>
					</tr>	 
					<tr>
						<th>구매자명 이메일</th>
						<td><input type="text" name="BuyerEmail" value="${buyerEmail}"></td>
					</tr>			
					<tr>
						<th><span>구매자 연락처</span></th>
						<td><input type="text" name="BuyerTel" value="${buyerTel}"></td>
					</tr>	 
					<tr>
						<th><span>인증완료 결과처리 URL<!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 --></span></th>
						<td><input type="text" name="ReturnURL" value="${returnURL}"></td>
					</tr>
					<tr>
						<th>가상계좌입금만료일(YYYYMMDD)</th>
						<td><input type="text" name="VbankExpDate" value=""></td>
					</tr>		
								
					<!-- 옵션 --> 
					<input type="hidden" name="jobOpening_no" value="${jobOpening_no}"/>
					<input type="hidden" name="GoodsCl" value="1"/>						<!-- 상품구분(실물(1),컨텐츠(0)) -->
					<input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) --> 
					<input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
					<input type="hidden" name="ReqReserved" value=""/>					<!-- 상점 예약필드 -->
								
					<!-- 변경 불가능 -->
					<input type="hidden" name="EdiDate" value="${ediDate}"/>			<!-- 전문 생성일시 -->
					<input type="hidden" name="SignData" value="${hashString}"/>	<!-- 해쉬값 -->
				</table>
				<div id="buttonWrap">
					<a href="#" class="btn_blue" onClick="nicepayStart();">요 청</a>
				</div>
			</form>
		</article>
	</section>
    <footer>
        <a href="#up"><img src="img/footerLogo.png"></a>
        <a href="#">전체서비스</a>&ensp;|&ensp; 
        <a href="#">이용약관</a>&ensp;|&ensp; 
        <a href="#">개인정보처리방침</a>&ensp;|&ensp;
        <a href="#">제휴문의</a>&ensp;| 
        © CODLING Corp.
    </footer>
</body>
</html>