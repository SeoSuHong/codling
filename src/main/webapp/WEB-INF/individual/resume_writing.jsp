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
    	<form action="">
		    <!--이력서제목-->
	        <h2>이력서 제목</h2>
	        <div>
	        	<input name="title" placeholder=" 이력서 제목을 입력하세요.">
	        </div>
	        
		    <!--학력사항-->
	        <div>
	        	<div>
	        		<h2>학력사항</h2>
	        		<input type="button" value="추가" onclick="addForm();">
	        	</div>
	            <div>
	                <table>                 
	                     <tr>
	                         <th>학력 * </th>
	                         <td>
	                            <select required>
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
	                        	<input placeholder=" 학교명을 입력하세요.">
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>재학기간 * </th>
	                        <td>
	                        	<input type="date"> ~ <input type="date">
	                            <select>
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
	                        	<input placeholder=" 전공을 입력하세요.">
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>학점</th>
	                        <td>
	                        	<input type="text" name="grade" id="insertgrade" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
	                            / <input type="text" name="grade" class="infoForm2" placeholder=" 4.5" readonly>
	                     	</td>
	                    </tr>
	                </table> 
	            </div> 
	        </div>
	        <div id="edu_level_info" class="list_file_tag"> 
	            <div id="eduLevelbox">
	                <table class="edu_level_info">                 
	                     <button type="button" class="edu_del" onclick="delForm(this);">삭제</button>
	                     <tr>
	                         <th>학력 * </th>
	                         <td>
	                            <select class="edu_select" required>
		                            <option value="" disabled selected>선택</option>
		                            <option value="고등학교">고등학교</option>
		                            <option value="대학교(2년)">대학교(2년)</option>
		                            <option value="대학교(4년)">대학교(4년)(2년)</option>
		                            <option value="대학원(석사)">대학원(석사)</option>
		                            <option value="대학원(박사)">대학원(박사)</option>
	                            </select>
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>학교명 * </th>
	                        <td>
	                        	<input name="uni_name" id="uni_name" class="infoForm2" placeholder="학교명을 입력하세요">
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>재학기간 * </th>
	                        <td>
	                        	<input type="date" name="start" id="start"><span class="qqqtext"> ~ </span><input type="date" name="end" class="infoForm2">
	                            <select class="edu_select2" required>
	                                <option value="" disabled selected>선택</option>
	                                <option value="고졸">졸업</option>
	                                <option value="초대졸">졸업예정</option>
	                                <option value="대졸">재학</option>
	                                <option value="석사">휴학</option>
	                            </select>
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>학과명 * </th>
	                        <td>
	                        	<input name="major" id="major" class="infoForm2" placeholder="전공을 입력하세요">
	                        </td>
	                     </tr>
	                     <tr>
	                        <th>학점</th>
	                        <td>
	                        	<input type="text" name="grade" id="insertgrade" placeholder="본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
	                            / <input type="text" name="grade" class="infoForm2" value="4.5" readonly>
	                     	</td>
	                    </tr>
	                </table> 
	            </div> 
	        </div>
	        
	    	<!--보유기술스택-->
	        <h2>보유기술스택</h2>
	        <div id="stack_box">
	            <h3>기술스택</h3>
	            <input type="text" name="stack" class="stackinput" placeholder="C, C++, JAVA, HTML, CSS">
	        </div>
	        
	    	<!--경력사항-->
	        <div>
	            <h2>경력사항<input type="button" class="ex_add" value="추가" onclick="addForm2();"></h2>
	            <div id="experiencebox"> 
	                <table id= "ex_info_box">
	                    <tr>
	                        <th>회사명</th>
	                        <td>
	                        	<input name="company_name" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>재직기간</th>
	                        <td>
	                        	<input type="date" name="company_enter" class="infoForm4"> ~ <input type="date" name="retire" class="infoForm4">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>직급/직책</th>
	                        <td>
	                        	<input name="position" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>근무부서</th>
	                        <td>
	                        	<input name="department" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>주요업무</th>
	                        <td>
	                        	<textarea placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea>
	                        </td>
	                    </tr>
	                </table> 
	        	</div>
	        </div>
	        <div id="experienced_info" class="list_file_tag"> 
	            <div id="experiencebox"> 
	                <table id= "ex_info_box">         
	                    <button type="button" class="ex_del" onclick="delForm2(this);">삭제</button>
	                    <tr>
	                        <th>회사명</th>
	                        <td>
	                        	<input name="company_name" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>재직기간</th>
							<td>
								<input type="date" name="company_enter" class="infoForm4"> ~ <input type="date" name="retire" class="infoForm4">
							</td>
	                    </tr>
	                    <tr>
	                        <th>직급/직책</th>
	                        <td>
	                        	<input name="position" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>근무부서</th>
	                        <td>
	                        	<input name="department" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>주요 업무</th>
	                        <td>
	                        	<textarea placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea>
	                        </td>
	                    </tr>
	                </table> 
	            </div> 
	        </div>
	        
	    	<!--자격증-->
	        <div name="problem_list3" id="problem_list3">
	            <h2>자격증 내역<input type="button" class="license_add" value="추가" onclick="addForm3();"></h2>
	            <div id="licensebox"> 
	                <table>
	                    <tr>
	                        <th>자격증명</th>
	                        <td>
	                        	<input name="license_name" class="infoForm3" placeholder="자격증명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>발행처/기관</th>
	                        <td>
	                        	<input name="organ_name" class="infoForm3" placeholder="발행기관명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>합격구분</th>
	                        <td>
	                        	<select class="license_select">
	                                <option value="" disabled selected>선택</option>
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
	                        	<input type="date" name="pass_date" id="passday" class="infoForm3">
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	        <div id="license_info" class="list_file_tag"> 
	            <div id="licensebox"> 
	                <table>
	                    <button type="button" class="license_del" onclick="delForm3(this);">삭제</button>
	                    <tr>
	                        <th>자격증명</th>
	                        <td>
	                        	<input name="license_name" class="infoForm3" placeholder="자격증명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>발행처/기관</th>
	                        <td>
	                        	<input name="organ_name" class="infoForm3" placeholder="발행기관명을 입력하세요">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>합격구분</th>
	                        <td>
	                        	<select class="license_select">
	                                <option value="" disabled selected>선택</option>
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
	                        	<input type="date" name="pass_date" id="passday" class="infoForm3">
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	        
	    	<!--포트폴리오-->
	        <div id="problem_list4">
	            <h2>포트폴리오<input type="button" class="portfolio_add" value="추가" onclick="addForm4();"></h2>
	            <div id="portfoliobox"> 
	                <table>
	                	<tr>
		                	<th>프로젝트명</th>
		                	<td>
		                    	<input type="text" class="portfolio_title" placeholder="프로젝트명">
		                    </td>
		                </tr>
		                <tr>
		                    <th>URL 주소</th>
		                    <td>
			                    <input type="text" class="url" placeholder="https://github.com/codling">
		                    	<input type="button" value="URL추가">
		                    </td>
		                </tr>
		                <tr>
		                    <th>첨부파일</th>
		                    <td>
		                    	<button type="button" class="filebtn">첨부파일</button>
		                    </td>
		                </tr>
	                </table>
	            </div>
	        </div>
	        <div id="portfolio_info" class="list_file_tag"> 
	            <div id="portfoliobox"> 
	                <table>
	                	<tr>
		                	<th>프로젝트명</th>
		                	<td>
		                    	<input type="text" class="portfolio_title" placeholder="프로젝트명">
		                    </td>
		                </tr>
		                <tr>
		                    <th>URL 주소</th>
		                    <td>
			                    <input type="text" class="url" placeholder="https://github.com/codling">
		                    	<input type="button" value="URL추가">
		                    </td>
		                </tr>
		                <tr>
		                    <th>첨부파일</th>
		                    <td>
		                    	<button type="button" class="filebtn">첨부파일</button>
		                    </td>
		                </tr>
	                </table>
	            </div>
	        </div>
	    
		    <!--완료버튼-->
		    <input type="submit" value="완료" class="resume_submit">
		</form>
    </section>
</body>
</html>