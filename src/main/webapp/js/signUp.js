//개인회원 기업회원 버튼 ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤
$(function() {
  $("#company").hide()
  $("#personButton").click(function(){
    $("#personButton").css({"background-color": "#A5E374", "color": "white"})
    $("#companyButton").css({"background-color": "#F0F0F0", "color": "#858585"})
    $("#individual").show()
    $("#company").hide()
  })
  $("#companyButton").click(function(){
    $("#companyButton").css({"background-color": "#A5E374", "color": "white"})
    $("#personButton").css({"background-color": "#F0F0F0", "color": "#858585"})
    $("#individual").hide()
    $("#company").show()
    $("#company").prop("display","block")
  })
  });
// 생년월일 select  ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤
    $(document).ready(function(){            
      var now = new Date();
      var year = now.getFullYear();
      var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
      var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
      //년도 selectbox만들기               
      for(var i = 1900 ; i <= year ; i++) {
          $('#year').append('<option value="' + i + '">' + i + '년</option>');    
      }
  
      // 월별 selectbox 만들기            
      for(var i=1; i <= 12; i++) {
          var mm = i > 9 ? i : "0"+i ;            
          $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
      }
      
      // 일별 selectbox 만들기
      for(var i=1; i <= 31; i++) {
          var dd = i > 9 ? i : "0"+i ;            
          $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
      }
      $("#year  > option[value="+year+"]").attr("selected", "true");        
      $("#month  > option[value="+mon+"]").attr("selected", "true");    
      $("#day  > option[value="+day+"]").attr("selected", "true");       
  })

  // ID 길이 체크
function maxLengthCheck(object) {
  if (object.value.length > object.maxLength) {
      object.value = object.value.slice(0, object.maxLength);
  }
}
let inputDataCheck = (id) => {
    if (id) {            
        $("#" + id).removeClass("is-invalid");
    }
}

// ID 중복확인 구현해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// function dupChk(){
 
//   if($("#id").val() == ""){
//       $("#id").addClass("is-invalid");
//       $("#id").focus();
//       return;}}


  //submit 눌렀을때 signUpInd_submit 함수 실행❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤
  function signUpInd_submit(){
// $("#btn").on("click", function validate1(){
  
//   $(function validate1() {
//     let vali = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지 검사할 정규식
//     let vali2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //비밀번호 정규식
//     // var vali3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식

//   if(!check(vali, idCom,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")){
//     return false;
//   }
//   if(!check(vali2,pwCom,"비밀번호는 최소 8자이상의 문자, 숫자, 특수문자($@$!%*#?&)를 포함해야 합니다.")){
//     return false;
//   }


    if($("#id").val() == ""){
        $("#id").addClass("is-invalid");
        $("#id").focus();
        return;
    }
    if($("#pw").val() == ""){
      $("#pw").addClass("is-invalid");
      $("#pw").focus();
      return;
  }
  if($("#cfpw").val() == ""){
    $("#cfpw").addClass("is-invalid");
    $("#cfpw").focus();
    return;
}
if($("#name").val() == ""){
  $("#name").addClass("is-invalid");
  $("#name").focus();
  return;
}
if($("#year").val() == ""){
  $("#year").addClass("is-invalid");
  $("#year").focus();
  return;
}

if($("#month").val() == ""){
  $("#month").addClass("is-invalid");
  $("#month").focus();
  return;
}

if($("#day").val() == ""){
  $("#day").addClass("is-invalid");
  $("#day").focus();
  return;
}
if($("#email").val() == ""){
  $("#email").addClass("is-invalid");
  $("#email").focus();
  return;
}
if($("#phoneInd1").val() == ""){
  $("#phoneInd1").addClass("is-invalid");
  $("#phoneInd1").focus();
  return;
}
if($("phoneInd2").val() == ""){
  $("#phoneInd2").addClass("is-invalid");
  $("#phoneInd2").focus();
  return;
}
if($("#post1").val() == ""){
  $("#post1").addClass("is-invalid");
  $("#post1").focus();
  return;
}
if($("#address1").val() == ""){
  $("#address1").addClass("is-invalid");
  $("#address1").focus();
  return;
}
if($("#address2").val() == ""){
  $("#address2").addClass("is-invalid");
  $("#address2").focus();
  return;
}


alert("Welcome🍏");
 location.href="default_page.html";



   
  }
 // submit 눌렀을때 signUpCom_submit 함수 실행❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤
