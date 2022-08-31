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
    <script src="js/index_app.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="css/index_style.css">
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
            <form id="searbox"><input type="text" id="search" name="search" class="searchbox" value="" placeholder="검색어를 입력하세요."></form>
            <input type="button" form="searbox" class="btn-search"></input>
            
            <c:if test="${empty indiId && empty corpId}">
            	<button type="button" id="scroll-log" class="log" onclick="location.href = 'login'">Login</button>
            </c:if>
            
            <c:if test="${not empty indiId && empty corpId}">
	            <div id="profile-box" class="profile-box">
	              <div id="scroll-hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${indiName} 님 &nbsp;&nbsp;</div>
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
	              <div id="scroll-hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${corpName} 님 &nbsp;&nbsp;</div>
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
        <div id="login_header">
          <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
          <form id="searbox"><input type="text" id="search" name="search" class="searchbox" value="" placeholder="검색어를 입력하세요." autofocus></form>
          <button type="button" form="searbox" class="btn-search"></button>

          <c:if test="${empty indiId && empty corpId}">
          	<button type="button" id="log" class="log" onclick="location.href = 'login'">Login</button>
          </c:if>
          
          <c:if test="${not empty indiId && empty corpId}">
	          <div id="profile-box" class="profile-box">
	            <div id="hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${indiName} 님 &nbsp;&nbsp;</div>
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
	            <div id="hover-box" class="pf-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> ${corpName} 님 &ensp;&ensp;</div>
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
        <article>
        	<div id="searchChk">
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
	        		<input type="checkbox" name="career" value="1"> 1년↑
	        		<input type="checkbox" name="career" value="3"> 3년↑
	        		<input type="checkbox" name="career" value="5"> 5년↑
	        		<input type="checkbox" name="career" value="7"> 7년↑
	        		<input type="checkbox" name="career" value="10"> 10년↑
	        	</div>
	        	<div id="payList">
	        		<input type="range" id="payRange" min="2500" max="10000" step="500" name="pay" value="0">
	        	</div>
        	</div>
        </article>
        
        <%-- <article>

                     <p><input class="check_box" type="checkbox" name="zone" value="서울"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '서울'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;서울 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="강남"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '강남'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;강남 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="구로 디지털단지"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '구로 디지털단지'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;구로 디지털단지 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="가산 디지털단지"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '가산 디지털단지'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;가산 디지털단지 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="판교 테크노밸리"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '판교 테크노밸리'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;판교 테크노밸리 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="마포"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '마포'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;마포 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="서초"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '서초'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;서초 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="경기"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '경기'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;경기 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="인천"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '인천'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;인천 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="대전"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '대전'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;대전 </p>
                  </div>
                  <div>
                     <p><input class="check_box" type="checkbox" name="zone" value="부산"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '부산'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;부산 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="제주"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '제주'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;제주 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="대구"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '대구'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;대구 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="광주"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '광주'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;광주 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="울산"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '울산'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;울산 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="세종"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '세종'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;세종 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="경상"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '경상'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;경상 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="전라"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '전라'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;전라 </p>
                     <p><input class="check_box" type="checkbox" name="zone" value="충청"<c:forEach var="zone" items="${zone }" varStatus="st"><c:if test="${zone == '충청'}">checked</c:if></c:forEach> onclick="getzoneValue(event)">&nbsp;충청 </p>
                  </div>
               </div>
               <div class="sc_menu" id="career_menu">
                  <p><input class="check_box" type="checkbox" name="career" value="신입"<c:forEach var="career" items="${career }" varStatus="st"><c:if test="${career == '신입'}">checked</c:if></c:forEach> onclick="getcareerValue(event)">&nbsp;신입</p>
                  <p><input class="check_box" type="checkbox" name="career" value="경력"<c:forEach var="career" items="${career }" varStatus="st"><c:if test="${career == '경력'}">checked</c:if></c:forEach> onclick="getcareerValue(event)">&nbsp;경력</p>
               </div>
               <div class="sc_menu" id="task_menu">
                  <c:set var="filed_length" value="${fn:length(filed) }"/>
                  <c:set var="filed_split" value="${filed_length/2}"/>
                  <c:set var="filed_rounds" value="${filed_split-(filed_split%1)}"/>
                  <div>
                     <c:forEach var="filed" items="${filed }" begin="0" end="${filed_rounds }" varStatus="st">
                        <p><input class="check_box" type="checkbox" name="task" value="${filed.name }"<c:forEach var="task" items="${task }" varStatus="st"><c:if test="${task == filed.name}">checked</c:if></c:forEach> onclick="gettaskValue(event)">&nbsp;${filed.name }</p>
                     </c:forEach>
                  </div>
                  <div>
                     <c:forEach var="filed" items="${filed }" begin="${filed_rounds+1 }" varStatus="st">
                        <p><input class="check_box" type="checkbox" name="task" value="${filed.name }"<c:forEach var="task" items="${task }" varStatus="st"><c:if test="${task == filed.name}">checked</c:if></c:forEach> onclick="gettaskValue(event)">&nbsp;${filed.name }</p>
                     </c:forEach>
                  </div>
               </div>
               <input type="hidden" name="search" id="search_down">
               <div id="box_"></div>
            </div>
         </form>
      </article> --%>
        
        
        
        
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
      <!-- 파워광고 -->
      <article>
        <div class="pow_box">
          <button class="leftArrow"><img src="img/leftArrow.png"></button>
          <div class="pow">
            <div class="advertisement">
                <div class="item">
                  <a href="##"><img src="img/img1.jpg" alt=""></a>
                </div>
                <div class="item">
                  <a href="##"><img src="img/img2.jpg" alt=""></a>
                </div>
                <div class="item">
                  <a href="##"><img src="img/img3.jpg" alt=""></a>
                </div>
                <div class="item">
                  <a href="##"><img src="img/img1.jpg" alt=""></a>
                </div>
                <div class="item">
                  <a href="##"><img src="img/img2.jpg" alt=""></a>
                </div>
                <div class="item">
                  <a href="##"><img src="img/img3.jpg" alt=""></a>
                </div>
            </div>
          </div>
          <button class="rightArrow"><img src="img/rightArrow.png"></button>
        </div>
        <div id="btn_bar">
          <button class="apply_bar"></button>
          <button class="apply_bar"></button>
          <button class="apply_bar"></button>
          <button class="apply_bar"></button>
          <button class="apply_bar"></button>
          <button class="apply_bar"></button>
        </div>
      </article>
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
	              	<span>경력 | </span>
					<c:forTokens var="career" items="${anno.career}" delims=" / " varStatus="st">
		              	<c:if test="${fn:length(anno.career) <= 3}">
		              		<c:if test="${career == '신입'}">
		              			${career}&emsp;&emsp;
		              		</c:if>
		              		<c:if test="${career != '신입'}">
		              			${career}년↑&emsp;&emsp;
		              		</c:if>
		              	</c:if>
		              	<c:if test="${fn:length(anno.career) > 3}">
		              		<c:if test="${career == '신입'}">
		              			${career} or
		              		</c:if>
		              		<c:if test="${career != '신입'}">
		              			${career}년↑&emsp;&emsp;
		              		</c:if>
		              	</c:if>
					</c:forTokens>
					<span>급여 | </span>
					<c:if test="${anno.pay == '면접 후 결정'}">
	              		${anno.pay}</span>
	              	</c:if>
	              	<c:if test="${anno.pay != '면접 후 결정'}">
	              		${anno.pay}만원
	              	</c:if>
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