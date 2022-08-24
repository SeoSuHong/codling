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
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/resume_management.css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/resume_management.js"></script>
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
                <ul>
                    <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
                    <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
                </ul>
            </div>
    </header>
    <section>
        <article id="applyStatus">
            <h1>공고 지원 현황</h1>
            <div class="applybox">
            	<c:forEach var="apply" items="${applys}" varStatus="st">
            		<c:if test="${not st.first && st.count % 4 == 1}">
                		<button class="leftArrow"><img src="img/leftArrow.png"></button>
                	</c:if>
                </c:forEach>
                <div class="applys">
                    <div class="applyWrap">
                        <ul class="apply">
                        	<c:forEach var="apply" items="${applys}" varStatus="st">
                        		<c:if test="${st.first || st.count % 4 == 1}">
		                            <li class="apply_item">
	                            </c:if>
	                                <div class="app">
	                                    <div class="app_content">
	                                        <p><span>지원한 공고</span></p>
	                                        <p class="apply_title">${apply.corporateName}</p>
	                                        <b>분야 &emsp; ${apply.fieldName}</b><br>
	                                        <b>경력 &emsp;
	                                        	<c:forTokens var="career" items="${apply.career}" delims=" / ">
							            			<c:if test="${fn:length(apply.career) <= 3}">
							              				<c:if test="${career == '신입'}">
								                			<span>${career}</span>
								                		</c:if>
								                		<c:if test="${career != '신입'}">
								                			<span>${career}년↑</span>
								                		</c:if>
								                	</c:if>
								                
								                	<c:if test="${fn:length(apply.career) > 3}">
								                		<c:if test="${career == '신입'}">
								                			<span>${career} or</span>
								                		</c:if>
								                		<c:if test="${career != '신입'}">
								                			<span>${career}년↑</span>&ensp;&ensp;
								                		</c:if>
								                	</c:if>
										        </c:forTokens>
	                                        </b><br>
	                                        <b>급여 &emsp;
		                                        <c:if test="${apply.pay == '면접 후 결정'}">
		                                        	${apply.pay}
		                                        </c:if>
		                                        <c:if test="${apply.pay != '면접 후 결정'}">
		                                        	${apply.pay}만↑
		                                        </c:if>
	                                        </b><br>
	                                        <b>상태 &emsp; ${apply.status}</b><br>
	                                    </div>
	                                    <div class="viewInfo">
	                                        <a href="jobOpening?no=${apply.jobOpening_no}">공고보기</a>
	                                        <a href="resume_preview.jsp">이력서 보기</a>
	                                    </div>
	                                </div>
	                            <c:if test="${st.count % 4 == 0}">
	                            	</li>
                            	</c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <c:forEach var="apply" items="${applys}" varStatus="st">
            		<c:if test="${not st.first && st.count % 4 == 1}">
                		<button class="rightArrow"><img src="img/rightArrow.png"></button>
                	</c:if>
               	</c:forEach>
            </div>
            <div id="btn_bar">
            	<c:forEach var="apply" items="${applys}" varStatus="st">
            		<c:if test="${not st.first && st.count % 4 == 1}">
    		            <button class="apply_bar"></button>
	                </c:if>
                </c:forEach>
            </div>
        </article>
        <article id="resume">
            <h1>이력서 관리</h1>
            <c:if test="${empty individual.resumeTitle}">
	            <a href="resume_writing">
	            	<div class="resumemg">
	                	<div class="resumemgbox">
	                    	<p><span>이력서</span></p>
	                    	<div class="resumemgbox2">이력서가 없습니다. 이력서를 작성해 주세요</div>
	                	</div>
	            	</div>
	            </a>
	            <div class="btn-res">
	                <a href="resume_writing"><button id="btn-res">이력서 작성</button></a>
	            </div>
            </c:if>
            <c:if test="${not empty individual.resumeTitle}">
            	<div>
            		<p>이력서</p>
            		${individual.resumeTitle}
            		<table>
            			<tr>
            				<td>이름</td>
            				<td>${individual.name}</td>
            			</tr>
            			<tr>
            				<td>경력</td>
            				<td>
            					<c:if test="${empty careers}">
            						신입
            					</c:if>
            					<c:if test="${not empty careers}">
	            					<c:set var="tenureYear"/>
	            					<c:set var="tenureMonth"/>
	            					<c:forEach var="career" items="${careers}">
	            						<fmt:parseNumber var="tenureStartYear" value="${fn:substring(career.tenureStartDate, 0, 4)}" type="number"/>
	            						<fmt:parseNumber var="tenureEndYear" value="${fn:substring(career.tenureEndDate, 0, 4)}" type="number"/>
	            						<fmt:parseNumber var="tenureStartMonth" value="${fn:substring(career.tenureStartDate, 5, 7)}" type="number"/>
	            						<fmt:parseNumber var="tenureEndMonth" value="${fn:substring(career.tenureEndDate, 5, 7)}" type="number"/>
	            						
	            						<c:set var="tenureYear" value="${tenureYear + (tenureEndYear - tenureStartYear)}"/>
	            						<c:set var="tenureMonth" value="${tenureMonth + (tenureEndMonth - tenureStartMonth)}"/>
	            					</c:forEach>
	            					총 ${tenureYear}년 ${tenureMonth}개월 (
	            					<c:forEach var="career" items="${careers}" varStatus="st">
	            						<fmt:parseNumber var="tenureStartYear" value="${fn:substring(career.tenureStartDate, 0, 4)}" type="number"/>
	            						<fmt:parseNumber var="tenureEndYear" value="${fn:substring(career.tenureEndDate, 0, 4)}" type="number"/>
	            						<fmt:parseNumber var="tenureStartMonth" value="${fn:substring(career.tenureStartDate, 5, 7)}" type="number"/>
	            						<fmt:parseNumber var="tenureEndMonth" value="${fn:substring(career.tenureEndDate, 5, 7)}" type="number"/>
	            						<c:if test="${!st.last}">
	            							${career.prev_company} ${tenureEndYear - tenureStartYear}년 ${tenureEndMonth - tenureStartMonth}개월 |
	            						</c:if>
	            						<c:if test="${st.last}">
	            							${career.prev_company} ${tenureEndYear - tenureStartYear}년 ${tenureEndMonth - tenureStartMonth}개월
	            						</c:if>
	            					</c:forEach>
	            					)
	            				</c:if>
            				</td>
            			</tr>
            			<tr>
            				<td>기술스택</td>
            				<td>
            					<c:forTokens var="stack" items="${individual.stack}" delims="/" varStatus="st">
            						<c:if test="${!st.last}">
            							${stack} ·
            						</c:if>
            						<c:if test="${st.last}">
            							${stack}
            						</c:if>
            					</c:forTokens>
            				</td>
            			</tr>
            			<tr>
            				<td>포트폴리오</td>
            				<td>
            					<c:forEach var="portfolio" items="${portfolios}" varStatus="st">
            						<c:if test="${!st.last}">
            							${portfolio.name} ·
            						</c:if>
            						<c:if test="${st.last}">
            							${portfolio.name}
            						</c:if>
            					</c:forEach>
            				</td>
            			</tr>
            			<tr>
            				<td>자격증</td>
            				<td>
            					<c:forEach var="license" items="${licenses}" varStatus="st">
            						<c:if test="${!st.last}">
            							${license.name} ·
            						</c:if>
            						<c:if test="${st.last}">
            							${license.name}
            						</c:if>
            					</c:forEach>
            				</td>
            			</tr>
            			<tr>
            				<td>최종학력</td>
            				<td>
            					
            				</td>
            			</tr>
            		</table>
            	</div>
            </c:if>
        </article>
        <article id="self">
            <h1>자기소개서 관리</h1>
            <c:if test="${empty coverLetters}">
	            <div class="self_box">
	                <div id="self_introduction">
	                    <p><span>자기소개서</span></p>
	                    <div class="self_introductionbox">자기소개서가 없습니다. 자기소개서를 작성해주세요</div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty coverLetters}">
           		<c:forEach var="coverLetter" items="${coverLetters}">
	            	<div class="self_box">
		                <div id="self_introduction">
		                    <p><span>자기소개서</span></p>
		                    <div class="self_introductionbox">${coverLetter.title}</div>
		                    <div class="selfContent">${fn:replace(coverLetter.content, replacePrevChar, '<br>')}</div>
		                </div>
		            </div>
		            <div class="chbtn-box">
		                <input type="button" name="update" id="update" onclick="showUpdate(${coverLetter.no}, '${coverLetter.title}', '${fn:replace(coverLetter.content, replacePrevChar, replaceCurrChar)}')" value="수정">
		                <input type="button" name="delete" id="delete" onclick="self_delete(${coverLetter.no})" value="삭제" >
		            </div>
		        </c:forEach>
            </c:if>
            <div class="btn-sel">
                <input type="button" id="btn-sel" onclick="showWrite()" value="자기소개서 작성">
            </div>
        </article>
        <div id="self_inbox">
            <form name="selfFrm" method="post">
	            <article>
	                <h1>자기소개서</h1>
	                    <div id="self_introduction_box">
	                        <div id="self_box">
	                            <div id="self_title">
	                                <input name="selfTitle" id="input_title" placeholder="제목을 입력해 주세요.">
	                            </div>
	                            <div id="contents_box">
	                                <textarea name="selfContent" id="input_contents" placeholder="내용을 입력해 주세요."></textarea>
	                            </div>
	                        </div>
	                    </div>
	            </article>
	            <div id="btn-self">
	                <input type="button" class="btn-self" id="createBtn" onclick="self_check()" value="작성">
	                <input type="button" class="btn-self" id="updateBtn" onclick="self_update()" value="수정">
	                <input type="button" class="btn-self" onclick="hideWrite()" value="취소">
	                <input type="hidden" name="coverLetterNo">
	            </div>
            </form>
        </div>
    </section>
    <footer>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>       