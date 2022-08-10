<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix= "sql"  %>  
<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PopUp</title>
        <link rel="stylesheet" href="css/job_apply_popup.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="plugin/slick-1.8.1/slick/slick.css">
        <sql:setDataSource var="conn" driver="jdbc:mysql://localhost:3306/codling" user="codling" password="1234"/>
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
                                        <c:choose>
                                        	<c:when test="${coverletter.no eq 1}">
		                                        <label><input type="radio" id="chk1" name="chk" value="1">선택하기</label>
		                                        <p class="clTitle">${coverletter.title}</p>
		                                        <p class="clContent">${coverletter.content}</p>
	                                        </c:when>
                                        </c:choose>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <c:if test="${coverletter.no eq 2}">
                                        <label><input type="radio" id="chk${coverletter.co == 2}" name="chk" value="2">선택하기</label>
                                        <p class="clTitle">${coverleter.title}</p>
                                        <p class="clContent">${coverleter.content}</p>
                                        </c:if>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <c:if test="${coverletter.no eq 3}">
                                        <label><input type="radio" id="chk${coverletter.co == 3}" name="chk" value="3">선택하기</label>
                                        <p class="clTitle">${coverleter.title}</p>
                                        <p class="clContent">${coverleter.content}</p>
                                        </c:if>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <c:if test="${coverletter.no eq 4}">
                                        <label><input type="radio" id="chk${coverletter.co == 4}" name="chk" value="4">선택하기</label>
                                        <p class="clTitle">${coverleter.title}</p>
                                        <p class="clContent">${coverleter.content}</p>
                                        </c:if>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <c:if test="${coverletter.no eq 5}">
	                                        <p class="clTitle">${coverletter.co == 5}</p>
	                                        <label><input type="radio" id="chk${coverletter.co == 5}" name="chk" value="5">선택하기</label>
	                                        <p class="clContent">${coverleter.content}</p>
                                        </c:if>
                                </div>
                                <div class="containerBot">
                                        <p>자기소개서</p>
                                        <c:if test="${coverletter.no eq 5}">
                                        <p class="clTitle">${coverletter.co == 6}</p>
                                        <label><input type="radio" id="chk${coverletter.co == 6}" name="chk" value="6">선택하기</label>
                                        <p class="clContent">${coverleter.content}</p>
                                        </c:if>
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