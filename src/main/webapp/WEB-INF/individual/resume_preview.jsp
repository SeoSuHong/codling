<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />
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
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
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
                        <h2>&nbsp;${individual.name}&nbsp;<span id="totalCareer">
							<c:if test="${empty careers}">신입</c:if>
							<c:if test="${not empty careers}">
								<c:set var="totalYear"/>
								<c:set var="totalMonth"/>
								<c:forEach var="career" items="${careers}">
									<c:set var="tenureYear" value="${fn:substring(career.tenureEndDate, 0, 4) - fn:substring(career.tenureStartDate, 0, 4)}"/>
									<c:set var="tenureMonth" value="${fn:substring(career.tenureEndDate, 5, 7) - fn:substring(career.tenureStartDate, 5, 7)}"/>
									<c:set var="totalYear" value="${totalYear + tenureYear}"/>
									<c:set var="totalMonth" value="${totalMonth + tenureMonth}"/>
								</c:forEach>
								<c:if test="${totalMonth < 0}">
									<c:set var="totalYear" value="${totalYear - 1}"/>
									<c:set var="totalMonth" value="${totalMonth + 12}"/>
								</c:if>
								<c:if test="${totalYear == 0}">
									총 경력 ${totalMonth}개월
								</c:if>
								<c:if test="${totalMonth == 0}">
									총 경력 ${totalYear}년
								</c:if>
								<c:if test="${totalYear != 0 && totalMonth != 0}">
									총 경력 ${totalYear}년 ${totalMonth}개월
								</c:if>
							</c:if>
						</span></h2>
                        <p>	
                        	&nbsp;&nbsp;<span>${individual.gender}성</span> |
                        	<fmt:formatDate var="nowYear" value="${now}" pattern="yyyy"/>
                        	<fmt:parseNumber var="birthYear" value="${fn:substring(individual.birth, 0, 4)}" type="number"/>
                            <span>${nowYear - birthYear}세</span> |
                            <span>
                            	<c:forTokens var="birth" items="${individual.birth}" delims="-" varStatus="st">
                            		<c:if test="${!st.last}">
                            			${birth}.
                            		</c:if>
                            		<c:if test="${st.last}">
                            			${birth}
                            		</c:if>
                            	</c:forTokens>
                            </span>
                        </p>
                        <p>&nbsp;&nbsp;
                        	${fn:substring(individual.phone, 0, 3)}-${fn:substring(individual.phone, 3, 7)}-${fn:substring(individual.phone, 7, 11)}
                        </p>
                        <p>&nbsp;&nbsp; ${individual.email}</p>
                        <p>&nbsp;&nbsp; ${individual.address}</p>
                    </div>
                </div>

                <div class="resume" id="education">
                    <div class="fr">
                        <h2>학력</h2>
                    </div>
                    <div class="content">
                    	<c:forEach var="education" items="${educations}" varStatus="st">
	                        <p id="schoolname">${education.schoolName} | ${education.school} <span class="status">(${education.status})</span></p>
	                        <p id="schooinfo">${education.department}</p>
	                        <p id="schooend">${fn:substring(education.schoolStartDate, 0, 4)}년 ${fn:substring(education.schoolStartDate, 5, 7)}월 ~ ${fn:substring(education.schoolEndDate, 0, 4)}년 ${fn:substring(education.schoolEndDate, 5, 7)}월</p>
	                        <c:if test="${education.score != 0}">
	                        	<p id="scor">학점 &ensp; ${education.score}/4.5</p>
	                        </c:if>
                    		<c:if test="${!st.last}">
                    			<hr class="hr">
                    		</c:if>
	                    </c:forEach>
                    </div>
                </div>
                <hr>
                <div class="resume" id="stack">
                    <div class="fr">
                        <h2>보유기술스택</h2>
                    </div>
                    <div class="content">
                        <p id="sts">
                        	<c:forTokens var="stack" items="${individual.stack}" delims="/" varStatus="st">
                        		${stack} <c:if test="${!st.last}">·</c:if>
                        	</c:forTokens>
                        </p>
                    </div>
                </div>
                <hr>
                <c:if test="${not empty careers}">
	                <div class="resume" id="career">
	                    <div class="fr">
	                        <h2>경력사항</h2>
	                    </div>
	                    <div class="content">
	                    	<c:forEach var="career" items="${careers}" varStatus="st">
	                    		<c:set var="careerYear" value="${fn:substring(career.tenureEndDate, 0, 4) - fn:substring(career.tenureStartDate, 0, 4)}"/>
	                    		<c:set var="careerMonth" value="${fn:substring(career.tenureEndDate, 5, 7) - fn:substring(career.tenureStartDate, 5, 7)}"/>
	                    		<c:if test="${careerMonth < 0}">
	                    			<c:set var="careerYear" value="${careerYear - 1}"/>
	                    			<c:set var="careerMonth" value="${careerMonth + 12}"/>
	                    		</c:if>
		                        <p id="comname">${career.prev_company} <span class="careerDate">(
		                        	<c:if test="${careerYear == 0}">
		                        		${careerMonth}개월
		                        	</c:if>
		                        	<c:if test="${careerMonth == 0}">
		                        		${careerYear}년
		                        	</c:if>
		                        	<c:if test="${careerYear != 0 && careerMonth != 0}">
		                        		${careerYear}년 ${careerMonth}개월
		                        	</c:if>
		                        )</span></p>
		                        <p id="part">${career.department} / ${career.position}</p>
		                        <p>${fn:substring(career.tenureStartDate, 0, 4)}년 ${fn:substring(career.tenureStartDate, 5, 7)}월 ~ ${fn:substring(career.tenureEndDate, 0, 4)}년 ${fn:substring(career.tenureEndDate, 5, 7)}월</p>
		                        <p>주요업무</p>
		                        <p>${career.work_content}</p>
		                        <c:if test="${!st.last}"><hr class="hr"></c:if>
	                        </c:forEach>
	                    </div>
	                </div>
	                <hr>
	            </c:if>
                <c:if test="${not empty licenses}">
	                <div class="resume" id="license">
	                    <div class="fr">
	                        <h2>자격증 내역</h2>
	                    </div>
	                    <div class="content">
	                    	<c:forEach var="license" items="${licenses}" varStatus="st">
		                        <p id="licname">${license.name} <span class="pass">(${license.pass})</span></p>
		                        <p>${license.agency}</p>
		                        <p>취득일&emsp;${fn:substring(license.acquireDate, 0, 4)}.${fn:substring(license.acquireDate, 5, 7)}.${fn:substring(license.acquireDate, 8, 10)}</p>
		                        <c:if test="${!st.last}"><hr class="hr"></c:if>
		                    </c:forEach>
	                    </div>
	                </div>
	                <hr>
	            </c:if>
                <c:if test="${not empty portfolios}">
	                <div class="resume" id="popol">
	                    <div class="fr">
	                        <h2>포트폴리오</h2>
	                    </div>
	                    <div class="content">
	                    	<c:forEach var="portfolio" items="${portfolios}" varStatus="">
	                    		<p class="portfolioName">${portfolio.name}</p>
		                        <p id="url">url : ${portfolio.url}</p>
		                        <p id="file">첨부파일 : ${portfolio.fileName}</p>
		                        <c:if test="${!st.last}"><hr class="hr"></c:if>
		                    </c:forEach>
	                    </div>
	                </div>
	                <hr>
	            </c:if>
                <c:if test="${not empty coverLetter}">
	                <div class="resume" id="resume">
	                    <div class="fr">
	                        <h2>자기소개서</h2>
	                    </div>
	                    <div class="content">
	                        <p id="reti">${coverLetter.title}</p>
	                        <p>${coverLetter.content}</p>
	                    </div>
	                </div>
	                <hr>
	            </c:if>
                <form action="" method="post">
                    <input type="hidden" name="resumNo" value="resumNo">
                    <div id="btn_box">
                        <div>
                        	<c:if test="${not empty corpId}">
	                            <button type="button" class="btn_" id="yes"><span>수락</span></button>
	                            <button type="button" class="btn_" id="no"><span>거절</span></button>
	                        </c:if>
	                        <c:if test="${not empty indiId}">
	                            <button type="button" class="btn_" id="yes"><span>수정</span></button>
	                            <button type="button" class="btn_" id="no"><span>삭제</span></button>
	                        </c:if>
                        </div>
                    </div>
                </form>
            </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>       