<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codling : 이력서</title>
    <link href="../../img/headlogo.PNG" rel="shortcut icon" type="image/x-icon">
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
                <ul>
                    <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
                    <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
                </ul>
            </div>
    </header>
    <section>
            <div id="Preview">
                <h2 id="title">${individual.resumeTitle }</h2>
                <div id="idInfo">
                    <div>
                        <h2>&nbsp;${name}&nbsp;<span id="gender">${individual.gender }성</span></h2>
                        <p>
                            <span>&nbsp;&nbsp;<img src="img/email.png" class="icon">&nbsp;${individual.email }</span>&nbsp;&nbsp;
                            <span><img src="img/birthday.png" class="icon">&nbsp;${fn:substring(individual.birth, 0, 4) }년생</span>&nbsp;&nbsp;
                            <span><img src="img/career.png" class="icon">
								<c:if test="${empty career}">
	                    				신입
	                    		</c:if>
	                    		<c:if test="${not empty career}">
	                    				<c:set var="tenure" value="0"/>
	                    				<c:set var="month" value="0"/>
	                    				<c:set var="result" value="0"/>
	                    				<c:forTokens var="carS" items="${career.tenureStart}" delims=" / " varStatus="st">
	                    				<c:forTokens var="carE" items="${career.tenureEnd}" begin="${st.index }" end="${st.index }" delims=" / ">
	                    					<fmt:parseNumber var="tenureStartYear" value="${fn:substring(carS, 0, 4)}" type="number"/>
		                    				<fmt:parseNumber var="tenureEndYear" value="${fn:substring(carE, 0, 4)}" type="number"/>
		                    				<fmt:parseNumber var="tenureStartmonth" value="${fn:substring(carS, 5, 7)}" type="number"/>
		                    				<fmt:parseNumber var="tenureEndmonth" value="${fn:substring(carE, 5, 7)}" type="number"/>
		                    				<c:set var="tenure" value="${tenure + (tenureEndYear - tenureStartYear)}"/>
		                    				<c:set var="month" value="${month + (tenureEndmonth - tenureStartmonth)}"/>
	                    				</c:forTokens>
	                    				</c:forTokens>
	                    				<!-- 0년 중에 경력 개월 -->
	                    				<c:if test="${tenure == '0'}">
	                    					<c:if test="${month == '0'}">
	                    						신입
	                    					</c:if>
	                    					<c:if test="${month < 12}">
	                    						<c:if test="${month != '0'}">
	                    							${month}개월
	                    						</c:if>
	                    					</c:if>
	                    					<c:if test="${month == 12}">
	                    						1년
	                    					</c:if>
	                    					<c:if test="${month > 12}">
	                    						${tenure + 1}년 ${month - 12}개월
	                    					</c:if>
	                    					<c:if test="${month > 24}">
	                    						${tenure + 2}년 ${month - 24}개월
	                    					</c:if>
	                    					<c:if test="${month > 36}">
	                    						${tenure + 3}년 ${month - 36}개월
	                    					</c:if>
	                    					<c:if test="${month > 48}">
	                    						${tenure + 4}년 ${month - 48}개월
	                    					</c:if>
	                    					<c:if test="${month > 60}">
	                    						${tenure + 5}년 ${month - 60}개월
	                    					</c:if>
	                    				</c:if>
	                    				
	                    				<!-- 1년 중에 경력 개월 -->
	                    				<c:if test="${tenure == '1'}">
	                    					<c:if test="${month == '0'}">
	                    						${tenure}년
	                    					</c:if>
	                    					<c:if test="${month < 0}">
	                    						<c:set var="result" value="${(tenure * 12) + month}"/>
	                    						${result}개월
	                    					</c:if>
	                    					<c:if test="${month > 0}">
	                    						${tenure }년 ${month}개월
	                    					</c:if>
	                    				</c:if>
	                    				
	                    				<c:if test="${tenure > 1}">
	                    					<!-- 2년 이상 중에 경력 개월 -->
	                    					<c:if test="${month == '0'}">
	                    						${tenure}년
	                    					</c:if>
	                    					<c:if test="${month < 0}">
	                    						<c:if test="${month < -48}">
		                    						<c:set var="result" value="${month + 60}"/>
		                    						${tenure - 5}년 ${result}개월
		                    					</c:if>
	                    						<c:if test="${month < -36}">
		                    						<c:set var="result" value="${month + 48}"/>
		                    						${tenure - 4}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month < -24}">
		                    						<c:set var="result" value="${month + 36}"/>
		                    						${tenure - 3}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month < -12}">
		                    						<c:set var="result" value="${month + 24}"/>
		                    						${tenure - 2}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month >= -12}">
		                    						<c:set var="result" value="${month + 12}"/>
		                    						${tenure - 1}년 ${result}개월
		                    					</c:if>
	                    					</c:if>
	                    					
	                    					<!-- 2년 이상 중에 경력 개월 -->
	                    					<c:if test="${month > 0}">
	                    						<c:if test="${month > 60}">
		                    						<c:set var="result" value="${month - 60}"/>
		                    						${tenure + 5}년 ${result}개월
		                    					</c:if>
	                    						<c:if test="${month > 48}">
		                    						<c:set var="result" value="${month - 48}"/>
		                    						${tenure + 4}년 ${result}개월
		                    					</c:if>
	                    						<c:if test="${month > 36}">
		                    						<c:set var="result" value="${month - 36}"/>
		                    						${tenure + 3}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month > 24}">
		                    						<c:set var="result" value="${month - 24}"/>
		                    						${tenure + 2}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month > 12}">
		                    						<c:set var="result" value="${month - 12}"/>
		                    						${tenure + 1}년 ${result}개월
		                    					</c:if>
		                    					<c:if test="${month <= 12}">
		                    						<c:set var="result" value="${month}"/>
		                    						${tenure}년 ${result}개월
		                    					</c:if>
	                    					</c:if>
	                    				</c:if>
	                    				
	                    			</c:if>
							</span>
                        </p>
                        <p>&nbsp;&nbsp;<img src="img/phone.png" class="icon">&nbsp;${fn:substring(individual.phone, 0, 3)}-${fn:substring(individual.phone, 3, 7)}-${fn:substring(individual.phone, 7, 11)}</p>
                        <p>&nbsp;&nbsp;<img src="img/address.png" class="icon">&nbsp;${individual.address}</p>
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