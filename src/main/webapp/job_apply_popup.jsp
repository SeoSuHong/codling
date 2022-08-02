<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/job_apply_popup.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="plugin/slick-1.8.1/slick/slick.css">
        
</head>
<style>
	label{
		top:1vw;
	}
</style>

<body>
        <div class="container">
                <img src="img/logo.png" class="logo" alt="">
                <div class="containerTop">
                        <span class="work_title">원하는 근무형태</span>

                        <form action="" name="frmWt">
                                <select name="work_opt" class="form-select">
                                        <option value="0">---선택하세요---</option>
                                        <option value="frontend">프론트엔드 개발자</option>
                                        <option value="backend">백엔드 개발자</option>
                                        <option value="publisher">웹 퍼블리셔</option>
                                </select>
                        </form>
                </div>
                <form action="" method="post" name="clFrm">
                        <div class="slider-div">
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <label><input type="radio" id="chk1" name="chk" value="1">선택하기</label>
                                        <p class="clTitle">자기소개서 제목1</p>
                                        <p class="clContent">자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용
                                                자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용</p>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <label><input type="radio" id="chk2" name="chk" value="2">선택하기</label>
                                        <p class="clTitle">자기소개서 제목2</p>
                                        <p class="clContent">자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용
                                                자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용</p>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <label><input type="radio" id="chk3" name="chk" value="3">선택하기</label>
                                        <p class="clTitle">자기소개서 제목3</p>
                                        <p class="clContent">자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용
                                                자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용</p>
                                        
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <label><input type="radio" id="chk4" name="chk" value="4">선택하기</label>
                                        <p class="clTitle">자기소개서 제목4</p>
                                        <p class="clContent">자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용
                                                자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용</p>
                                        
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <p class="clTitle">자기소개서 제목5</p>
                                        <label><input type="radio" id="chk5" name="chk" value="5">선택하기</label>
                                        <p class="clContent">자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용
                                                자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용</p>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <p class="clTitle">자기소개서 제목6</p>
                                        <label><input type="radio" id="chk6" name="chk" value="6">선택하기</label>
                                        <p class="clContent">자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용
                                                자기소개서 앞부분내용 자기소개서 앞부분내용 자기소개서 앞부분내용</p>
                                </div>
                        </div>
                        <input type="button" value="등록" onclick="isSubmit()">
                </form>
        </div>
        <script src="jQuery/jquery-3.6.0.min.js"></script>
        <script src="plugin/slick-1.8.1/slick/slick.min.js"></script>
        <script src="js/job_apply_popup.js"></script>
</body>
</html>