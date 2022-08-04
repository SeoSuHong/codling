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
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename"> ${name} 님</span> &nbsp;&nbsp;</div>
                </div>
        </div>
        <div id="profile-hover">
            <ul>
                <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
                <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
        <article id="resume">
            <h1>공고 관리</h1>
            
            <c:forEach var="opening" items="jobOpenings">
            <a href="job_accountment"><div class="resumemg">
                <div class="resumemgbox">
                    <p><span>내가올린 공고</span></p>
                    <button type="button" id="applicant_status" onclick="location.href='applicant_status.jsp'"><span>지원 현황</span></button>
                    <div class="resumemgbox2">
                    	<c:set var="jobOpening" value="${opening.jobOpening}"/>
                        <p><span>${jobOpening.title}</span></p>
                        <table>
                            <tr>
                                <td>모집일자</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>모집분야</td>
                                <td>
								<c:forEach var="field" items="${jobOpening.fields}" varStatus="st">
									<c:if test="${!st.last}">
										${field.name} / 
									</c:if>
									<c:if test="${st.last}">
										${field.name}
									</c:if>
								</c:forEach>
								</td>
                            </tr>
                            <tr>
                                <td>경력여부</td>
                                <td>
                                <c:forEach var="field" items="${jobOpening.fields}" varStatus="st">
									<c:if test="${!st.last}">
										${field.career} / 
									</c:if>
									<c:if test="${st.last}">
										<c:if test="${field.career == '신입'}">
											${field.career}
										</c:if>
										<c:if test="${field.career != '신입'}">
											${field.career}년↑
										</c:if>
									</c:if>
								</c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>직급/직책</td>
                                <td>
                                <c:forEach var="field" items="${jobOpening.fields}" varStatus="st">
									<c:if test="${!st.last}">
										${field.position} / 
									</c:if>
									<c:if test="${st.last}">
										${field.position}
									</c:if>
								</c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>근무지 주소</td>
                                <td>${jobOpening.region}</td>
                            </tr>
                        </table>
                        <div class="chbtn-box">
                            <input type="button" name="update" id="update" value="수정" src="">
                            <input type="submit" name="delete" id="delete" value="삭제" />
                        </div>
                    </div>
                </div>
            </div></a>
            </c:forEach>
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