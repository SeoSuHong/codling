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
    <link rel="stylesheet" href="css/job_accountment.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=370fa568d4acbeb9115655e735792c45&libraries=services"></script>
</head>
<body>
    <header>
    <div class="header_Wrap header_top">
        <div class="logo-default">
            <a href="index"><img src="img/logo.png"></a>
        </div>
        <ul>
            <li><a href="newcomer">신입채용</a></li>
            <li><a href="career">경력채용</a></li>
            <li><a href="top100">Top100</a></li>
        </ul>
        <form class="search_box" id="searbox">
            <input type="text" name="searchbox" placeholder="검색어를 입력하세요.">
        </form>
            <input type="button" form="searbox" class="search">
            <a href="logIn.jsp" id="login-btn"><button type="button" id="log">Login</button></a>
    </div>
</header>
<div id="downmenu">
    <nav id="downupmenu">
        <div class="header_Wrap">
                <div class="logo-default" id="title_box">
                    <div class="title_container">
                        <span class="title">${jobOpening.title}</span>
                        <div class="title_inside">
                            <span>${corporation.corporateName}</span>&ensp;&ensp;
                            
                            <span>경력 </span>
                			<c:forTokens var="career" items="${field.career}" delims=" / " varStatus="st">
                				<c:if test="${fn:length(field.career) <= 3}">
                					<c:if test="${career == '신입'}">
			                			<span>${career}</span>&ensp;&ensp;
			                		</c:if>
			                		<c:if test="${career != '신입'}">
			                			<span>${career}년↑</span>&ensp;&ensp;
			                		</c:if>
			                	</c:if>
			                
			                	<c:if test="${fn:length(field.career) > 3}">
			                		<c:if test="${career == '신입'}">
			                			<span>${career} or</span>
			                		</c:if>
			                		<c:if test="${career != '신입'}">
			                			<span>${career}년↑</span>&ensp;&ensp;
			                		</c:if>
			                	</c:if>
			                </c:forTokens>
                            
                            
                            <c:if test="${field.pay == '면접 후 결정'}">
                            <span>급여 ${field.pay}</span>
                            </c:if>
                            <c:if test="${field.pay != '면접 후 결정'}">
                            <span>급여 ${field.pay}만↑</span>
                            </c:if>
                        </div>
                    </div>
                <div class="apply"><a onclick="popUp()">지원하기</a></div>
            </div>
        </div>
    </nav>
