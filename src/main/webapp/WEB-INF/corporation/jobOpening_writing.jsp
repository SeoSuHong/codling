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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/jobOpening_writing.js"></script>
    <link rel="stylesheet" href="css/jobOpening_writing.css">

</head>
<body>
    <header>
        <div id="menu-bar">
            <div></div>
            <a href="index"><img src="img/logo.png" alt="logoimg" id="logoimg"></a>
                <div id="profile-box">
                    <div id="hover-box"><img src="img/profile.png" alt="mypagelogo" id="profilelogo"><span id="mename">${name}</span> &nbsp;&nbsp;</div>
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
       	<form action="" method="post" name="">
       		<!-- 회사정보 -->
           	<h3>회사 정보</h3>
           	<article id="companyinfo">
                   <table>
                       <tr>
                           <td>회사명</td>
                           <td id="font_medium">${name}</td>
                       </tr>
                       <tr>
                           <td>근무지역*</td>
                           <td id="font_medium"><input name="address" id="address" size="60" placeholder="주소" readonly><input type="button" id="companyinfo_btn" onclick="findAddr()" value="주소찾기"></input></td>
                       </tr>
                       <tr>
                           <td></td>
                           <td id="font_medium"><input name="detailAddress" type="text" id="detailAddr" placeholder="상세주소" size="30"></td>
                       </tr>
                   </table>
           	</article>	
           	<!-- 제목 및 채용 일자 -->
           	<h3>제목 및 채용 일자</h3>
           	<article id="title">
                <table>
                    <tr>
                        <td>공고제목*</td>
                        <td td id="font_medium"><input name="title" id="jobopening_title" size="60"></td>
                    </tr>
                    <tr>
                        <td>시작일*</td>
                        <td><input id="font_medium" name="" type="date" id="">&emsp;&emsp;&emsp;&emsp;&emsp;마감일*&emsp;&emsp;<input name="" type="date" id=""></input>
                        
                    </tr>
                </table>
           	</article>
           	<!-- 모집분야(추가 폼) -->
           	<div name="problem_list" id="problem_list">
               	<h3>모집분야<button id="add" onclick="addForm();">추가</button></h3>
           		<article id="field">
                    <table>
                        <tr>
                            <td>모집분야명*</td>
                            <td id="font_medium"><input name="" id="" size="60">&emsp;&emsp;<input name="" size="3"placeholder="0"class="num">&nbsp;명 모집</td>
                        </tr>
                        <tr>
                            <td>경력여부*</td>
                            <td id="font_medium"> <input name="career_status" value="newcomer"type="checkbox"onclick='checkOnlyOne(this)'><label>&nbsp;신입&emsp;&emsp;</label>
                                <input name="career_status" value="career"type="checkbox"onclick='checkOnlyOne(this)'><label>&nbsp;경력&emsp;&emsp;</label>
                                <select id="font_medium">
                                    <option selected>선택</option>
                                    <option>1년이하</option>
                                    <option>1년이상</option>
                                    <option>2년이하</option>
                                    <option>2년이상</option>
                                    <option>3년이하</option>
                                    <option>3년이상</option>
                                    <option>4년이하</option>
                                    <option>4년이상</option>
                                    <option>5년이하</option>
                                    <option>5년이상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>직급/직책</td>
                            <td id="font_medium"><input name="" size="30"></td>
                        </tr>
                        <tr>
                            <td>급여</td>
                            <td id="font_medium"><input type="text" name="" size="10"id="inputprice"  id="comma" onkeyup="commas(this)" />&nbsp;만원 <span>&emsp;&emsp;<input type="checkbox"><label>&nbsp;면접 후 결정</label></span></td>
                        </tr>
                        <tr>
                            <td>근무요일</td>
                            <td id="font_medium">
                                <input name="workday" type="radio"><label>&nbsp;주5일(월~금)</label>&emsp;
                                <input name="workday" type="radio"><label>&nbsp;유연근무제</label>&emsp;
                                <input name="workday" type="radio"><label>&nbsp;면접 후 결정</label>
                            </td>
                        </tr>
                        <tr>
                            <td>주요업무</td>
                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
                        </tr>
                        <tr>
                            <td>자격요건</td>
                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
                        </tr>
                        <tr>
                            <td>우대사항</td>
                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
                        </tr>
                        <tr>
                            <td>채용절차</td>
                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
                        </tr>
                    </table>
           		</article>
           	</div>
           		<!-- 모집분야(삭제 폼) -->
           		<div id="list_file_tag" class="field_del"> 
           			<article id="field">
                    	<table>
                        	<button id="del" onclick="delForm(this);">삭제</button>
                        	<tr>
                            	<td>모집분야명*</td>
                            	<td id="font_medium"><input name="" id="" size="60">&emsp;&emsp;<input name="" size="3"placeholder="0">&nbsp;명 모집</td>
                        	</tr>
                        	<tr>
	                            <td>경력여부*</td>
	                            <td id="font_medium"> <input name="career_status" value="newcomer"type="checkbox"onclick='checkOnlyOne(this)'><label>&nbsp;신입&emsp;&emsp;</label>
	                                <input name="career status" value="career"type="checkbox"onclick='checkOnlyOne(this)'><label>&nbsp;경력&emsp;&emsp;</label>
	                                <select id="font_medium">
	                                    <option selected>선택</option>
	                                    <option>1년이하</option>
	                                    <option>1년이상</option>
	                                    <option>2년이하</option>
	                                    <option>2년이상</option>
	                                    <option>3년이하</option>
	                                    <option>3년이상</option>
	                                    <option>4년이하</option>
	                                    <option>4년이상</option>
	                                    <option>5년이하</option>
	                                    <option>5년이상</option>
	                                </select>
	                            </td>
                        	</tr>
                        	<tr>
	                            <td>직급/직책</td>
	                            <td id="font_medium"><input name="" size="30"></td>
                        	</tr>
                        	<tr>
	                            <td>급여</td>
	                            <td id="font_medium"><input name="" size="10">&nbsp;만원 <span>&emsp;&emsp;<input type="checkbox"><label>&nbsp;면접 후 결정</label></span></td>
                        	</tr>
                        	<tr>
	                            <td>근무요일</td>
	                            <td id="font_medium">
	                                <input name="workday" type="radio"><label>&nbsp;주5일(월~금)</label>&emsp;
	                                <input name="workday" type="radio"><label>&nbsp;유연근무제</label>&emsp;
	                                <input name="workday" type="radio"><label>&nbsp;면접 후 결정</label>
	                            </td>
                        	</tr>
	                        <tr>
	                            <td>주요업무</td>
	                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
	                        </tr>
	                        <tr>
	                            <td>자격요건</td>
	                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
	                        </tr>
	                        <tr>
	                            <td>우대사항</td>
	                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
	                        </tr>
	                        <tr>
	                            <td>채용절차</td>
	                            <td id="font_medium"><textarea id="textbox" name=""></textarea>
	                        </tr>
                    	</table>
           			</article>
       			</div>
	            <!-- 기업소개 -->
	            <h3>기업소개</h3>
            <article id="company">
            	<table>
                    <tr>
                        <td>기업/서비스소개</td>
                    </tr>
                    <tr>
                        <td id="font_medium"><textarea id="textbox2" name=""></textarea></td>
                        
                    </tr>
                </table>
            </article>
            <!-- 자사양식 -->
            <h3>자사양식</h3>
            <article id="selfFrm">
                    <!-- <div id=file><input type="file" value="파일첨부"></div> -->
               <div class="filebox">
                   <label for="file">파일찾기</label> 
                   <input type="file" id="file" onchange="javascript:document.getElementById('fileName').value = this.value">
                   <input type="text" class="upload_name" value="첨부파일" readonly>       
            	</div>
            </article>
		    <!-- 등록버튼 -->
		    <div id="submit">
		        <button onclick="insertJobOpeningChech()">등록</button>
		    </div>
   		</form>
   	</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>