function signUpCom_submit(){

  if($("#Comid").val() == ""){
        $("#Comid").addClass("is-invalid");
        $("#Comid").focus();
        return;
  }
  if($("#pwCom").val() == ""){
    $("#pwCom").addClass("is-invalid");
    $("#pwCom").focus();
    return;
}
if($("#cfpwCom").val() == ""){
  $("#cfpwCom").addClass("is-invalid");
  $("#cfpwCom").focus();
  return;
}
if($("#perIC").val() == ""){
$("#perIC").addClass("is-invalid");
$("#perIC").focus();
return;
}
if($("#perICPhone").val() == ""){
$("#perICPhone").addClass("is-invalid");
$("#perICPhone").focus();
return;
}
if($("#perICPhone2").val() == ""){
$("#perICPhone2").addClass("is-invalid");
$("#perICPhone2").focus();
return;
}

if($("#comName").val() == ""){
$("#comName").addClass("is-invalid");
$("#comName").focus();
return;
}

if($("representative").val() == ""){
$("#representative").addClass("is-invalid");
$("#representative").focus();
return;
}
if($("#comNum").val() == ""){
$("#comNum").addClass("is-invalid");
$("#comNum").focus();
return;
}
if($("#formFile").val() == ""){
$("#formFile").addClass("is-invalid");
$("#formFile").focus();
alert("1개월 이내 증빙서류 제출 바랍니다.");
}

alert("Welcome🍏");
location.href="default_page.html";



    
   
  }


//   //유효성 검사❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤

// $("#btn").on("click", function validate1(){
  
//   $(function validate1() {
//     let vali = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지 검사할 정규식
//     let vali2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //비밀번호 정규식
//     // var vali3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식


//     let id = document.getElementById("id");
//     let pw = document.getElementById("pw");
//     let cfpw = document.getElementById("cfpw");
//     let name = document.getElementById("name");
//     let year = document.getElementById("year");    // 배열로 담아야 할까나??
//     let month = document.getElementById("month");    // 배열로 담아야 할까나??
//     let day = document.getElementById("day");    // 배열로 담아야 할까나??
//     let phoneInd1 = document.getElementById("phoneInd1");
//     let phoneInd2 = document.getElementById("phoneInd2");
//     let post1 = document.getElementById("post1");
//     let address1 = document.getElementById("address1");
//     let address2 = document.getElementById("address2");

// //검사

// if($('#id').val()==''){
//   alert('아이디를 입력해주세요.')
//   id.focus();
//   return false;
// }


// if(!check(vali,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")){
//   return false;
// }
// if(pw.value=="") {
//   alert("비밀번호를 입력해 주세요");
//   pw.focus();
//   return false;
// }
// if(!check(vali2,pw,"비밀번호는 최소 8자이상의 문자, 숫자, 특수문자($@$!%*#?&)를 포함해야 합니다.")){
//   return false;
// }
// if(cfpw.value=="") {
//   alert("비밀번호를 다시 한 번 입력해 주세요");
//   cfpw.focus();
//   return false;
// }
// if(pw.value==cfpw.value) {
//   alert("비밀번호가 일치하지 않습니다.");
//   cfpw.focus();
//   return false;
// }



// if(name.value=="") {
//   alert("이름을 입력해 주세요");
//   name.focus();
//   return false;
// }
// if(year.value=="") {
//   alert("년도를 선택해 주세요");
//   year.focus();
//   return false;
// }
// if(month.value=="") {
//   alert("월을 선택해 주세요");
//   month.focus();
//   return false;
// }
// if(day.value=="") {
//   alert("날짜를 선택해 주세요");
//   day.focus();
//   return false;
// }
// if(phoneInd1.value=="") {
//   alert("식별번호를 선택해 주세요");
//   phoneInd1.focus();
//   return false;
// }
// if(post1.value=="") {
//   alert("우편번호를 입력해주세요");
//   post1.focus();
//   return false;
// }
// if(address1.value=="") {
//   alert("주소를 입력해주세요");
//   address1.focus();
//   return false;
// }
// if(address2.value=="") {
//   alert("주소를 입력해주세요");
//   address2.focus();
//   return false;
// }


