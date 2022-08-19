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
                    <div class="jobOpeningbox2">${jobOpening.title}</div>
                </div>
                <div class="content1">
                    <dl>
                        <dt>모집분야</dt>
                            <dd>
								<c:forEach var="field" items="${fields}" varStatus="st">
									<c:if test="${!st.last}">
										${field.name} / 
									</c:if>
									<c:if test="${st.last}">
										${field.name}
									</c:if>
								</c:forEach>
							</dd>
                        <dt>경력여부</dt>
                            <dd>
								<c:forEach var="field" items="${fields}" varStatus="st">
									<c:if test="${fn:length(fields) == 1}">
										<c:if test="${fn:length(field.career) <= 3 && field.career == '신입'}">
											${field.career}
										</c:if>
										<c:if test="${fn:length(field.career) <= 3 && field.career != '신입'}">
											${field.career}년↑
										</c:if>
										<c:if test="${fn:length(field.career) > 3}">
											<c:forTokens var="f" items="${field.career}" delims="/">
												<c:if test="${f == '신입'}">
													${f} or 
												</c:if>
												<c:if test="${f != '신입'}">
													${f}년↑
												</c:if>
											</c:forTokens>
										</c:if>
									</c:if>
									
									<c:if test="${fn:length(fields) > 1 && !st.last}">
										<c:if test="${fn:length(field.career) <= 3 && field.career == '신입'}">
											${field.career} / 
										</c:if>
										<c:if test="${fn:length(field.career) <= 3 && field.career != '신입'}">
											${field.career}년↑ / 
										</c:if>
										<c:if test="${fn:length(field.career) > 3}">
											<c:forTokens var="f" items="${field.career}" delims="/">
												<c:if test="${f == '신입'}">
													${f} or 
												</c:if>
												<c:if test="${f != '신입'}">
													${f}년↑ / 
												</c:if>
											</c:forTokens>
										</c:if>
									</c:if>
									<c:if test="${fn:length(fields) > 1 && st.last}">
										<c:if test="${fn:length(field.career) <= 3 && field.career == '신입'}">
											${field.career}
										</c:if>
										<c:if test="${fn:length(field.career) <= 3 && field.career != '신입'}">
											${field.career}년↑
										</c:if>
										<c:if test="${fn:length(field.career) > 3}">
											<c:forTokens var="f" items="${field.career}" delims="/">
												<c:if test="${f == '신입'}">
													${f} or 
												</c:if>
												<c:if test="${f != '신입'}">
													${f}년↑
												</c:if>
											</c:forTokens>
										</c:if>
									</c:if>
								</c:forEach>
							</dd>
                        <dt>스택</dt>
                            <dd>
								<c:forEach var="field" items="${fields}" varStatus="fieldSt">
									<c:if test="${fn:length(fields) == 1}">
										<c:forTokens var="stack" items="${field.stack}" delims="/" varStatus="st">
											<c:if test="${!st.last}">
												${stack} · 
											</c:if>
											<c:if test="${st.last}">
												${stack}
											</c:if>
										</c:forTokens>
									</c:if>
									
									<c:if test="${fn:length(fields) > 1 && !fieldSt.last}">
										<c:forTokens var="stack" items="${field.stack}" delims="/" varStatus="st">
											<c:if test="${!st.last}">
												${stack} · 
											</c:if>
											<c:if test="${st.last}">
												${stack} / 
											</c:if>
										</c:forTokens>
									</c:if>
									<c:if test="${fn:length(fields) > 1 && fieldSt.last}">
										<c:forTokens var="stack" items="${field.stack}" delims="/" varStatus="st">
											<c:if test="${!st.last}">
												${stack} · 
											</c:if>
											<c:if test="${st.last}">
												${stack}
											</c:if>
										</c:forTokens>
									</c:if>
								</c:forEach>
							</dd>
                        <dt>근무지 주소</dt>
                            <dd> ${jobOpening.region}</dd>
                        <dt>모집일자</dt>
                        	<dd> ${jobOpening.startDate} ~ ${jobOpening.endDate}</dd>
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
                            <dt>지원분야</dt>
                                <dd>백엔드</dd>
                            <dt>경력사항</dt>
                                <dd>신입</dd>
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