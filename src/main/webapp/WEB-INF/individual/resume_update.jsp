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
    <title>이력서작성페이지통합</title>
    <link rel="stylesheet" href="css/resume_update.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/resume_update.js"></script>
</head>
<body>
    <!--header-->
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
                <li id="mypage"><a href="individualInfo"><span>내 정보</span></a></li>
                <li id="resume"><a href="resume_management"><span>이력서 관리</span></a></li>
                <li id="logout"><a href="logout"><span>로그아웃</span></a></li>
            </ul>
        </div>
    </header>
    <section>
    	<form action="resume_update" name="resumeForm" method="post" enctype="multipart/form-data">
		    <!--이력서제목-->
	        <h2>이력서 제목</h2>
	        <div>
	        	<input value="${individual.resumeTitle}" name="title" class="title" placeholder=" 이력서 제목을 입력하세요.">
	        </div>
	        
		    <!--학력사항-->
        	<div class="contentTitleWrap">
        		<h2>학력사항</h2>
        		<input type="button" id="addEducation" class="addBtn" value="추가">
        	</div>
        	<div id="education">
	            <div class="contentWrap">
	                <table>
	                     <tr>
                         	<th>학력 * </th>
                         	<td>
	                            <select name="school" onchange="schoolSelect(this, this.value)">
		                            <option value="">선택</option>
		                            <option value="고등학교" <c:if test="${educations[0].school == '고등학교'}">selected</c:if> >고등학교</option>
		                            <option value="대학교(2년)" <c:if test="${educations[0].school == '대학교(2년)'}">selected</c:if> >대학교(2년)</option>
		                            <option value="대학교(4년)" <c:if test="${educations[0].school == '대학교(4년)'}">selected</c:if> >대학교(4년)</option>
		                            <option value="대학원(석사)" <c:if test="${educations[0].school == '대학원(석사)'}">selected</c:if> >대학원(석사)</option>
		                            <option value="대학원(박사)" <c:if test="${educations[0].school == '대학원(박사)'}">selected</c:if> >대학원(박사)</option>
	                            </select>
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>학교명 * </th>
	                        <td>
	                        	<input name="schoolName" value="${educations[0].schoolName}" placeholder=" 학교명을 입력하세요.">
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>재학기간 * </th>
	                        <td colspan="2">
	                        	<input type="month" value="${fn:substring(educations[0].schoolStartDate, 0, 7)}" name="schoolStartDate" class="edu_date"> ~ <input type="month" value="${fn:substring(educations[0].schoolEndDate, 0, 7)}" name="schoolEndDate" class="edu_date">
	                            <select name="status">
	                                <option value="">선택</option>
	                                <option value="졸업" <c:if test="${educations[0].status == '졸업'}">selected</c:if> >졸업</option>
	                                <option value="졸업예정" <c:if test="${educations[0].status == '졸업예정'}">selected</c:if> >졸업예정</option>
	                                <option value="재학중" <c:if test="${educations[0].status == '재학중'}">selected</c:if> >재학중</option>
	                                <option value="휴학중" <c:if test="${educations[0].status == '휴학중'}">selected</c:if> >휴학중</option>
	                            </select>
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>학과명 * </th>
	                       	<td>
	                        	<input name="department" value="${educations[0].department}" placeholder=" 전공을 입력하세요.">
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>학점</th>
	                        <td>
	                        	<input name="score" class="score" value="${educations[0].score}" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '')"/>
	                            / 4.5
	                     	</td>
	                    </tr>
	                </table> 
	            </div>

	        
		        <c:if test="${fn:length(educations) > 1}">
		        	<c:forEach var="education" items="${educations}" begin="1">
				        <div class="hideEdu">
				            <div class="addForm">
			                    <input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
				                <table>                 
				                     <tr>
				                         <th>학력 * </th>
				                         <td>
				                            <select name="school" onchange="schoolSelect(this, this.value)">
					                            <option value="">선택</option>
					                            <option value="고등학교" <c:if test="${education.school == '고등학교'}">selected</c:if> >고등학교</option>
					                            <option value="대학교(2년)" <c:if test="${education.school == '대학교(2년)'}">selected</c:if> >대학교(2년)</option>
					                            <option value="대학교(4년)" <c:if test="${education.school == '대학교(4년)'}">selected</c:if> >대학교(4년)</option>
					                            <option value="대학원(석사)" <c:if test="${education.school == '대학원(석사)'}">selected</c:if> >대학원(석사)</option>
					                            <option value="대학원(박사)" <c:if test="${education.school == '대학원(박사)'}">selected</c:if> >대학원(박사)</option>
				                            </select>
				                        </td>
				                     </tr>
				                     <tr>
				                        <th>학교명 * </th>
				                        <td>
				                        	<input name="schoolName" value="${education.schoolName}" placeholder=" 학교명을 입력하세요.">
				                        </td>
				                     </tr>
				                     <tr>
				                        <th>재학기간 * </th>
				                        <td>
				                        	<input type="month" value="${fn:substring(education.schoolStartDate, 0, 7)}" name="schoolStartDate" class="edu_date"> ~ <input type="month" value="${fn:substring(education.schoolEndDate, 0, 7)}" name="schoolEndDate" class="edu_date">
				                            <select name="status">
				                                <option value="">선택</option>
				                                <option value="졸업" <c:if test="${education.status == '졸업'}">selected</c:if> >졸업</option>
				                                <option value="졸업예정" <c:if test="${education.status == '졸업예정'}">selected</c:if> >졸업예정</option>
				                                <option value="재학중" <c:if test="${education.status == '재학중'}">selected</c:if> >재학중</option>
				                                <option value="휴학중" <c:if test="${education.status == '휴학중'}">selected</c:if> >휴학중</option>
				                            </select>
				                        </td>
				                     </tr>
				                     <tr>
				                        <th>학과명 * </th>
				                        <td>
				                        	<input name="department" value="${education.department}" placeholder=" 전공을 입력하세요.">
				                        </td>
				                     </tr>
				                     <tr>
				                        <th>학점</th>
				                        <td>
				                        	<input name="score" value="${education.score}" class="score" value="0" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
				                            / 4.5
				                     	</td>
				                    </tr>
				                </table> 
				            </div> 
				        </div>
					</c:forEach>
				</c:if>
	        </div>
	        			
			<div id="hideEduWrap">
		        <div class="hideEdu">
		            <div class="addForm">
	                    <input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
		                <table>                 
		                     <tr>
		                         <th>학력 * </th>
		                         <td>
		                            <select name="school" onchange="schoolSelect(this, this.value)">
			                            <option value="" selected>선택</option>
			                            <option value="고등학교">고등학교</option>
			                            <option value="대학교(2년)">대학교(2년)</option>
			                            <option value="대학교(4년)">대학교(4년)</option>
			                            <option value="대학원(석사)">대학원(석사)</option>
			                            <option value="대학원(박사)">대학원(박사)</option>
		                            </select>
		                        </td>
		                     </tr>
		                     <tr>
		                        <th>학교명 * </th>
		                        <td>
		                        	<input name="schoolName" placeholder=" 학교명을 입력하세요.">
		                        </td>
		                     </tr>
		                     <tr>
		                        <th>재학기간 * </th>
		                        <td>
		                        	<input type="month" name="schoolStartDate" class="edu_date"> ~ <input type="month" name="schoolEndDate" class="edu_date">
		                            <select name="status">
		                                <option value="" selected>선택</option>
		                                <option value="졸업">졸업</option>
		                                <option value="졸업예정">졸업예정</option>
		                                <option value="재학중">재학중</option>
		                                <option value="휴학중">휴학중</option>
		                            </select>
		                        </td>
		                     </tr>
		                     <tr>
		                        <th>학과명 * </th>
		                        <td>
		                        	<input name="department" placeholder=" 전공을 입력하세요.">
		                        </td>
		                     </tr>
		                     <tr>
		                        <th>학점</th>
		                        <td>
		                        	<input name="score" class="score" value="0" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
		                            / 4.5
		                     	</td>
		                    </tr>
		                </table> 
		            </div> 
		        </div>
		    </div>
	        
	    	<!--보유기술스택-->
	        <h2>보유 기술스택</h2>
	        <div id="stackWrap" class="contentWrap">
	            <h3 id="stackTitle">기술스택</h3>
	            <div id="stacks">
	            	<c:forTokens var="stack" items="${individual.stack}" delims="/">
	            		<span class="st"><div name="stackList" class="stack">${stack}</div><span onclick="parentElement.remove(this)" style="cursor:pointer"> X </span></span>
	            	</c:forTokens>
	            </div>
	            <input id="stack" name="keyword" onkeydown="keyDown()" placeholder=" 보유 기술 스택을 입력하세요.">
	            <ul id="suggest" style="display: none; position: relative;"></ul>
	            <input type="hidden" name="stacks">
	        </div>
	        
	    	<!--경력사항-->
        	<div class="contentTitleWrap">
            	<h2>경력사항</h2>
            	<input type="button" id="addCareer" class="addBtn" value="추가">
            </div>
            <div id="career">
		        <c:if test="${not empty careers}">
		            <div class="contentWrap"> 
		                <table>
		                    <tr>
		                        <th>회사명</th>
		                        <td>
		                        	<input name="prev_company" value="${careers[0].prev_company}" placeholder=" 회사명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>재직기간</th>
		                        <td>
		                        	<input type="month" value="${fn:substring(careers[0].tenureStartDate, 0, 7)}" name="tenureStartDate" class="career_date"> ~ <input type="month" value="${fn:substring(careers[0].tenureEndDate, 0, 7)}" name="tenureEndDate" class="career_date">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>직급/직책</th>
		                        <td>
		                        	<input name="position" value="${careers[0].position}" placeholder=" 직책명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>근무부서</th>
		                        <td>
		                        	<input name="career_department" value="${careers[0].department}" placeholder=" 근무했던 부서명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>주요업무</th>
		                        <td>
		                        	<textarea name="work_content" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요.">${careers[0].work_content}</textarea>
		                        </td>
		                    </tr>
		                </table> 
		        	</div>
			    </c:if>

		    
			    <c:if test="${empty careers}">
		            <div class="contentWrap"> 
		                <table>
		                    <tr>
		                        <th>회사명</th>
		                        <td>
		                        	<input name="prev_company" placeholder=" 회사명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>재직기간</th>
		                        <td>
		                        	<input type="month" name="tenureStartDate" class="career_date"> ~ <input type="month" name="tenureEndDate" class="career_date">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>직급/직책</th>
		                        <td>
		                        	<input name="position" placeholder=" 직책명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>근무부서</th>
		                        <td>
		                        	<input name="career_department" placeholder=" 근무했던 부서명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>주요업무</th>
		                        <td>
		                        	<textarea name="work_content" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요."></textarea>
		                        </td>
		                    </tr>
		                </table> 
		        	</div>
			    </c:if>

		    
			    <c:if test="${fn:length(careers) > 1}">
			    	<c:forEach var="career" items="${careers}" begin="1">
				        <div class="hideCar">
				            <div class="addForm">
				                <input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
				                <table id= "ex_info_box">
				                    <tr>
				                        <th>회사명</th>
				                        <td>
				                        	<input name="prev_company" value="${career.prev_company}" placeholder=" 회사명을 입력하세요.">
				                        </td>
				                    </tr>
				                    <tr>
				                        <th>재직기간</th>
										<td>
											<input type="month" value="${fn:substring(career.tenureStartDate, 0, 7)}" name="tenureStartDate" class="career_date"> ~ <input type="month" value="${fn:substring(career.tenureEndDate, 0, 7)}" name="tenureEndDate" class="career_date">
										</td>
				                    </tr>
				                    <tr>
				                        <th>직급/직책</th>
				                        <td>
				                        	<input name="position" value="${career.position}" placeholder=" 근무했던 직책명을 입력하세요.">
				                        </td>
				                    </tr>
				                    <tr>
				                        <th>근무부서</th>
				                        <td>
				                        	<input name="career_department" value="${career.department}" placeholder=" 근무했던 부서명을 입력하세요.">
				                        </td>
				                    </tr>
				                    <tr>
				                        <th>주요업무</th>
				                        <td>
				                        	<textarea name="work_content" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요." class="ex_detail">${career.work_content}</textarea>
				                        </td>
				                    </tr>
				                </table> 
				            </div> 
				        </div>
		        	</c:forEach>
		        </c:if>
	        </div>
	        
	        <div id="hideCarWrap">
		        <div class="hideCar">
		            <div class="addForm">
		                <input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
		                <table id= "ex_info_box">
		                    <tr>
		                        <th>회사명</th>
		                        <td>
		                        	<input name="prev_company" placeholder=" 회사명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>재직기간</th>
								<td>
									<input type="month" name="tenureStartDate" class="career_date"> ~ <input type="month" name="tenureEndDate" class="career_date">
								</td>
		                    </tr>
		                    <tr>
		                        <th>직급/직책</th>
		                        <td>
		                        	<input name="position" placeholder=" 근무했던 직책명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>근무부서</th>
		                        <td>
		                        	<input name="career_department" placeholder=" 근무했던 부서명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>주요업무</th>
		                        <td>
		                        	<textarea name="work_content" placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요." class="ex_detail"></textarea>
		                        </td>
		                    </tr>
		                </table> 
		            </div> 
		        </div>
	        </div>

	    	<!--자격증-->
        	<div class="contentTitleWrap">
            	<h2>자격증 내역</h2>
            	<input type="button" id="addLicense" class="addBtn" value="추가">
            </div>
            <div id="license">
		       	<c:if test="${not empty licenses}"> 
		            <div class="contentWrap"> 
		                <table>
		                    <tr>
		                        <th>자격증명</th>
		                        <td>
		                        	<input name="name" value="${licenses[0].name}" placeholder=" 자격증명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>발행처/기관</th>
		                        <td>
		                        	<input name="agency" value="${licenses[0].agency}" placeholder=" 발행기관명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>합격구분</th>
		                        <td>
		                        	<select name="pass">
		                                <option value="">선택</option>
		                                <option value="1차합격" <c:if test="${licenses[0].pass == '1차합격'}">selected</c:if> >1차합격</option>
		                                <option value="2차합격" <c:if test="${licenses[0].pass == '2차합격'}">selected</c:if> >2차합격</option>
		                                <option value="필기합격" <c:if test="${licenses[0].pass == '필기합격'}">selected</c:if> >필기합격</option>
		                                <option value="실기합격" <c:if test="${licenses[0].pass == '실기합격'}">selected</c:if> >실기합격</option>
		                                <option value="최종합격" <c:if test="${licenses[0].pass == '최종합격'}">selected</c:if> >최종합격</option>
		                            </select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>취득일</th>
		                        <td>
		                        	<input type="date" value="${licenses[0].acquireDate}" name="acquireDate" class="infoForm3">
		                        </td>
		                    </tr>
		                </table>
		            </div>
			    </c:if>

	        	<c:if test="${empty licenses}"> 
		            <div class="contentWrap"> 
		                <table>
		                    <tr>
		                        <th>자격증명</th>
		                        <td>
		                        	<input name="name" placeholder=" 자격증명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>발행처/기관</th>
		                        <td>
		                        	<input name="agency" placeholder=" 발행기관명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>합격구분</th>
		                        <td>
		                        	<select name="pass">
		                                <option value="" selected>선택</option>
		                                <option value="1차합격">1차합격</option>
		                                <option value="2차합격">2차합격</option>
		                                <option value="필기합격">필기합격</option>
		                                <option value="실기합격">실기합격</option>
		                                <option value="최종합격">최종합격</option>
		                            </select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>취득일</th>
		                        <td>
		                        	<input type="date" name="acquireDate" class="infoForm3">
		                        </td>
		                    </tr>
		                </table>
		            </div>
			    </c:if>

		        
				<c:if test="${fn:length(licenses) > 1}">
					<c:forEach var="license" items="${licenses}" begin="1">
				        <div class="hideLic"> 
				            <div class="addForm"> 
				                <input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
				                <table>
				                    <tr>
				                        <th>자격증명</th>
				                        <td>
				                        	<input name="name" value="${license.name}" placeholder=" 자격증명을 입력하세요.">
				                        </td>
				                    </tr>
				                    <tr>
				                        <th>발행처/기관</th>
				                        <td>
				                        	<input name="agency" value="${license.agency}" placeholder=" 발행기관명을 입력하세요.">
				                        </td>
				                    </tr>
				                    <tr>
				                        <th>합격구분</th>
				                        <td>
				                        	<select name="pass">
				                                <option value="">선택</option>
				                                <option value="1차합격" <c:if test="${license.pass == '1차합격'}">selected</c:if> >1차합격</option>
				                                <option value="2차합격" <c:if test="${license.pass == '2차합격'}">selected</c:if> >2차합격</option>
				                                <option value="필기합격" <c:if test="${license.pass == '필기합격'}">selected</c:if> >필기합격</option>
				                                <option value="실기합격" <c:if test="${license.pass == '실기합격'}">selected</c:if> >실기합격</option>
				                                <option value="최종합격" <c:if test="${license.pass == '최종합격'}">selected</c:if> >최종합격</option>
				                            </select>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th>취득일</th>
				                        <td>
				                        	<input name="acquireDate" value="${license.acquireDate}" type="date">
				                        </td>
				                    </tr>
				                </table>
				            </div>
				        </div>
		        	</c:forEach>
		       	</c:if>
		    </div>
	       	
	       	<div id="hideLicWrap">
		        <div class="hideLic"> 
		            <div class="addForm"> 
		                <input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
		                <table>
		                    <tr>
		                        <th>자격증명</th>
		                        <td>
		                        	<input name="name" placeholder=" 자격증명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>발행처/기관</th>
		                        <td>
		                        	<input name="agency" placeholder=" 발행기관명을 입력하세요.">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>합격구분</th>
		                        <td>
		                        	<select name="pass">
		                                <option value="" selected>선택</option>
		                                <option value="1차합격">1차합격</option>
		                                <option value="2차합격">2차합격</option>
		                                <option value="필기합격">필기합격</option>
		                                <option value="실기합격">실기합격</option>
		                                <option value="최종합격">최종합격</option>
		                            </select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>취득일</th>
		                        <td>
		                        	<input name="acquireDate" type="date">
		                        </td>
		                    </tr>
		                </table>
		            </div>
		        </div>
	        </div>
	       	
	    	<!--포트폴리오-->
        	<div class="contentTitleWrap">
            	<h2>포트폴리오</h2>
            	<input type="button" id="addPortfolio" class="addBtn" value="추가">
            </div>
            <div id="portfolio">
	            <c:if test="${not empty portfolios}">
		            <div class="contentWrap"> 
		                <table>
		                	<tr>
			                	<th class="nameTh">프로젝트명</th>
			                	<td class="nameTd">
			                    	<input name="portfolioName" value="${portfolios[0].name}" placeholder=" 프로젝트명">
			                    </td>
			                </tr>
		                </table>
	                	<c:if test="${not empty portfolios[0].url}">
			                <table>
			                    <c:forTokens var="url" items="${portfolios[0].url}" delims="|" varStatus="st">
					                <c:if test="${st.first}">
				                		<tr class="urlTr">
						                    <th>URL 주소</th>
						                    <td>
								                <input name="url" value="${url}" placeholder=" github.com/SeoSuHong/codling">
								                <input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
						                    </td>
						                </tr>
							        </c:if>
							        <c:if test="${!st.first}">
							        	<tr class="urlTr">
							        		<td></td>
							            	<td>
							                    <input name='url' value="${url}" placeholder=' github.com/SeoSuHong/codling'>
							                    <input type='button' class='delUrlBtn' value='삭제' onclick='delUrl(this)'>
							                </td>
					                	</tr>
							        </c:if>
							        <c:set var="urlCount" value="${st.count}"/>
					            </c:forTokens>
					        </table>
			                <input type="hidden" name="urlCount" value="${urlCount}">
				        </c:if>
				        <c:if test="${empty portfolios[0].url}">
				        	<table>
				        		<tr class="urlTr">
				                    <th>URL 주소</th>
				                    <td>
						                <input name="url" placeholder=" github.com/SeoSuHong/codling">
						                <input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
				                    </td>
						        </tr>
				        	</table>
					        <input type="hidden" name="urlCount" value="1">
				        </c:if>
			            <table>
				            <tr><td class="emptyWrap"></td></tr>
				            <c:if test="${not empty portfolios[0].fileName}">
				                <c:forTokens var="fileName" items="${portfolios[0].fileName}" delims="/" varStatus="st">
				                	<tr class="projectFile">
				                		<th><c:if test="${st.first}">프로젝트 파일</c:if></th>
				                		<td>
					                		· <a download href="/portfolio_files/${fileName}">${fileName}</a><input type="button" value="삭제" onclick="deleteFile(this)">
					                		<input type="hidden" name="prev_file" value="${fileName}">
					                	</td>
					                </tr>
					                <c:set var="prev_fileCount" value="${st.count}"/>
					            </c:forTokens>
					            <input type="hidden" name="prev_fileCount" value="${prev_fileCount}">
					        </c:if>
					    </table>
					    <table>
			                <tr>
			                    <th><c:if test="${empty portfolios[0].fileName}">첨부파일</c:if><c:if test="${not empty portfolios[0].fileName}">파일추가</c:if></th>
			                    <td>
			                    	<input type="file" name="file" class="fileBtn" multiple>
			                    	<input type="hidden" name="fileCount">
			                    </td>
			                </tr>
			                <tr>
			                	<th>세부사항</th>
			                	<td>
			                		<textarea name="detail" placeholder=" 프로젝트에 대한 설명을 자유롭게 기술하세요.">${portfolios[0].detail}</textarea>
			                	</td>
			                </tr>
		                </table>
		            </div>
			    </c:if>
		    
		    	<c:if test="${empty portfolios}">
		            <div class="contentWrap"> 
		                <table>
		                	<tr>
			                	<th>프로젝트명</th>
			                	<td>
			                    	<input name="portfolioName" placeholder=" 프로젝트명">
			                    </td>
			                </tr>
			            </table>
			            <table>
			                <tr class="urlTr">
			                    <th>URL 주소</th>
			                    <td>
				                    <input name="url" placeholder=" github.com/SeoSuHong/codling">
				                    <input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
			                    </td>
			                </tr>
			            </table>
	                    <input type="hidden" name="urlCount" value="1">
			            <table>
			                <tr>
			                    <th>첨부파일</th>
			                    <td>
			                    	<input type="file" name="file" class="fileBtn" multiple>
			                    	<input type="hidden" name="fileCount">
			                    </td>
			                </tr>
			                <tr>
			                	<th>세부사항</th>
			                	<td>
			                		<textarea name="detail" placeholder=" 프로젝트에 대한 설명을 자유롭게 기술하세요."></textarea>
			                	</td>
			                </tr>
		                </table>
		            </div>
			    </c:if>
		    
			    <c:if test="${fn:length(portfolios) > 1}">
			    	<c:forEach var="portfolio" items="${portfolios}" begin="1">
			    		<div class="hidePort"> 
				            <div class="addForm">
			                	<input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
				                <table>
				                	<tr>
					                	<th>프로젝트명</th>
					                	<td>
					                    	<input name="portfolioName" value="${portfolio.name}" placeholder=" 프로젝트명">
					                    </td>
					                </tr>
					            </table>
					            
					            <c:if test="${not empty portfolio.url}">
						            <table>
				                    	<c:forTokens var="url" items="${portfolio.url}" delims="|" varStatus="st">
						                    <c:if test="${st.first}">
							                	<tr class="urlTr">
							                    	<th>URL 주소</th>
							                    	<td>
								                    	<input name="url" value="${url}" placeholder=" github.com/SeoSuHong/codling">
								                    	<input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
								                    </td>
								                </tr>
								            </c:if>
								           	<c:if test="${!st.first}">
								           		<tr class="urlTr">
								           			<td></td>
								           			<td>
								                    	<input name='url' value="${url}" placeholder=' github.com/SeoSuHong/codling'>
								                    	<input type='button' class='delUrlBtn' value='삭제' onclick='delUrl(this)'>
								                    </td>
								                </tr>
								            </c:if>
								            <c:set var="urlCount" value="${st.count}"/>
						               	</c:forTokens>
						            </table>
						            <input type="hidden" name="urlCount" value="${urlCount}">
						        </c:if>
						        
					            <c:if test="${empty portfolio.url}">
						            <table>
						                <tr class="urlTr">
						                    <th>URL 주소</th>
						                    <td>
							                    <input name="url" placeholder=" github.com/SeoSuHong/codling">
							                    <input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
						                    </td>
						                </tr>
						            </table>
				                    <input type="hidden" name="urlCount" value="1">
					            </c:if>
					            <table>
						            <tr><td class="emptyWrap"></td></tr>
						            <c:if test="${not empty portfolio.fileName}">
						                <c:forTokens var="fileName" items="${portfolio.fileName}" delims="/" varStatus="st">
						                	<tr class="projectFile">
						                		<th><c:if test="${st.first}">프로젝트 파일</c:if></th>
						                		<td>
							                		· <a download href="/portfolio_files/${fileName}">${fileName}</a><input type="button" value="삭제" onclick="deleteFile(this)">
							                		<input type="hidden" name="prev_file" value="${fileName}">
							                	</td>
							                </tr>
							                <c:set var="prev_fileCount" value="${st.count}"/>
							            </c:forTokens>
							            <input type="hidden" name="prev_fileCount" value="${prev_fileCount}">
							        </c:if>
							    </table>
							    <table>
					                <tr>
					                    <th><c:if test="${empty portfolio.fileName}">첨부파일</c:if><c:if test="${not empty portfolios[0].fileName}">파일추가</c:if></th>
					                    <td>
					                    	<input type="file" name="file" class="fileBtn" multiple>
					                    	<input type="hidden" name="fileCount">
					                    </td>
					                </tr>
					                <tr>
					                	<th>세부사항</th>
					                	<td>
					                		<textarea name="detail" placeholder=" 프로젝트에 대한 설명을 자유롭게 기술하세요.">${portfolio.detail}</textarea>
					                	</td>
					                </tr>
				                </table>
				            </div>
			        	</div>
			    	</c:forEach>
			    </c:if>
		    </div>
		    
	        <div id="hidePortWrap">
		        <div class="hidePort"> 
		            <div class="addForm">
	                	<input type="button" class="delBtn" onclick="delForm(this)" value="삭제" >
		                <table>
		                	<tr>
			                	<th>프로젝트명</th>
			                	<td>
			                    	<input name="portfolioName" placeholder=" 프로젝트명">
			                    </td>
			                </tr>
			            </table>
			            <table>
			                <tr class="urlTr">
			                    <th>URL 주소</th>
			                    <td>
				                    <input name="url" placeholder=" github.com/SeoSuHong/codling">
				                    <input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
			                    </td>
			                </tr>
			            </table>
	                    <input type="hidden" name="urlCount" value="1">
			            <table>
			                <tr>
			                    <th>첨부파일</th>
			                    <td>
			                    	<input type="file" name="file" class="fileBtn" multiple>
			                    	<input type="hidden" name="fileCount">
			                    </td>
			                </tr>
			                <tr>
			                	<th>세부사항</th>
			                	<td>
			                		<textarea name="detail" placeholder=" 프로젝트에 대한 설명을 자유롭게 기술하세요."></textarea>
			                	</td>
			                </tr>
		                </table>
		            </div>
		        </div>
	        </div>
	    
		    <!--수정버튼-->
		    <div id="submitWrap">
		    	<input type="button" id="submitBtn" value="수 정" onclick="resumeChk()">
		    </div>
		</form>
    </section>
</body>
</html>