// alert("Welcome🍏");
// location.href="default_page.html";
// });

  
//   });



// function validate2() {
//   let vali = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지 검사할 정규식
//   let vali2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //비밀번호 정규식
//  //let vali3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
  
//   //기업
//   let idCom = document.getElementById("idCom");
//   let pwCom = document.getElementById("pwCom");
//   let cfpwCom = document.getElementById("cfpwCom");
//   let perIC = document.getElementById("perIC");
//   let perICPhone = document.getElementById("perICPhone");
//   let perICPhone2 = document.getElementById("perICPhone2");
//   let nameCom = document.getElementById("nameCom");
//   let post1 = document.getElementById("post1");
//   let address1 = document.getElementById("address1");
//   let address2 = document.getElementById("address2");
//   let representative = document.getElementById("representative");
//   let companyNum = document.getElementById("companyNum");
//   let formFile = document.getElementById("formFile");
//   let post1Com = document.getElementById("post1Com");
//   let address1Com = document.getElementById("address1Com");
//   let address2Com = document.getElementById("address2Com");
  
//   //검사


//   if(!check(vali, idCom,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")){
//     return false;
//   }
//   if(!check(vali2,pwCom,"비밀번호는 최소 8자이상의 문자, 숫자, 특수문자($@$!%*#?&)를 포함해야 합니다.")){
//     return false;
//   }
//   if(pwCom.value==cfpwCom.value) {
//     alert("비밀번호가 일치하지 않습니다.");
//     cfpw.focus();
//     return false;
//   }
  
//   if(perIC.value=="") {
//     alert("인사 담당자의 이름을 입력해 주세요");
//     perIC.focus();
//     return false;
//   }
//   if(perICPhone.value=="") {
//     alert("지역번호를 선택해 주세요");
//     perICPhone.focus();
//     return false;
//   }
//   if(perICPhone2.value=="") {
//     alert("전화번호를 입력해 주세요");
//     perICPhone.focus();
//     return false;
//   }
//   if(nameCom.value=="") {
//     alert("회사명를 입력해 주세요");
//     nameCom.focus();
//     return false;
//   }
//   if(post1.value=="") {
//     alert("우편번호를 입력해주세요");
//     post1.focus();
//     return false;
//   }
//   if(address1.value=="") {
//     alert("주소를 입력해주세요");
//     address1.focus();
//     return false;
//   }
//   if(address2.value=="") {
//     alert("주소를 입력해주세요");
//     address1.focus();
//     return false;
//   }
//   if(representative.value=="") {
//     alert("대표자명을 입력해 주세요");
//     representative.focus();
//     return false;
//   }
//   if(companyNum.value=="") {
//     alert("사업자 등록번호를 입력해 주세요");
//     companyNum.focus();
//     return false;
//   }
//   if(formFile.value=="") {
//     alert("증빙서류를 첨부해 주세요");
//     formFile.focus();
//     return false;
//   }
//   if(post1Com.value=="") {
//     alert("우편번호를 입력해주세요");
//     post1Com.focus();
//     return false;
//   }
//   if(address1Com.value=="") {
//     alert("주소를 입력해주세요");
//     address1Com.focus();
//     return false;
//   }
//   if(address2Com.value=="") {
//     alert("주소를 입력해주세요");
//     address2Com.focus();
//     return false;
//   }

//   alert("Welcome🍏");
//   location.href="default_page.html";
//     }
  


  // 유효성검사 
  // window.addEventListener('load', () => {

  //   const forms = document.getElementsByClassName('validation-form');
  
  //   Array.prototype.filter.call(forms, (form) => {
  //     form.addEventListener('submit', function (event) {
  //       if (form.checkValidity() === false) {
  //         event.preventDefault();
  //         event.stopPropagation();
  //       }
  
  //       form.classList.add('was-validated');
  //     }, false);
  //   });
  // }, false);



  
