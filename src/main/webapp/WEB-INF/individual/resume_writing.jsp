<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서작성페이지통합</title>
    <link rel="stylesheet" href="css/resume_writing.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/resume_writing.js"></script>
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
    	<form action="resume_writing" name="resumeForm" method="post" enctype="multipart/form-data">
		    <!--이력서제목-->
	        <h2>이력서 제목</h2>
	        <div>
	        	<input name="title" class="title" placeholder=" 이력서 제목을 입력하세요.">
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
	                        <td colspan="2">
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
	                        	<input name="score" class="score" value="0" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '')"/>
	                            / 4.5
	                     	</td>
	                    </tr>
	                </table> 
	            </div>
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
	            <div id="stacks"></div>
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
	            <div class="contentWrap"> 
	                <table>
	                	<tr>
		                	<th>프로젝트명</th>
		                	<td>
		                    	<input name="portfolioName" placeholder=" 프로젝트명">
		                    </td>
		                </tr>
		                <tr>
		                    <th>URL 주소</th>
		                    <td>
			                    <input type="hidden" name="urlCount" value="1">
			                    <input name="url" placeholder=" github.com/SeoSuHong/codling">
			                    <input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
		                    </td>
		                </tr>
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
			                <tr>
			                    <th>URL 주소</th>
			                    <td>
				                    <input type="hidden" name="urlCount" value="1">
				                    <input name="url" placeholder=" github.com/SeoSuHong/codling">
				                    <input type="button" class="addUrlBtn" value="추가" onclick="addUrl(this)">
			                    </td>
			                </tr>
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
	    
		    <!--완료버튼-->
		    <div id="submitWrap">
		    	<input type="button" id="submitBtn" value="완 료" onclick="resumeChk()">
		    </div>
		</form>
    </section>
</body>
</html>