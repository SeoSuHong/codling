<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="index.jsp"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"> 고객이름 &nbsp;&nbsp;</div>
                </div>
        </div>
            <div id="profile-hover">
                <ul>
                    <li id="mypage"><a href="#"><span>내 정보</span></a></li>
                    <li id="resume"><a href="resume_management.jsp"><span>이력서 관리</span></a></li>
                    <li id="logout"><a href="#"><span>로그아웃</span></a></li>
                </ul>
            </div>
    </header>
    <section>
        <article id="applyStatus">
            <h1>공고 지원 현황</h1>
            <div class="applybox">
                <button class="leftArrow"><img src="img/leftArrow.png"></button>
                <div class="applys">
                    <div class="applyWrap">
                        <ul class="apply">
                            <li class="apply_item">
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">Google</p>
                                        <b>백엔드, DBA</b><br>
                                        <b>경력</b><br>
                                        <b>정규직</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">우아한 형제들</p>
                                        <b>백엔드</b><br>
                                        <b>신입</b><br>
                                        <b>프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">Apple</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">쿠팡</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="apply_item">
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">NAVER</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">KAKAO</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">Line</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">토스</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="apply_item">
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">당근마켓</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">Ezen</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">Oracle</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">MicroSoft</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="apply_item">
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">셀트리온</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                                <div class="app">
                                    <div class="app_content">
                                        <p><span>지원한 공고</span></p>
                                        <p class="apply_title">codling</p>
                                        <b>백엔드, 프론트엔드</b><br>
                                        <b>신입, 경력</b><br>
                                        <b>정규직, 계약직, 프리랜서</b><br>
                                        <b>마감일자 : 2022-08-19</b><br>
                                    </div>
                                    <div class="viewInfo">
                                        <a href="job_accountment.jsp">공고보기</a>
                                        <a href="resume_writing.jsp">이력서 보기</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <button class="rightArrow"><img src="img/rightArrow.png"></button>
            </div>
            <div id="btn_bar">
                <button class="apply_bar">
                <button class="apply_bar">
                <button class="apply_bar">
                <button class="apply_bar">
            </div>
        </article>
        <article id="resume">
            <h1>이력서 관리</h1>
            <a href="#"><div class="resumemg">
                <div class="resumemgbox">
                    <p><span>이력서</span></p>
                    <div class="resumemgbox2">이력서가 없습니다. 이력서를 작성해 주세요</div>
                </div>
            </div></a>
            <div class="btn-res">
                <a href="resume_writing.jsp"><button action="" id="btn-res">이력서 작성</button></a>
            </div>
        </article>
        <article id="self">
            <h1>자기소개서 관리</h1>
            <a href="#"><div class="self_box">
                    <div id="self_introduction">
                        <p><span>자기소개서</span></p>
                            <div class="self_introductionbox">자기소개서가 없습니다. 자기소개서를 작성해주세요</div>
                    </div>
                </div>
            </a>
            <div class="chbtn-box">
                <input type="button" name="update" id="update" value="수정" src="">
                <input type="button" name="delete" id="delete" value="삭제" >
            </div>
            <div class="btn-sel">
                <input type="button" id="btn-sel" value="자기소개서 작성"></input>
            </div>
        </article>
        <div id="self_inbox">
            <article>
                <h1>자기소개서</h1>
                <form action="" name="selfFrm" method="post">
                    <div id="self_introduction_box">
                        <div id="self_box">
                            <div id="self_title">
                                <input type="text" name="selftitle" id="input_title" placeholder="제목을 입력해 주세요.">
                            </div>
                            <div id="contents_box">
                                <textarea type="text" name="selfcontent" id="input_contents" placeholder="내용을 입력해 주세요."></textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </article>
            <div class="btn-self">
                <button action="" form="selfFrm" id="btn-self" onclick="self_check()">등록</button>
                <button action="" id="btn-self-back" onclick="hidden()">취소</button>
            </div>
        </div>
    </section>
    <footer>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>       