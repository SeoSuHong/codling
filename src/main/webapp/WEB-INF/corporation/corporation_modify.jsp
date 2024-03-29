<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/corporation_modify.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="js/corporation_modify.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <header>
        <a href="index"><img src="img/logo.png" alt="logoImg" id="logo"></a>
    </header>
    <section>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-10 col-md-7 col-lg-5 col-xl-4">
                        <form class="validation-form" novalidate name="updateCorpForm" action="corporation_modify" method="post" enctype="multipart/form-data">
                        <div id="individual" class="form-action show container-fluid align-items-center">
                            <div class="row align-items-center mt-4" id="frame">
                                <!-- 아이디 -->
                                <p class="fw-bold">아이디</p>
                                <div class="col" id="chain">
                                    <input type="text" maxlength="20" oninput="maxLengthCheck(this)" onkeyup="inputDataCheck(this.id)" name="id" id="id" class="form-control" placeholder="아이디" required readonly value="${corporation.id}">
                                        <div class="invalid-feedback">
                                            아이디를 입력하세요
                                        </div>      
                                </div>
                            </div>
                            <!-- 비밀번호 -->
                            <div class="row align-items-center mt-4 frame" id="hey">
                                <div class="col" >
                                    <p class="fw-bold">비밀번호</p>
                                        <input type="password" name="password" id="pw" class="form-control" placeholder="비밀번호"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 비밀번호 확인-->
                            <div class="row align-items-center mt-4" id="">
                                <div class="col">
                                    <p class="fw-bold">비밀번호 재확인</p>
                                        <input type="password" name="confirmPassword" id="cfpw" class="form-control" placeholder="비밀번호 재확인"  onkeyup="inputDataCheck(this.id)" required >
                                            <div class="invalid-feedback">
                                                비밀번호를 다시 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">회사명</p>
                                        <input type="text" name="corporateName" id="comName" class="form-control" placeholder="회사명" onkeyup="inputDataCheck(this.id)" required value="${corporation.corporateName}">
                                            <div class="invalid-feedback">
                                                회사명을 입력하세요.
                                            </div>
                                </div>
                            </div> 
                            <div class="row align-items-center mt-4">
                                <p class="fw-bold">회사 전화번호</p>
                                    <div class="col-3">
                                        <input class="form-control" value="010" readonly>
                                    </div>
                                    <div class="col">
                                        <input type="text" name="corporatePhone" class="form-control" id="telePhone" placeholder="'-'없이 입력" value="${fn:substring(corporation.corporatePhone, 3, 11)}">
                                    </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">대표자명</p>
                                        <input name="ceoName" id="representative" class="form-control" placeholder="대표자명" onkeyup="inputDataCheck(this.id)" required value="${corporation.ceoName}">
                                            <div class="invalid-feedback">
                                                대표자명을 입력하세요.
                                            </div>
                                </div>
                            </div>               
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">사업자 등록번호</p>
                                        <input name="corporateNumber" id="comNum" class="form-control" placeholder="사업자 등록번호"  onkeyup="inputDataCheck(this.id)" required value="${corporation.corporateNumber}">
                                            <div class="invalid-feedback">
                                                사업자 등록번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            
                            <c:if test="${not empty corporation.fileName}">
	                            <div class="row align-items-center mt-4">
	                                <div class="col">
	                                    <p class="fw-bold">등록된 증빙서류</p>
	                                        <a download href="/corporateNumber_files/${corporation.fileName}" id="fileName">${corporation.fileName}</a>
	                                        <input type="hidden" value="${corporation.fileName}" name="fileName">
	                                </div>
	                            </div>
                            </c:if>
                            
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">증빙서류 첨부</p>
                                        <input class="form-control" type="file" name="file" id="formFile" required>
                                </div>
                            </div>
                            
                            <c:if test="${not empty corporation.logo}">
                            	<div class="row align-items-center mt-4">
	                                <div class="col">
	                                    <p class="fw-bold">등록된 로고이미지</p>
	                                    	<div class="imgWrap">
	                                        	<img src="/corporation_logo/${corporation.logo}" id="fileName">
	                                        </div>
	                                        <input type="hidden" value="${corporation.logo}" name="logoName">
	                                </div>
	                            </div>
                            </c:if>
                            
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">기업로고 이미지</p>
                                        <input class="form-control" type="file" name="logo" id="formFile" required>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">이메일</p>
                                        <input type="email" name="email" id="email" class="form-control" placeholder="example@codling.com" required value="${corporation.email}">
                                            <div class="invalid-feedback">
                                                이메일을 입력하세요.
                                            </div>
                                </div>
                            </div>                      
                            <div class="row align-items-left mt-4 address" id="frame2">
                            	<p class="fw-bold" id="addressCom">주소</p>
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" id="search"><br>
                                    <input name="address" value="${corporation.address}" id="address" class="form-control  mb-1" placeholder="주소" onkeyup="inputDataCheck(this.id)" required>
                                    <input name="detailAddress" value="${corporation.detailAddress}" id="detailAddress" class="form-control mb-3 col-md-7" placeholder="상세주소"  onkeyup="inputDataCheck(this.id)" required>
                            </div>
                            <div id="modify_btn" >
                                <button type="button" id="#btn1" value="modifyIndividual" onclick="signUpInd_submit()" class="btn-xlarge modifyBtn">수정하기</button>
                            </div> 
                        </div>
                    </form>
                        </div>
                        </div>
            </div>
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