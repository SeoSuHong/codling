<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/individual_modify.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="js/company_modify.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <header>
        <a href="index.jsp"><img src="img/logo.png" alt="logoImg" id="logo"></a>
    </header>
    <section>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-10 col-md-7 col-lg-5 col-xl-4">
                        <form class="validation-form" novalidate>
                        <div id="individual" class="form-action show container-fluid align-items-center">
                            <div class="row align-items-center mt-4" id="frame">
                                <!-- 아이디 -->
                                <p class="fw-bold">아이디</p>
                                <div class="col" id="chain">
                                    <input type="text" maxlength="20" oninput="maxLengthCheck(this)" onkeyup="inputDataCheck(this.id)" name="id" id="id" class="form-control" placeholder="아이디" required readonly value="고객아이디">
                                        <div class="invalid-feedback">
                                            아이디를 입력하세요
                                        </div>      
                                </div>
                            </div>
                            <!-- 비밀번호 -->
                            <div class="row align-items-center mt-4 frame" id="hey">
                                <div class="col" >
                                    <p class="fw-bold">비밀번호</p>
                                        <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 비밀번호 확인-->
                            <div class="row align-items-center mt-4" id="">
                                <div class="col">
                                    <p class="fw-bold">비밀번호 재확인</p>
                                        <input type="password" name="confirmPassword" id="cfpw" class="form-control" placeholder="비밀번호 재확인"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 다시 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 이름-->
                            <div class="row align-items-center mt-4 frame" >
                                <div class="col">
                                    <p class="fw-bold">인사 담당자 이름</p>
                                        <input type="text" name="name" id = "name" class="form-control" placeholder="이름"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                이름을 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <!-- 인사 담당자 전화번호 -->
                            <div class="row align-items-center mt-4 frame" >
                                <p class="fw-bold">인사 담당자 번호</p>
                                    <div class="col-4">
                                        <select class="form-select" id="phoneInd1" name="tel" onkeyup="inputDataCheck(this.id)" required>
                                            <option selected value="010">010</option>
                                            <option value="direct">직접입력</option>
                                            <input type="text" id="selfBoxDirect" name="selfBoxDirect" class="form-control"/>
                                            </select>
                                                <div class="invalid-feedback">
                                                    식별번호를 선택하세요.
                                                </div>
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" id="phoneInd2" placeholder="'-'없이 입력"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                전화번호를 입력하세요.
                                            </div>
                                    </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">회사명</p>
                                        <input type="text" name="companyName" id="comName" class="form-control" placeholder="회사명" onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                회사명을 입력하세요.
                                            </div>
                                </div>
                            </div> 
                            <div class="row align-items-center mt-4">
                                <p class="fw-bold">회사 전화번호</p>
                                    <div class="col-4">
                                        <select class="form-select" id="localNum">
                                            <option value="">02</option>
                                            <option>031</option>
                                            <option>032</option>
                                            <option>033</option>
                                            <option>041</option>
                                            <option>042</option>
                                            <option>043</option>
                                            <option>044</option>
                                            <option>051</option>
                                            <option>052</option>
                                            <option>053</option>
                                            <option>054</option>
                                            <option>055</option>
                                            <option>061</option>
                                            <option>062</option>
                                            <option>063</option>
                                            <option>064</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" id="telePhone" placeholder="'-'없이 입력" >
                                    </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">대표자명</p>
                                        <input type="text" name="representative" id="representative" class="form-control" placeholder="대표자명" onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                대표자명을 입력하세요.
                                            </div>
                                </div>
                            </div>               
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">사업자 등록번호</p>
                                        <input type="text" name="companyNum" id="comNum" class="form-control" placeholder="사업자 등록번호"  onkeyup="inputDataCheck(this.id)" required>
                                            <div class="invalid-feedback">
                                                사업자 등록번호를 입력하세요.
                                            </div>
                                </div>
                            </div>
                            <div class="row align-items-center mt-4">
                                <div class="col">
                                    <p class="fw-bold">증빙서류 첨부</p>
                                        <input class="form-control" type="file" id="formFile"  required>
                                            <div class="invalid-feedback">
                                                증빙서류를 첨부하세요.
                                            </div>
                                </div>
                            </div>                       
                            <div class="row align-items-center mt-4" id="frame2">
                                <p class="fw-bold" id="addressCom">주소</p>
                                    <input type="text" placeholder="우편번호" name="postCode" id="postcode" class="form-control mb-1 " style="display:inline-block;width:100px;"  onkeyup="inputDataCheck(this.id)" required> 
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" id="search"><br>
                                    <input type="text"  name="address" id="address" class="form-control  mb-1" placeholder="주소" onkeyup="inputDataCheck(this.id)" required>
                                    <input type="text" name="detailAddress" id="detailAddress" class="form-control mb-3 col-md-7" placeholder="상세주소"  onkeyup="inputDataCheck(this.id)" required>
                                    <input type="text" name="extraAddress" id="extraAddress" class="form-control mb-3 col-md-7" placeholder="참고항목"  onkeyup="inputDataCheck(this.id)" required>
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