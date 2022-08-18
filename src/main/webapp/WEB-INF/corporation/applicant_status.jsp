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
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/applicant_status.js"></script>
    <link rel="stylesheet" href="css/applicant_status.css">
</head>
<body>
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
                    <li id="mypage"><a href="corporationInfo"><span>내 정보</span></a></li>
                    <li id="resume"><a href="jobOpening_management"><span>공고 관리</span></a></li>
                    <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
                </ul>
            </div>
    </header>
    <section>
        <article id="jobOpening1">
            <h3>공고 현황</h3>
            <div class="jobOpeningmg1">
                <div class="jobbox2">
                <div class="jobOpeningbox1">
                    <p><span>내가올린공고</span></p>
                    <div class="jobOpeningbox2">공고제목</div>
                </div>
                <div class="content1">
                    <dl>
                        <dt>모집분야</dt>
                            <dd>백엔드 / 프론트엔드</dd>
                        <dt>경력여부</dt>
                            <dd>신입 / 5년↑</dd>
                        <dt>스택</dt>
                            <dd>Java · JSP · MySQL · IntelliJ IDEA</dd>
                        <dt>근무지 주소</dt>
                            <dd>인천광역시 남동구 인주대로 593 엔타스 12층</dd>
                        <dt>모집일자</dt>
                        	<dd>2022-08-20 ~ 2022-09-20</dd>
                    </dl>
                </div>
            	</div>
            </div>
        </article>

        <article id="jobOpening2">
            <h3>지원자 현황</h3>
            <div class="jobOpeningmg2">
                <div class="jobbox">
                    <div class="jobOpeningbox3">
                        <p><span>대기중인 이력서</span></p>
                        <div class="jobOpeningbox4">이력서 제목</div>
                    </div>
                    <div class="content2">
                        <dl>
                            <dt>이름</dt>
                                <dd>김태희</dd>
                            <dt>경력사항</dt>
                                <dd>신입</dd>
                            <dt>지원분야</dt>
                                <dd>백엔드</dd>
                            <dt>이메일</dt>
                                <dd>qwerasd@naver.com</dd>
                            <dt>휴대폰</dt>
                                <dd>010-1234-1234</dd>
                            <dt>최종학력</dt>
                                <dd>서울대학교 컴퓨터공학부 (졸업, 재학, 휴학, 중퇴, 졸업예정)</dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="jobOpeningmg2">
                <div class="jobbox">
                    <div class="jobOpeningbox3">
                        <p><span>대기중인 이력서</span></p>
                        <div class="jobOpeningbox4">이력서 제목</div>
                    </div>
                    <div class="content2">
                        <dl>
                            <dt>이름</dt>
                                <dd>김태희</dd>
                            <dt>경력사항</dt>
                                <dd>신입</dd>
                            <dt>지원분야</dt>
                                <dd>백엔드</dd>
                            <dt>이메일</dt>
                                <dd>qwerasd@naver.com</dd>
                            <dt>휴대폰</dt>
                                <dd>010-1234-1234</dd>
                            <dt>최종학력</dt>
                                <dd>서울대학교 컴퓨터공학부 (졸업, 재학, 휴학, 중퇴, 졸업예정)</dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="jobOpeningmg2">
                <div class="jobbox">
                    <div class="jobOpeningbox3">
                        <p><span>대기중인 이력서</span></p>
                        <div class="jobOpeningbox4">이력서 제목</div>
                    </div>
                    <div class="content2">
                        <dl>
                            <dt>이름</dt>
                                <dd>김태희</dd>
                            <dt>경력사항</dt>
                                <dd>신입</dd>
                            <dt>지원분야</dt>
                                <dd>백엔드</dd>
                            <dt>이메일</dt>
                                <dd>qwerasd@naver.com</dd>
                            <dt>휴대폰</dt>
                                <dd>010-1234-1234</dd>
                            <dt>최종학력</dt>
                                <dd>서울대학교 컴퓨터공학부 (졸업, 재학, 휴학, 중퇴, 졸업예정)</dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="jobOpeningmg3">
                <div class="jobbox">
                    <div class="jobOpeningbox3">
                        <p><span>수락한 이력서</span></p>
                        <div class="jobOpeningbox4">이력서 제목</div>
                    </div>
                    <div class="content2">
                        <dl>
                            <dt>이름</dt>
                                <dd>김태희</dd>
                            <dt>경력사항</dt>
                                <dd>신입</dd>
                            <dt>지원분야</dt>
                                <dd>백엔드</dd>
                            <dt>이메일</dt>
                                <dd>qwerasd@naver.com</dd>
                            <dt>휴대폰</dt>
                                <dd>010-1234-1234</dd>
                            <dt>최종학력</dt>
                                <dd>서울대학교 컴퓨터공학부 (졸업, 재학, 휴학, 중퇴, 졸업예정)</dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="jobOpeningmg4">
                <div class="jobbox">
                    <div class="jobOpeningbox5">
                        <p><span>거절한 이력서</span></p>
                        <div class="jobOpeningbox6">이력서 제목</div>
                    </div>
                    <div class="content3">
                        <dl>
                            <dt>이름</dt>
                                <dd>김태희</dd>
                            <dt>경력사항</dt>
                                <dd>신입</dd>
                            <dt>지원분야</dt>
                                <dd>백엔드</dd>
                            <dt>이메일</dt>
                                <dd>qwerasd@naver.com</dd>
                            <dt>휴대폰</dt>
                                <dd>010-1234-1234</dd>
                            <dt>최종학력</dt>
                                <dd>서울대학교 컴퓨터공학부 (졸업, 재학, 휴학, 중퇴, 졸업예정)</dd>
                        </dl>
                    </div>
                </div>
            </div>
        </article>
       
        
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>