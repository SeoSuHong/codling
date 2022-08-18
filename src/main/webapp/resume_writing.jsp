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
            <a href="index.jsp"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename"> 고객이름</span> &nbsp;&nbsp;</div>
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
    <!--이력서제목-->
    <section>
        <h2><b>이력서 제목</b></h2>
        <div><input name="title" class="resume_title" placeholder="이력서 제목을 입력하세요"></div>
    </section>
    <!--학력사항-->
    <section>
        <div name="problem_list" id="problem_list">
            <h2><input type="button" class="edu_add" value="추가" onclick="addForm();">학력사항</h2>
            <div id="eduLevelbox"> 
                <table class="edu_level_info">                 
                     <br><br>
                     <tr>
                         <td><p>학력 * 
                            <select class="edu_select" required>
                            <option value="" disabled selected>선택</option>
                            <option value="고졸">고졸</option>
                            <option value="초대졸">대학2년 > 초대졸</option>
                            <option value="대졸">대학4년 > 대졸</option>
                            <option value="석사">석사</option>
                            <option value="박사">박사</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학교명 *<input name="uni_name" id="uni_name" class="infoForm2" placeholder=" 학교명을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="qqq2"><span>재학기간 *</span><input type="date" name="start" id="start"><span class="qqqtext"> ~ </span><input type="date" name="end" class="infoForm2">
                            <select class="edu_select2" required>
                                <option value="" disabled selected>선택</option>
                                <option value="고졸">졸업</option>
                                <option value="초대졸">졸업예정</option>
                                <option value="대졸">재학</option>
                                <option value="석사">휴학</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학과명<input name="major" id="major" class="infoForm2" placeholder=" 전공을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="grade"><span>학점</span><input type="text" name="grade" id="insertgrade" placeholder=" 본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
                            <span class="gradetext">/</span><input type="text" name="grade" class="infoForm2" placeholder=" 4.5" readonly></p>
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
                         <td><p>학력 * 
                            <select class="edu_select" required>
                            <option value="" disabled selected>선택</option>
                            <option value="고졸">고졸</option>
                            <option value="초대졸">대학2년 > 초대졸</option>
                            <option value="대졸">대학4년 > 대졸</option>
                            <option value="석사">석사</option>
                            <option value="박사">박사</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학교명 *<input name="uni_name" id="uni_name" class="infoForm2" placeholder="학교명을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="qqq2"><span>재학기간 *</span><input type="date" name="start" id="start"><span class="qqqtext"> ~ </span><input type="date" name="end" class="infoForm2">
                            <select class="edu_select2" required>
                                <option value="" disabled selected>선택</option>
                                <option value="고졸">졸업</option>
                                <option value="초대졸">졸업예정</option>
                                <option value="대졸">재학</option>
                                <option value="석사">휴학</option>
                            </select>
                        </p></td>
                     </tr>
                     <tr>
                        <td><p>학과명<input name="major" id="major" class="infoForm2" placeholder="전공을 입력하세요"></p></td>
                     </tr>
                     <tr>
                        <td><p id="grade"><span>학점</span><input type="text" name="grade" id="insertgrade" placeholder="본인학점" onkeypress="return isNumberKey(event)" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"/>
                            <span class="gradetext">/</span><input type="text" name="grade" class="infoForm2" value="4.5" readonly></p>
                     </td>
                    </tr>
                </table> 
            </div> 
        </div>
    </section>
    <!--보유기술스택-->
    <section>
        <div><h2>보유기술스택</h2></div>
        <article id="stackbox">
        <div id="stack_box">
            <form action="#">
                <h3>기술스택</h3>
                <p><input type="text" name="stack" class="stackinput" placeholder="C, C++, JAVA, HTML, CSS"></p>
            </form>
        </div>
        </article>
    </section>
    <!--경력사항-->
    <section>
        <div name="problem_list2" id="problem_list2">
            <h2>경력사항<input type="button" class="ex_add" value="추가" onclick="addForm2();"></h2>
            <div id="experiencebox"> 
                <table id= "ex_info_box">       
                    <form action="#"><br><br>
                    <tr>
                        <td><p> 회사 명 * <input name="company_name" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요"> </p></td>
                    </tr>
                    <tr>
                        <td><p id="qqq"><span>재직기간 *</span><input type="date" name="company_enter" class="infoForm4">
                            <span class="qqqtext"> ~ </span><input type="date" name="retire" class="infoForm4"></p></td>
                    </tr>
                    <tr>
                        <td> <p>직급/직책 *<input name="position" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p>근무 부서 <input name="department" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p>주요업무<textarea placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea></p></td>
                    </tr>
                    </form>
                </table> 
        	</div>
        </div>
        <div id="experienced_info" class="list_file_tag"> 
            <div id="experiencebox"> 
                <table id= "ex_info_box">       
                    <form action="#">          
                    <button type="button" class="ex_del" onclick="delForm2(this);">삭제</button>
                    <tr>
                        <td><p>회사 명 * <input name="company_name" id="company_name" class="infoForm4" placeholder=" 회사명을 입력하세요"> </p></td>
                    </tr>
                    <tr>
                        <td><p id="qqq"><span>재직 기간 *</span><input type="date" name="company_enter" class="infoForm4">
                            <span class="qqqtext"> ~ </span><input type="date" name="retire" class="infoForm4"></p></td>
                    </tr>
                    <tr>
                        <td> <p>직급/직책 *<input name="position" id="position" class="infoForm4" placeholder=" 근무했던 직책명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p>근무 부서 <input name="department" id="department" class="infoForm4" placeholder=" 근무했던 부서명을 입력하세요"></p></td>
                    </tr>
                    <tr>
                        <td><p>주요 업무<textarea placeholder=" 주요업무에 대한 설명을 자유롭게 기술하세요" class="ex_detail"></textarea></p></td>
                    </tr>
                    </form>
                </table> 
            </div> 
        </div>
    </section>
    <!--자격증-->
    <section>
        <div name="problem_list3" id="problem_list3">
            <h2>자격증 내역<input type="button" class="license_add" value="추가" onclick="addForm3();"></h2>
            <div id="licensebox"> 
                <table>
                    <form action="#"><br><br>
                        <tr>
                            <td><p>자격증명<input name="license_name" class="infoForm3" placeholder="자격증명을 입력하세요"></p></td>
                        </tr>
                        <tr>
                            <td><p>발행처/기관<input name="organ_name" class="infoForm3" placeholder="발행기관명을 입력하세요"></p></td>
                        </tr>
                        <tr>
                            <td>
                                <p>합격구분 <select class="license_select">
                                    <option value="" disabled selected>선택</option>
                                    <option value="1차합격">1차합격</option>
                                    <option value="2차합격">2차합격</option>
                                    <option value="필기합격">필기합격</option>
                                    <option value="실기합격">실기합격</option>
                                    <option value="최종합격">최종합격</option>
                                </select></p>
                            </td>
                        </tr>
                        <tr>
                            <td><p>취득일<input type="date" name="pass_date" id="passday" class="infoForm3"></p></td>
                        </tr>
                    </form>
                </table>
            </div>
        </div>
        <div id="license_info" class="list_file_tag"> 
            <div id="licensebox"> 
                <table>
                    <form action="#">
                        <button type="button" class="license_del" onclick="delForm3(this);">삭제</button>
                        <tr>
                            <td><p>자격증명<input name="license_name" class="infoForm3" placeholder="자격증명을 입력하세요"></p></td>
                        </tr>
                        <tr>
                            <td><p>발행처/기관<input name="organ_name" class="infoForm3" placeholder="발행기관명을 입력하세요"></p></td>
                        </tr>
                        <tr>
                            <td>
                                <p>합격구분 <select class="license_select">
                                    <option value="" disabled selected>선택</option>
                                    <option value="1차합격">1차합격</option>
                                    <option value="2차합격">2차합격</option>
                                    <option value="필기합격">필기합격</option>
                                    <option value="실기합격">실기합격</option>
                                    <option value="최종합격">최종합격</option>
                                </select></p>
                            </td>
                        </tr>
                        <tr>
                            <td><p>취득일<input type="date" name="pass_date" id="passday" class="infoForm3"></p></td>
                        </tr>
                    </form>
                </table>
            </div>
        </div>
    </section>
    <!--포트폴리오-->
    <section>
        <div name="problem_list4" id="problem_list4">
            <h2>포트폴리오 제출<input type="button" class="portfolio_add" value="추가" onclick="addForm4();"></h2>
            <div id="portfoliobox"> 
                <table>
                <form action="#"><br><br>
                    <input type="text" class="portfolio_title" placeholder=" 포트폴리오 이름"><br><br>
                    <button type="button" class="filebtn">첨부파일</button>
                    <button type="button" class="urlbtn">url</button><br><br>
                    <input type="text" class="url" placeholder="http://www.naver.com">
                </form>
                </table>
            </div>
        </div>
        <div id="portfolio_info" class="list_file_tag"> 
            <div id="portfoliobox"> 
                <table>
                <form action="#">
                    <button type="button" class="portfolio_del" onclick="delForm4(this);">삭제</button>
                    <input type="text" class="portfolio_title" placeholder=" 포트폴리오 이름"><br><br>
                    <button type="button" class="filebtn">첨부파일</button>
                    <button type="button" class="urlbtn">url</button><br><br>
                    <input type="text" class="url" placeholder="http://www.naver.com">
                </form>
                </table>
            </div>
        </div>
        <div id="portfoliobox2"> 
            <div class="filebox2">
                <h3>개인첨부파일</h3>
                <button type="button" class="filebtn2">첨부파일</button>
                <button type="button" class="urlbtn2">url</button><br><br>
                <label for="ex_filename" class="ex_filename"><div class="choose_file">파일선택</div></label>
                <input type="file" id="ex_filename" class="filename">
            </div> 
        </div>
    </section>
    <!--완료버튼-->
    <input type="submit" value="완료" class="resume_submit">
</body>
</html>