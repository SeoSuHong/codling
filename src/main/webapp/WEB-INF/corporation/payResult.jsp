<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>NICEPAY PAY RESULT(UTF-8)</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/payResult.css">
</head>
<body>
	<header>
        <a href="index"><img src="img/logo.png" alt="logo image" id="logo"></a>
    </header>
    <section>
        <article>
            <h1 class="title">파워광고 결제</h1><hr>
			<table>
				<c:if test="${resultJsonStr == '9999'}">
				<tr>
					<th>승인 통신 실패로 인한 망취소 처리 진행 결과</th>
					<td>[${ResultCode}]${ResultMsg}</td>
				</tr>
				</c:if>
				<c:if test="${resultJsonStr != '9999'}">
				<tr>
					<th>결과 내용</th>
					<td>[${ResultCode}]${ResultMsg}</td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td>${PayMethod}</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${GoodsName}</td>
				</tr>
				<tr>
					<th>결제 금액</th>
					<td>${Amt}</td>
				</tr>
				<tr>
					<th>거래 번호</th>
					<td>${TID}</td>
				</tr>
				</c:if>
			</table>
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