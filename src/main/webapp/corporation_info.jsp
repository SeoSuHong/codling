<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보</title>
    <link rel="stylesheet" href="css/corporation_info.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/corporation_info.js"></script>
</head>
<body>
    <!--header-->
    <header>
        <div id="menu-bar">
            <div></div>
            <a href="index.jsp"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename"> 고객이름</span> &nbsp;&nbsp;</div>
                </div>
        </div>
        <div id="profile-hover">
            <ul>
                <li id="mypage"><a href="individual_info.jsp"><span>내 정보</span></a></li>
                <li id="resume"><a href="resume_management.jsp"><span>공고 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
        <h2>회원정보</h2>
        <div id="wrap">
            <div class="type">
                <p>아이디</p>
                <div>tbgkdntm</div>
            </div>
            <div class="type">
                <p>회사명</p>
                <div>codling(주)</div>
            </div>
            <div class="type">
                <p>회사 전화번호</p>
                <div>032-833-2333</div>
            </div>
            <div class="type">
                <p>대표자명</p>
                <div>서수홍</div>
            </div>
            <div class="type">
                <p>사업자등록번호</p>
                <div>512-67419-827</div>
            </div>
            <div class="type">
                <p>증빙서류</p>
                <div>증빙서류.pdf</div>
            </div>
            <div class="type">
                <p>주소</p>
                <div>궐동 엔타스빌딩 12층 이젠아카데미</div>
            </div>
        </div>
        <div id="choice">
            <input type="button" class="modify" value="수 정" onclick="">
            <input type="button" class="drop" value="탈 퇴" onclick="">
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