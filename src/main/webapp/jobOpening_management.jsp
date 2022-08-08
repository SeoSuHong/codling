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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/jobOpening_management.css">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script src="jQuery/jquery-ui.min.js"></script>
    <script src="js/jobOpening_management.js"></script>
</head>
<body onresize="update_screen_size()">
    <header>
        <div id="menu-bar">
            <div></div>
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename"> ${id}</span> &nbsp;&nbsp;</div>
                </div>
        </div>
        <div id="profile-hover">
            <ul>
                <li id="mypage"><a href="#"><span>내 정보</span></a></li>
                <li id="resume"><a href="resume_management.jsp"><span>공고 관리</span></a></li>
                <li id="logout"><a href="#"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
        <article id="resume">
            <h1>공고 관리</h1>
            <c:if test="${not empty jobOpeningManagement}">
	            <c:forEach var="job" items="${jobOpeningManagement}">
		            <div class="resumemg" style="cursor: pointer;" onclick="location='job_accountment?no=${job.no}'">
		                <div class="resumemgbox">
		                    <p><span>내가올린 공고</span></p>
		                    <a type="button" id="applicant_status" href='applicant_status.jsp'><span>지원 현황</span></a>
		                    <div class="resumemgbox2">
		                        <p><span>${job.title}</span></p>
		                        <table>
		                            <tr>
		                                <td>모집일자</td>
		                                <td>${job.startDate} ~ ${job.endDate}</td>
		                            </tr>
		                            <tr>
		                                <td>모집분야</td>
		                                <td>${job.name}</td>
		                            </tr>
		                            <tr>
		                                <td>경력여부</td>
		                                <td>
			                                <c:forTokens var="career" items="${job.career}" delims=" / " varStatus="st">
			                                	<c:if test="${fn:length(job.career) <=3 }">
			                                		<c:if test="${career == '신입'}">
			                                			${career}
			                                		</c:if>
			                                		<c:if test="${career != '신입'}">
			                                			경력 (${career}년 이상)
			                                		</c:if>
			                                	</c:if>
			                                	<c:if test="${fn:length(job.career) > 3 }">
			                                		<c:if test="${career == '신입'}">
			                                			${career}
			                                		</c:if>
			                                		<c:if test="${career != '신입'}">
			                                			, 경력 (${career}년 이상)
			                                		</c:if>
			                                	</c:if>
			                                </c:forTokens>
		                                </td>
		                            </tr>
		                            <tr>
		                                <td>직급/직책</td>
		                                <td>
			                                <c:forTokens var="position" items="${job.position}" delims=" / " varStatus="pst">
			                                	<c:if test="${!pst.last}">
			                                		${position},&nbsp;
			                                	</c:if>
			                                	<c:if test="${pst.last}">
			                                		${position}
			                                	</c:if>
			                                </c:forTokens>
										</td>
		                            </tr>
		                            <tr>
		                                <td>근무지 주소</td>
		                                <td>${job.region}</td>
		                            </tr>
		                        </table>
		                        <div class="chbtn-box">
		                            <input type="button" name="update" id="update" value="수정" src="">
		                            <input type="submit" name="delete" id="delete" value="삭제" />
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </c:forEach>
            </c:if>
            <c:if test="${empty jobOpeningManagement}">
	            <div class="resumemg" style="cursor: pointer;" onclick="location='jobOpening_writing.jsp'">
		                <div class="resumemgbox">
		                    <p><span>내가올린 공고</span></p>
		                    <div class="resumemgbox2">
		                        <h2>올린 공고가 없습니다.</h2>
		                        <p>공고를 작성해주세요</p>
		                    </div>
		                </div>
		            </div>
				</c:if>
            <div class="btn-res">
                <a href="jobOpening_writing.jsp"><button action="" id="btn-res"><span class="btn-resspan">공고 작성</span></button></a>
            </div>
         </article>
    </section>
    <footer>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>