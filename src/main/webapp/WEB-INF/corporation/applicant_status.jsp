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
            <div class="jobOpeningmg1" onclick="location.href = 'job_accountment?no=${jobOpening.no}'">
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
									${field.name}<c:if test="${!st.last}"> / </c:if>
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
									
									<c:if test="${fn:length(fields) > 1}">
										<c:if test="${fn:length(field.career) <= 3 && field.career == '신입'}">
											${field.career}<c:if test="${!st.last}"> / </c:if>
										</c:if>
										<c:if test="${fn:length(field.career) <= 3 && field.career != '신입'}">
											${field.career}년↑<c:if test="${!st.last}"> / </c:if>
										</c:if>
										<c:if test="${fn:length(field.career) > 3}">
											<c:forTokens var="f" items="${field.career}" delims="/">
												<c:if test="${f == '신입'}">
													${f} or 
												</c:if>
												<c:if test="${f != '신입'}">
													${f}년↑<c:if test="${!st.last}"> / </c:if>
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
                            <dd> ${jobOpening.region} ${jobOpening.detailRegion}</dd>
                        <dt>모집일자</dt>
                        	<dd> ${jobOpening.startDate} ~ ${jobOpening.endDate}</dd>
                    </dl>
                </div>
            	</div>
            </div>
        </article>

		<article id="jobOpening2">
			<h3>지원자 현황</h3>
			<div id="resumeMenu">
				<button class="resumeMenu" onclick="showResume(this)">전체 이력서</button>
				<button class="resumeMenu" onclick="showResume(this)">대기중인 이력서</button>
				<button class="resumeMenu" onclick="showResume(this)">수락한 이력서</button>
				<button class="resumeMenu" onclick="showResume(this)">거절한 이력서</button>
			</div>
			
			<!-- 대기중인 이력서 -->
			<c:forEach var="applicant" items="${applicants}">			
				<c:if test="${applicant.status == '미열람' || applicant.status == '열람'}">
					<div class="resumeWrap wait">
						<p class="waitResume">대기중인 이력서</p>
						<p class="resumeTitle">${applicant.resumeTitle}</p>
						<dl>
							<dt>이름</dt>
							<dd>${applicant.name}</dd>
						</dl>
						<dl>
							<dt>지원분야</dt>
							<dd>${applicant.fieldName}</dd>
						</dl>
						<dl>					
							<dt>경력사항</dt>
							<dd>${applicant.career}</dd>
						</dl>
						<dl>
							<dt>사용스택</dt>
							<dd>
								<c:forTokens var="stack" items="${applicant.stack}" delims="/" varStatus="st">
									${stack}<c:if test="${!st.last}"> · </c:if>
								</c:forTokens>
							</dd>
						</dl>
						<dl>
							<dt>최종학력</dt>
							<dd>${applicant.education}</dd>
						</dl>
						<dl>
							<dt>이메일</dt>
							<dd>${applicant.email}</dd>
						</dl>
						<dl>
							<dt>휴대폰</dt>
							<dd>${fn:substring(applicant.phone, 0, 3)}-${fn:substring(applicant.phone, 3, 7)}-${fn:substring(applicant.phone, 7, 11)}</dd>
						</dl>
						<button class="resumeBtn" onclick="location.href = 'resume_preview?id=${applicant.id}&coverLetter_no=${applicant.coverLetter_no}&no=${applicant.no}&status=${applicant.status}'">이력서 열람</button>
					</div>
				</c:if>
			</c:forEach>
			
			<!-- 수락한 이력서 -->
			<c:forEach var="applicant" items="${applicants}">	
				<c:if test="${applicant.status == '수락'}">
					<div class="resumeWrap accept">
						<p class="acceptResume">수락한 이력서</p>
						<p class="resumeTitle">${applicant.resumeTitle}</p>
						<dl>
							<dt>이름</dt>
							<dd>${applicant.name}</dd>
						</dl>
						<dl>
							<dt>지원분야</dt>
							<dd>${applicant.fieldName}</dd>
						</dl>
						<dl>					
							<dt>경력사항</dt>
							<dd>${applicant.career}</dd>
						</dl>
						<dl>
							<dt>사용스택</dt>
							<dd>
								<c:forTokens var="stack" items="${applicant.stack}" delims="/" varStatus="st">
									${stack}<c:if test="${!st.last}"> · </c:if>
								</c:forTokens>
							</dd>
						</dl>
						<dl>
							<dt>최종학력</dt>
							<dd>${applicant.education}</dd>
						</dl>
						<dl>
							<dt>이메일</dt>
							<dd>${applicant.email}</dd>
						</dl>
						<dl>
							<dt>휴대폰</dt>
							<dd>${fn:substring(applicant.phone, 0, 3)}-${fn:substring(applicant.phone, 3, 7)}-${fn:substring(applicant.phone, 7, 11)}</dd>
						</dl>
						<button class="resumeBtn" onclick="location.href = 'resume_preview?id=${applicant.id}&coverLetter_no=${applicant.coverLetter_no}&no=${applicant.no}&status=${applicant.status}'">이력서 열람</button>
					</div>
				</c:if>
			</c:forEach>
			
			<!-- 거절한 이력서 -->
			<c:forEach var="applicant" items="${applicants}">	
				<c:if test="${applicant.status == '거절'}">
					<div class="resumeWrap refuse">
						<p class="refuseResume">거절한 이력서</p>
						<p class="resumeTitle">${applicant.resumeTitle}</p>
						<dl>
							<dt>이름</dt>
							<dd>${applicant.name}</dd>
						</dl>
						<dl>
							<dt>지원분야</dt>
							<dd>${applicant.fieldName}</dd>
						</dl>
						<dl>					
							<dt>경력사항</dt>
							<dd>${applicant.career}</dd>
						</dl>
						<dl>
							<dt>사용스택</dt>
							<dd>
								<c:forTokens var="stack" items="${applicant.stack}" delims="/" varStatus="st">
									${stack}<c:if test="${!st.last}"> · </c:if>
								</c:forTokens>
							</dd>
						</dl>
						<dl>
							<dt>최종학력</dt>
							<dd>${applicant.education}</dd>
						</dl>
						<dl>
							<dt>이메일</dt>
							<dd>${applicant.email}</dd>
						</dl>
						<dl>
							<dt>휴대폰</dt>
							<dd>${fn:substring(applicant.phone, 0, 3)}-${fn:substring(applicant.phone, 3, 7)}-${fn:substring(applicant.phone, 7, 11)}</dd>
						</dl>
						<button class="resumeBtn" onclick="location.href = 'resume_preview?id=${applicant.id}&coverLetter_no=${applicant.coverLetter_no}&no=${applicant.no}&status=${applicant.status}'">이력서 열람</button>
					</div>
				</c:if>
			</c:forEach>
			
        </article>
    </section>
    <footer>
    	<a href="#up"><img src="img/footerLogo.png"></a>
    	<a href="#">전체서비스</a>&ensp;|&ensp; 
      	<a href="#">이용약관</a>&ensp;|&ensp; 
      	<a href="#">개인정보처리방침</a>&ensp;|&ensp;
      	<a href="#">제휴문의</a>&ensp;| © CODLING Corp.
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>