<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/job_accountment.css">
</head>
<body>
    <header>
    <div class="header_Wrap header_top">
        <div class="logo-default">
            <a href="index.jsp"><img src="img/logo.png"></a>
        </div>
        <ul>
            <li><a href="newcomer.jsp">신입채용</a></li>
            <li><a href="career.jsp">경력채용</a></li>
            <li><a href="Top100.jsp">Top100</a></li>
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
                        <span class="title">Backend Engineer 채용</span>
                        <div class="title_inside">
                            <span>Codling</span>
                            <span>인천 구월</span>
                            <span>경력 3년<span class="normalFont">↑</span></span>
                            <span>대졸 이상</span>
                            <span>3000만<span class="normalFont">↑</span></span>
                        </div>
                    </div>
                <div class="apply"><a href="#" onclick="popUp()">지원하기</a></div>
            </div>
        </div>
    </nav>
</div>
<section>
    <form class="confrm" action="" method="post" name="">
        <div class="top_title_container">
            <div id="top_title_container">
                <span class="title">Backend Engineer 채용</span><br>
                <span class="corpName">Codling</span>
                <span class="corpLocation">인천 구월</span>
                <span class="corpCarrer">경력 3년<span class="normalFont">↑</span></span>
                <span class="corpEdu">대졸 이상</span>
                <span class="corSalery">3000만<span class="normalFont">↑</span></span>
            </div>
            <div id="apply_box">
                <div class="apply" id="top_apply"><a href="#" onclick="popUp()">지원하기</a></div>
            </div>
        </div>
    </form>
    <hr>
    <article>
        <div class="contents">
            <h2>주요 업무</h2>
                <div class="inContent">
                    <p>• 페어라이브 서비스의 다양한 웹 서비스, 웹앱, 백오피스를 개발합니다.</p>
                    <p>• Javascript web application framework, library 개발 및 운영합니다.</p>
                    <p>• 플랫폼개발, 메인터넌스, 이커머스솔루션</p>
                </div>
            <h2>자격요건</h2>
                <div class="inContent">
                    <p>• 나이/성별/학력/전공 무관</p>
                    <p>• 1년 이상의 웹 프론트엔드 개발 경험(신입가능)</p>
                    <p>• HTML(5), CSS, Javascript(최소 ES5), React 기본 지식 보유</p>
                    <p>• AWS, Git & Github, HTTP, RESTful API 클라이언트 개발 경험</p>
                    <p>• Javascript MV* 프레임웍 기반 웹앱 개발 및 운영 경험</p>
                    <p>• Redux, Redux-Saga, RxJS 등 개발 및 운영 경험</p>
                    <p>• 기획/디자인/운영 등 다양한 직군과 같이 문제를 정의하고 해결책을 찾아나갈 수 있는 협업 능력</p>
                </div>
            <h2>우대 사항</h2>
            <div class="inContent">
                <p>• TypeScript 개발 및 운영 경험이 있으신 분</p>
                <p>• 페어 코딩 및 코드 리뷰 경험이 있으신 분</p>
                <p>• 단위 테스트, 통합 테스트 자동화 및 배포 자동화 경험이 있으신 분</p>
                <p>• 웹사이트 성능 측정 및 최적화 경험이 있으신 분</p>
                <p>• 웹사이트 보안에 대한 이해</p>
                <p>• Javascript 관련 오픈 소스 기여 경험이 있으신 분</p>
                <p>• 백앤드 서비스 개발 경험 및 Database에 대한 이해 (RDBMS, No-SQL)</p>
                <p>• 새로운 것에 도전하고, 스타트업의 성장에 함께 하고 싶은 분</p>
            </div>
            <h2>혜택 및 복지</h2>
            <div class="inContent">
                <p>직원중심의 조직문화를 회사의 성장과 함께 멤버들이 만들어 갑니다.</p><br>
                <p>자유로운 복장에 유연한 사고와 업무환경을 추구합니다. 스타트업인지라 대기업의 복지와 비교를 하면 안되지만, 우리가 그러한 방향으로 상황별 복지를 만들어 가는 보람도 있을 듯 합니다.</p><br>
                <p>성과급지급, 스톡옵션지급, 퇴직금, 야근식대지원, 유연근무제, 내일채움공제(2022년 도입), 회식 상시, 4대보험, 간식제공, 생일휴가 등의 기본 문화가 있고요.. 현재의 사업의 안착과 더불어 재택근무에 대한 룰도 만들어 갈 예정입니다.</p>
            </div>
            <h2>채용절차 및 기타 지원 유의사항</h2>
            <div class="inContent">
                <p>• 전형절차 : 서류지원 > 코딩테스트 > 직무면접 > 임원면접 (* 전형 절차는 진행 상황에 따라 변경될 수 있습니다)</p>
                <p>• 서류 합격 시 원활한 채용 프로세스 진행을 위해, 11번가 채용 시스템에 지원서 등록을 요청 드리고 있습니다. 양해 부탁 드립니다.</p>
                <p>• 본 채용은 수시 진행으로 계획된 채용이 완료되면 조기 마감될 수 있습니다.</p>
            </div>
            <h2>사용 스택 및 툴</h2>
                <div class="corpStacks">
                    <div class="stack">JAVA</div>
                    <div class="stack">GIT</div>
                    <div class="stack">JSP</div>
                    <div class="stack">mySQL</div>
                    <div class="stack">SPRING</div>
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
                <p><span>마감일</span>2099.12.31</p>
                <p><span>근무지역</span>인천광역시 남동구 인주대로 593 엔타스 12층</p>
            </div>
        </div>
        <div id="companyInfo">
            <div class="companyInfo">
                <div class="comLogo"><img src="img/logo.png" alt="회사로고"></div>
                <dl>
                    <dt>기업형태</dt>
                        <dd>중소기업</dd>                  
                    <dt>업종</dt>
                        <dd>웹 개발</dd>   
                    <dt>매출액</dt>
                        <dd>100억 원</dd>  
                    <dt>주요서비스</dt>
                        <dd>Codling</dd>
                </dl>
                <dl>
                    <dt>사원 수</dt>
                        <dd>5명<span>(2022년 기준)</span></dd>
                    <dt>설립일</dt>
                        <dd>2022년 7월 13일</dd>
                    <dt>대표자명</dt>
                        <dd>서수홍</dd>
                    <dt>홈페이지</dt>
                        <dd><a href="#">www.codling.co.kr</a></dd>
                </dl>
            </div>
        </div>
        <div id="hr">   
            <hr>
        </div>
        <!--
        <div id="map">
            <div class="map">지도 api</div>
        </div>
        <hr>
        -->
        <div class="jobs">
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>Frontend 개발자 모집</dd>
                <dd>Codling corp.</dd>
                <dd>서울 강남</dd>
            </dl>
            <dl>
                <dt><img src="img/logo.png" alt=""></dt>
                <dd>Frontend 개발자 모집</dd>
                <dd>Codling corp.</dd>
                <dd>서울 강남</dd>
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
<script src="jQuery/jquery-3.6.0.min.js"></script>
<script src="js/job_accountment.js"></script>
<script src="js/job_apply_popup.js"></script>
</body>
</html>