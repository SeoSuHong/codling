<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/resume_preview.css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/resume_preview.js"></script>
</head>
<body onresize="update_screen_size()">
    <header>
        <div id="menu-bar">
            <div></div>
            <a href="index.jsp"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${name} 님 &nbsp;&nbsp;</div>
                </div>
        </div>
            <div id="profile-hover">
            	<c:if test="${not empty indiId}">
	                <ul>
	                    <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
	                    <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
	                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
	                </ul>
	            </c:if>
	            <c:if test="${not empty corpId}">
	                <ul>
	                    <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
	                    <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
	                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
	                </ul>
	            </c:if>
            </div>
    </header>
    <section>
            <div id="Preview">
                <h2 id="title">${individual.resumeTitle}</h2>
                <div id="idInfo">
                    <div>
                        <h2>&nbsp;(${individual.name})&nbsp;<span id="gender">${individual.gender}성</span></h2>
                        <p>
                            <span>신입,경력</span>
                            <span>&nbsp;&nbsp;사용자 이메일</span> | 
                            <span>사용자 생년월일</span> | 
                        </p>
                        <p>&nbsp;&nbsp;사용자 전화번호</p>
                        <p>&nbsp;&nbsp;사용자 주소</p>
                        <p>&nbsp;&nbsp;사용자 상세주소</p>
                    </div>
                </div>
                <div class="resume" id="education">
                    <div class="fr">
                        <h2>학력</h2>
                    </div>
                    <div class="content">
                        <p id="schoolname">학교이름 / 과정</p>
                        <p id="schooinfo">학과정보</p>
                        <p id="schooend">졸업날짜</p>
                        <p id="scor">학점 &ensp; 0.0/4.5</p>
                    </div>
                </div>
                <div class="resume" id="stack">
                    <div class="fr">
                        <h2>보유기술스택</h2>
                    </div>
                    <div class="content">
                        <p id="sts">Java, HTML5, CSS3, JavaScript, SQL, JSP, C, C#, C++, Eclipse, Bootstrap, Jquery, MySQL</p>
                    </div>
                </div>
                <div class="resume" id="career">
                    <div class="fr">
                        <h2>경력사항</h2>
                    </div>
                    <div class="content">
                        <p id="comname">회사이름</p>
                        <p id="part">부서 / 직책,직급</p>
                        <p>퇴사날짜</p>
                        <p>주요업무</p>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem impedit a perspiciatis, iste repellendus sunt aliquid facere aperiam molestiae ipsam ipsa temporibus. Laudantium harum ab, odit labore ut similique dolor est aperiam, officiis facilis excepturi et corporis. Nihil reprehenderit exercitationem doloremque obcaecati, nisi itaque corporis labore ducimus. Dolores, porro excepturi!</p>
                    </div>
                </div>
                <div class="resume" id="license">
                    <div class="fr">
                        <h2>자격증 내역</h2>
                    </div>
                    <div class="content">
                        <p id="licname">자격증 이름</p>
                        <p id="agency">발행기관</p>
                        <p>취득날짜</p>
                    </div>
                </div>
                <div class="resume" id="resume">
                    <div class="fr">
                        <h2>자기소개</h2>
                    </div>
                    <div class="content">
                        <p id="reti">자기소개서 제목</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui, accusantium ullam inventore modi mollitia labore laborum saepe illo animi officiis sit magnam ipsum ratione commodi iure nulla dolorem, nobis perspiciatis ipsam consequatur! Aliquid dicta accusantium cumque a sunt, harum quo ex facilis accusamus. Rerum autem accusantium fuga quos repellat at beatae, corporis asperiores modi aliquam excepturi quo vel ipsum hic distinctio ratione ab doloribus eum dolores iste quas perferendis reprehenderit. Id ab distinctio beatae maiores aliquam modi voluptates veritatis quidem facere tenetur eveniet ratione, deleniti dolor sit dolorum maxime itaque nesciunt adipisci delectus consequuntur incidunt debitis doloremque. Ea, voluptas nisi.</p>
                    </div>
                </div>
                <div class="resume" id="popol">
                    <div class="fr">
                        <h2>포트폴리오</h2>
                    </div>
                    <div class="content">
                        <p id="url">github &ensp;&ensp;url : </p>
                        <p id="file">첨부파일 &ensp;&ensp;파일이름 </p>
                    </div>
                </div>
                <form action="" method="post">
                    <input type="hidden" name="resumNo" value="resumNo">
                    <div id="btn_box">
                        <div>
                            <button type="button" class="btn_" id="yes"><span>수락</span></button>
                            <button type="button" class="btn_" id="no"><span>거절</span></button>
                        </div>
                    </div>
                </form>
            </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>       