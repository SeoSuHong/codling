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
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/employment_total.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/career.css">
</head>
<body>
  <header>
    <div id="scroll-header">
      <div id="scroll-header-box">
        <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
        <nav id="menu">
          <ul>
            <li><a href="newcomer" class="menu" id="scroll_newcomer">신입채용</a></li>
            <li><a href="career" class="menu" id="scroll_career">경력채용</a></li>
            <li><a href="top100" class="menu" id="scroll_Top100">Top100</a></li>
          </ul>
        </nav>
        <form id="searbox"><input type="text" id="search" name="search" class="searchbox" value="" placeholder="검색어를 입력하세요." autofocus></form>
        <input type="button" form="searbox" class="btn-search"></input>
        <button type="button" id="scroll-log" class="log" onclick="location='logIn.jsp'">Login</button>
        <div id="profile-box" class="profile-box">
          <div id="scroll-hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> 고객이름 &nbsp;&nbsp;</div>
          <div id="scroll-profile-hover" class="pfhover">
            <ul>
                <li id="mypage"><a href="#"><span>내 정보</span></a></li>
                <li id="resume"><a href="resume_management.jsp"><span>이력서 관리</span></a></li>
                <li id="logout"><a href="#"><span>로그아웃</span></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  <div id="default-header">
    <div id="login_header">
      <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
      <form id="searbox"><input type="text" id="search" name="search" class="searchbox" value="" placeholder="검색어를 입력하세요."></form>
      <button type="button" form="searbox" class="btn-search"></button>
      <button type="button" id="log" class="log" onclick="location='logIn.jsp'">Login</button>
      <div id="profile-box" class="profile-box">
        <div id="hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> 고객이름 &nbsp;&nbsp;</div>
        <div id="profile-hover" class="pfhover">
          <ul>
              <li id="mypage"><a href="#"><span>회원정보</span></a></li>
              <li id="resume"><a href="resume_management.jsp"><span>이력서 관리</span></a></li>
              <li id="logout"><a href="#"><span>로그아웃</span></a></li>
          </ul>
        </div>
      </div>
    </div>
    <nav id="menu">
        <ul>
          <li><a href="newcomer" class="menu" id="newcomer">신입채용</a></li>
          <li><a href="career" class="menu" id="career">경력채용</a></li>
          <li><a href="top100" class="menu" id="scroll_Top100">Top100</a></li>
        </ul>
    </nav>
  </div>
</header>
    <section>
    <c:if test="${not empty announcement}">
      <div class="row row-cols-1 row-cols-md-4 g-4">
        <div class="col" style="cursor: pointer;" onclick="location='job_accountment'">
          <div class="card">
            <img src="img/logo.png" class="card-img-top" alt="...">
            <!-- 공고 -->
            <c:forEach var="anno" items="${announcement}">
	            <div class="card-body">
	            	<p id="corporname">${anno.corporateName}</p>
	              <h5 class="card-title">${anno.title}</h5>
	              <div class="card-text">
	              <!-- forTokens -->
	              	<p class="contents">
	              	<c:forTokens var="stack" items="${anno.stack}" delims=" / "  varStatus="st">
		              	<!-- if -->
		              	<c:if test="${!st.last}">
		              		${stack} · 
		              	</c:if>
		              	<c:if test="${st.last}">
		              		${stack} 
		              	</c:if>
	              	</c:forTokens>
	              	</p>
	              	<p class="contents">
	              	<c:forTokens var="career" items="${anno.career}" delims=" / " varStatus="st">
		              	<c:if test="${fn:length(anno.career) <= 3}">
		              		<c:if test="${career == '신입'}">
		              			${career}
		              		</c:if>
		              		<c:if test="${career != '신입'}">
		              			경력 ${career}년↑
		              		</c:if>
		              	</c:if>
		              	<c:if test="${fn:length(anno.career) > 3}">
		              		<c:if test="${career == '신입'}">
		              			${career} or
		              		</c:if>
		              		<c:if test="${career != '신입'}">
		              			${career}년↑
		              		</c:if>
		              	</c:if>
		              	</c:forTokens>
		              	<span>${anno.pay}만원</span>
	              	</p>
	              </div>
	            </div>
            </c:forEach>
          </div>
        </div>
      </div>
      </c:if>
    </section>
    <footer>
      <a href="#up"><img src="img/footerLogo.png"></a>
      <a href="#">전체서비스</a>&ensp;|&ensp; 
      <a href="#">이용약관</a>&ensp;|&ensp; 
      <a href="#">개인정보처리방침</a>&ensp;|&ensp;
      <a href="#">제휴문의</a>&ensp;| 
      © CODLING Corp.
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>