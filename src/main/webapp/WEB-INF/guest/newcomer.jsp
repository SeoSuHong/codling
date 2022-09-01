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
    <title>Codling</title>
    <link href="../../img/headlogo.png" rel="shortcut icon" type="image/x-icon">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/employment_total.js"></script>
    <script src="js/index_app.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/newcomer.css">
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
            	<form action="search" name="topSearchForm">
            		<div id="topSearchWrap">
	            		<input id="topSearch" name="search" placeholder="검색어를 입력하세요.">
			            <a href="javascript:topSearch()"><img alt="검색" src="../../img/search.png" class="searchBtn"></a>
			        </div>
            	</form>
            
            	<c:if test="${empty indiId && empty corpId}">
            		<button type="button" id="scroll-log" class="log" onclick="location.href = 'login'">Login</button>
            	</c:if>
            
            	<c:if test="${not empty indiId && empty corpId}">
	            	<div id="profile-box" class="profile-box">
	              		<div id="scroll-hover-box" class="pf-box">
	              			<img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${indiName} 님 &nbsp;&nbsp;
	              		</div>
	              		<div id="scroll-profile-hover" class="pfhover">
			                <ul>
			                    <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
			                    <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
			                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
			                </ul>
	              		</div>
	            	</div>
            	</c:if>
            
            	<c:if test="${empty indiId && not empty corpId}">
					<div id="profile-box" class="profile-box">
						<div id="scroll-hover-box" class="pf-box">
							<img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${corpName} 님 &nbsp;&nbsp;
						</div>
						<div id="scroll-profile-hover" class="pfhover">
							<ul>
							    <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
							    <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
							    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
							</ul>
						</div>
					</div>
				</c:if>
				
			</div>
		</div>
		<div id="default-header">
			<form action="search" name="searchForm">
				<div id="login_header">
					<a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
					<div id="searchWrap">
						<input id="search" name="search" placeholder="검색어를 입력하세요." autocomplete="off" onfocus="showSearch()">
						<a href="javascript:search()"><img alt="검색" src="../../img/search.png" class="searchBtn"></a>
					</div>

					<c:if test="${empty indiId && empty corpId}">
						<button type="button" id="log" class="log" onclick="location.href = 'login'">Login</button>
					</c:if>
          
					<c:if test="${not empty indiId && empty corpId}">
						<div id="profile-box" class="profile-box">
							<div id="hover-box" class="pf-box">
								<img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${indiName} 님 &nbsp;&nbsp;
							</div>
							<div id="profile-hover" class="pfhover">
								<ul>
									<li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
									<li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
									<li id="logout"><a href="logout"><span>로그아웃</span></a></li>
								</ul>
							</div>
						</div>
					</c:if>
          
					<c:if test="${empty indiId && not empty corpId}">
						<div id="profile-box" class="profile-box">
							<div id="hover-box" class="pf-box">
								<img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${corpName} 님 &ensp;&ensp;
							</div>
							<div id="profile-hover" class="pfhover">
								<ul>
								    <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
								    <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
								    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
								</ul>
							</div>
						</div>
					</c:if>
        		</div>
        
				<!-- 검색 기능 -->
				<article id="searchHide" onmouseleave="hideSearchList()">
					<div id="searchChk" onmouseenter="showSearchList()">
						<div id="area">
							<span>지역 | </span>
							<span class="keyword a"></span>
						</div>
						<div id="field">
							<span>분야 | </span>
							<span class="keyword f"></span>
						</div>
						<div id="career">
							<span>경력 | </span>
							<span class="keyword c"></span>
						</div>
						<div id="pay">
							<span>급여 | </span>
							<span class="keyword p"></span>
						</div>
					 	<img src="../../img/exit.png" id="exitSearch" onclick="hideSearch()">
					</div>
        			<div id="keyList">
        				<div id="areaList">
			        		<input type="checkbox" name="area" value="서울"> 서울
			        		<input type="checkbox" name="area" value="강남"> 강남
			        		<input type="checkbox" name="area" value="구로"> 구로
			        		<input type="checkbox" name="area" value="가산"> 가산
			        		<input type="checkbox" name="area" value="판교"> 판교
			        		<input type="checkbox" name="area" value="마포"> 마포
			        		<input type="checkbox" name="area" value="서초"> 서초
			        		<input type="checkbox" name="area" value="경기"> 경기
			        		<input type="checkbox" name="area" value="인천"> 인천
			        		<input type="checkbox" name="area" value="대전"> 대전
			        		<input type="checkbox" name="area" value="부산"> 부산
			        		<input type="checkbox" name="area" value="제주"> 제주
			        		<input type="checkbox" name="area" value="대구"> 대구
			        		<input type="checkbox" name="area" value="광주"> 광주
			        		<input type="checkbox" name="area" value="울산"> 울산
			        		<input type="checkbox" name="area" value="세종"> 세종
			        		<input type="checkbox" name="area" value="경상"> 경상
			        		<input type="checkbox" name="area" value="전라"> 전라
			        		<input type="checkbox" name="area" value="충청"> 충청
			        	</div>
			        	<div id="fieldList">
			        		<c:forEach var="fieldName" items="${fieldNames}">
			        			<input type="checkbox" name="field" value="${fieldName}"> ${fieldName}
			        		</c:forEach>
			        	</div>
			        	<div id="careerList">
			        		<input type="checkbox" name="career" value="신입"> 신입
			        		<input type="checkbox" name="career" value="1"> 1년
			        		<input type="checkbox" name="career" value="3"> 3년
			        		<input type="checkbox" name="career" value="5"> 5년
			        		<input type="checkbox" name="career" value="7"> 7년
			        		<input type="checkbox" name="career" value="10"> 10년
			        		<input type="checkbox" name="career" value="13"> 13년
			        		<input type="checkbox" name="career" value="15"> 15년
			        		<input type="checkbox" name="career" value="17"> 17년
			        		<input type="checkbox" name="career" value="20"> 20년
			        	</div>
			        	<div id="payList">
			        		<input type="checkbox" name="pay" value="2500"> <span>2,500만</span>
			        		<input type="checkbox" name="pay" value="3000"> <span>3,000만</span>
			        		<input type="checkbox" name="pay" value="3500"> <span>3,500만</span>
			        		<input type="checkbox" name="pay" value="4000"> <span>4,000만</span>
			        		<input type="checkbox" name="pay" value="4500"> <span>4,500만</span>
			        		<input type="checkbox" name="pay" value="5000"> <span>5,000만</span>
			        		<input type="checkbox" name="pay" value="5500"> <span>5,500만</span>
			        		<input type="checkbox" name="pay" value="6000"> <span>6,000만</span>
			        		<input type="checkbox" name="pay" value="6500"> <span>6,500만</span>
			        		<input type="checkbox" name="pay" value="7000"> <span>7,000만</span>
			        		<input type="checkbox" name="pay" value="7500"> <span>7,500만</span>
			        		<input type="checkbox" name="pay" value="8000"> <span>8,000만</span>
			        		<input type="checkbox" name="pay" value="8500"> <span>8,500만</span>
			        		<input type="checkbox" name="pay" value="9000"> <span>9,000만</span>
			        		<input type="checkbox" name="pay" value="9500"> <span>9,500만</span>
			        		<input type="checkbox" name="pay" value="10000"> <span>1억</span>
			        		<input type="checkbox" name="pay" value="11000"> <span>1억 1,000만</span>
			        		<input type="checkbox" name="pay" value="12000"> <span>1억 2,000만</span>
			        		<input type="checkbox" name="pay" value="13000"> <span>1억 3,000만</span>
			        		<input type="checkbox" name="pay" value="14000"> <span>1억 4,000만</span>
			        		<input type="checkbox" name="pay" value="15000"> <span>1억 5,000만</span>
			        		<input type="checkbox" name="pay" value="16000"> <span>1억 6,000만</span>
			        		<input type="checkbox" name="pay" value="17000"> <span>1억 7,000만</span>
			        		<input type="checkbox" name="pay" value="18000"> <span>1억 8,000만</span>
			        		<input type="checkbox" name="pay" value="19000"> <span>1억 9,000만</span>
			        		<input type="checkbox" name="pay" value="20000"> <span>2억</span>
			        	</div>
        			</div>
        		</article>
        	</form>
        	<nav id="menu">
	            <ul>
	              <li><a href="newcomer" class="menu" id="newcomer">신입채용</a></li>
	              <li><a href="career" class="menu" id="career">경력채용</a></li>
	              <li><a href="top100" class="menu" id="scroll_Top100">Top100</a></li>
	            </ul>
        	</nav>
      	</div>
    </header>

    <section id="default">
      	<!-- 일반광고 -->
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach var="anno" items="${announcement}">
				<div class="col">
					<div class="card" onmouseover="showCount(${anno.no})" onmouseout="hideCount(${anno.no})" onclick="location='jobOpening?no=${anno.no}'">
						<img src="img/logo.png" class="card-img-top" alt="...">
						<div class="card-body">
							<p id="corporname">${anno.corporateName}<span id="${anno.no}" class="count"><img src="img/eyes.png">&nbsp; ${anno.count}</span></p>
							<h5 class="card-title">${anno.title}</h5>
							<div class="card-text">
								<p class="contents">
									<!-- forTokens -->
									<c:forTokens var="stack" items="${anno.stack}" delims=" / "  varStatus="st">
										<c:if test="${!st.last}">${stack} · </c:if>
										<c:if test="${st.last}">${stack} </c:if>
									</c:forTokens>
             					</p>
             					<p class="contents">
             						<span>경력 | </span>
									<c:forTokens var="career" items="${anno.career}" delims=" / " varStatus="st">
										<c:if test="${fn:length(anno.career) <= 3}">
											<c:if test="${career == '신입'}">${career}&emsp;&emsp;</c:if>
											<c:if test="${career != '신입'}">${career}년↑&emsp;&emsp;</c:if>
										</c:if>
										<c:if test="${fn:length(anno.career) > 3}">
											<c:if test="${career == '신입'}">${career} or</c:if>
											<c:if test="${career != '신입'}">${career}년↑&emsp;&emsp;</c:if>
										</c:if>
									</c:forTokens>
									<span>급여 | </span>
									<c:if test="${anno.pay == '면접 후 결정'}">${anno.pay}</c:if>
					              	<c:if test="${anno.pay != '면접 후 결정'}">${anno.pay}만원</c:if>
             					</p>
             				</div>
            			</div>
          			</div>
        		</div>
        	</c:forEach>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>