</div>
<section>
    <div class="titleWrap">
        <div class="top_title_container">
            <div id="top_title_container">
                <span class="title">${jobOpening.title}</span><br>
                <span class="corpName">${corporation.corporateName}</span>&ensp;&ensp;
                
                
                <span>경력 </span>
                <c:forTokens var="career" items="${field.career}" delims=" / " varStatus="st">
             		<c:if test="${fn:length(field.career) <= 3}">
             			<c:if test="${career == '신입'}">
                			<span class="corpCarrer">${career}</span>&ensp;&ensp;
                		</c:if>
                		<c:if test="${career != '신입'}">
                			<span class="corpCarrer">${career}년↑</span>&ensp;&ensp;
                		</c:if>
                	</c:if>
                
                	<c:if test="${fn:length(field.career) > 3}">
                		<c:if test="${career == '신입'}">
                			<span class="corpCarrer">${career} or</span>
                		</c:if>
                		<c:if test="${career != '신입'}">
                			<span class="corpCarrer">${career}년↑</span>&ensp;&ensp;
                		</c:if>
                	</c:if>
                </c:forTokens>
                
                <c:if test="${field.pay == '면접 후 결정'}">
                <span class="corSalery">급여 ${field.pay}</span>
                </c:if>
                <c:if test="${field.pay != '면접 후 결정'}">
                <span class="corSalery">급여 ${field.pay}만↑</span>
                </c:if>
            </div>
            <div id="apply_box">
                <div class="apply" id="top_apply"><a href="#" onclick="popUp()">지원하기</a></div>
            </div>
        </div>
    </div>
    <hr>
    <article>
        <div class="contents">
            <h2>주요 업무</h2>
                <div class="inContent">
                    <span class="content">${fn:replace(field.work, replaceChar, '</br>')}</span>
                </div>
            <h2>자격요건</h2>
                <div class="inContent">
                    <span class="content">${fn:replace(field.requirement, replaceChar, '</br>')}</span>
                </div>
            <h2>우대 사항</h2>
            <div class="inContent">
                <span class="content">${fn:replace(field.preference, replaceChar, '</br>')}</span>
            </div>
            <h2>채용절차 및 기타 지원 유의사항</h2>
            <div class="inContent">
                <span class="content">${fn:replace(field.process, replaceChar, '</br>')}</span>
            </div>
            <h2>사용 스택 및 툴</h2>
                <div class="corpStacks">
                	<c:forTokens var="stack" items="${field.stack}" delims=" / ">
                    	<div class="stack">${stack}</div>
                    </c:forTokens>
                </div>
            <h2>기업소개</h2>
            <div class="inContent">
                <p>바로티나는 라이브스트리밍 기술에 최적화된 영상엔진 기술과 수년간 쌓아온 다양한 경험을 토대로 온/오프라인이 완벽히 통합되는 새로운 차원의 시도에 거듭 도전합니다.
                   오프라인 위주의 사업군이나 다년간 바뀌지 않았던 영역에서 새로운 Rule에 빨리 적응할 수 있고, 시/공간의 제약을 벗어나 접촉과 접속을 쉽고 편리하게 할 수 있도록 돕겠습니다.
                   
                   We are “fair/exhibition maker”
                   (주)바로티나는 기술력이 있는 스타트업입니다.
                   (주)바로티나의 ‘페어라이브'플랫폼은 기술로 보다 더 가까이, 전시/박람회에 영상을 입혀서 기 존 전시/박람회의 세계를 새롭게 시각화 하여 제시합니다.
                   우리는 전시/박람회의 모든 관계자를 위해 더 나은 내일을 약속합니다. 온/오프라인에서 우리 모 두가 해야 할 역할이 있으며, 잠재력을 최대한 실현할 수 있는 미래와 지속 가능성을 위해 과감하 게 행동하고 단호하게 한 발 더 나아가면, 우리가 함께 할 수 있는 것에는 한계가 없습니다.</p>
            </div>
        </div>
    </article>
    <hr>
        <div id="comcon">
            <div>
                <p><span>모집일</span>${fn:replace(jobOpening.startDate, "-", ".")} - ${fn:replace(jobOpening.endDate, "-", ".")}</p>
                <p><span>근무지역</span>${jobOpening.region}</p>
            </div>
        </div>
        <div id="companyInfo">
            <div class="companyInfo">
                <div class="comLogo"><img src="img/logo.png" alt="회사로고"></div>
                <dl>
                    <dt>기 업 명</dt>
                        <dd>${corporation.corporateName}</dd>                  
                    <dt>연 락 처</dt>
                        <dd>${corporation.corporatePhone}</dd>   
                    <dt>대표자명</dt>
                        <dd>${corporation.ceoName}</dd>
                    <dt>주 &ensp;&ensp; 소</dt>
                        <dd>${corporation.address}</dd>
                </dl>
            </div>
        </div>
        <div id="hr">   
            <hr>
        </div>
		<input type="hidden" id="area" value="${jobOpening.region}">
		<input type="hidden" id="corpName" value="${corporation.corporateName}">
		<div id="mapWrap">
        	<div id="map"></div>
        </div>
        
        <hr>
        <div class="jobs">
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>${jobOpening.title}</dd>
                <dd>${corporation.corporateName}</dd>
                <dd>
                	<c:forTokens var="career" items="${field.career}" delims=" / " varStatus="st">
            			<c:if test="${fn:length(field.career) <= 3}">
              				<c:if test="${career == '신입'}">
	                			<span>${career}</span>&ensp;&ensp;
	                		</c:if>
	                		<c:if test="${career != '신입'}">
	                			<span>${career}년↑</span>&ensp;&ensp;
	                		</c:if>
	                	</c:if>
	                
	                	<c:if test="${fn:length(field.career) > 3}">
	                		<c:if test="${career == '신입'}">
	                			<span>${career} or</span>
	                		</c:if>
	                		<c:if test="${career != '신입'}">
	                			<span>${career}년↑</span>&ensp;&ensp;
	                		</c:if>
	                	</c:if>
			        </c:forTokens>
                </dd>
            </dl>
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>${jobOpening.title}</dd>
                <dd>${corporation.corporateName}</dd>
                <dd>
                	<c:forTokens var="career" items="${field.career}" delims=" / " varStatus="st">
            			<c:if test="${fn:length(field.career) <= 3}">
              				<c:if test="${career == '신입'}">
	                			<span>${career}</span>&ensp;&ensp;
	                		</c:if>
	                		<c:if test="${career != '신입'}">
	                			<span>${career}년↑</span>&ensp;&ensp;
	                		</c:if>
	                	</c:if>
	                
	                	<c:if test="${fn:length(field.career) > 3}">
	                		<c:if test="${career == '신입'}">
	                			<span>${career} or</span>
	                		</c:if>
	                		<c:if test="${career != '신입'}">
	                			<span>${career}년↑</span>&ensp;&ensp;
	                		</c:if>
	                	</c:if>
			        </c:forTokens>
                </dd>
            </dl>
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>Frontend 개발자 모집</dd>
                <dd>Codling corp.</dd>
                <dd>서울 강남</dd>
            </dl>
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>Backend 개발자 모집</dd>
                <dd>Codling corp.</dd>
                <dd>서울 강남</dd>
            </dl>
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>Backend 개발자 모집</dd>
                <dd>Codling corp.</dd>
                <dd>서울 강남</dd>
            </dl>
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>Backend 개발자 모집</dd>
                <dd>Codling corp.</dd>
                <dd>서울 강남</dd>
            </dl>
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
<script src="jQuery/jquery-3.6.0.min.js"></script>
<script src="js/job_accountment.js"></script>
<script src="js/job_apply_popup.js"></script>
</html>