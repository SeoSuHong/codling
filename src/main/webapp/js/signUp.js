<<<<<<< HEAD
//개인회원 기업회원 버튼 클릭 시
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
=======
//개인회원 기업회원 버튼 
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
// 생년월일 select  
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
>>>>>>> 우진

// 생년월일 select
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
});

// ID 길이 체크
function maxLengthCheck(object) {
    if (object.value.length > object.maxLength) {
        object.value = object.value.slice(0, object.maxLength);
    }
}

let inputDataCheck = (id) => {
	
    if(id) {            
        $("#" + id).removeClass("is-invalid");
    }
	if($("#id").val() == "ezen"){
		$("#id").addClass("is-invalid");
		$("#id").focus();
		return;
	}
}

<<<<<<< HEAD
// ID 중복확인 구현해야함
function dumpChk(){
 	if($("#id").val() == ""){
		$("#id").addClass("is-invalid");
		$("#id").focus();
		return;
	}
};

//submit 눌렀을 때 signUpInd_submit 함수 실행
function signUpInd_submit(){
	$("#btn").on("click", function validate1(){
		$(function validate1() {
			let vali = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지 검사할 정규식
			let vali2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //비밀번호 정규식
			var vali3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
	
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
			if($("#gender").val() == ""){
	  			$("#gender").addClass("is-invalid");
	  			$("#gender").focus();
	  			return;
			}
			if($("#email").val() == ""){
	  			$("#email").addClass("is-invalid");
	  			$("#email").focus();
	  			return;
			}
			if($("#phoneInd2").val() == ""){
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
			location.href="index.jsp";
		})
	})
};

// submit 눌렀을때 signUpCom_submit 함수 실행
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
	if($("#comName").val() == ""){
		$("#comName").addClass("is-invalid");
		$("#comName").focus();
		return;
	}
	if($("#telePhone").val() == ""){
		$("#telePhone").addClass("is-invalid");
		$("#telePhone").focus();
		return;
	}
	if($("#representative").val() == ""){
		$("#representative").addClass("is-invalid");
		$("#representative").focus();
		return;
	}
	if($("#comNum").val() == ""){
		$("#comNum").addClass("is-invalid");
		$("#comNum").focus();
		return;
	}
	if($("#post1Com").val() == ""){
		$("#post1Com").addClass("is-invalid");
		$("#post1Com").focus();
		return;
	}
	if($("#address1Com").val() == ""){
		$("#address1Com").addClass("is-invalid");
		$("#address1Com").focus();
		return;
	}
	if($("#address2Com").val() == ""){
		$("#address2Com").addClass("is-invalid");
		$("#address2Com").focus();
		return;
	}
	if($("#formFile").val() == ""){
		alert("1개월 이내 증빙서류 제출 바랍니다.");
	}
	alert("Welcome🍏");
	location.href="index.jsp";
}


//유효성 검사
$("#btn").on("click", function validate1(){
	$(function validate1() {
		let vali = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지 검사할 정규식
		let vali2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //비밀번호 정규식
		var vali3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식

		let id = document.getElementById("id");
		let pw = document.getElementById("pw");
		let cfpw = document.getElementById("cfpw");
		let name = document.getElementById("name");
		let year = document.getElementById("year");    // 배열로 담아야 할까나??
		let month = document.getElementById("month");    // 배열로 담아야 할까나??
		let day = document.getElementById("day");    // 배열로 담아야 할까나??
		let phoneInd1 = document.getElementById("phoneInd1");
		let phoneInd2 = document.getElementById("phoneInd2");
		let post1 = document.getElementById("post1");
		let address1 = document.getElementById("address1");
		let address2 = document.getElementById("address2");

		//검사
		if($('#id').val()==''){
			alert('아이디를 입력해주세요.')
			id.focus();
			return false;
		}
		if(!check(vali,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")){
			return false;
		}
		if(pw.value=="") {
			alert("비밀번호를 입력해 주세요");
			pw.focus();
			return false;
		}
		if(!check(vali2,pw,"비밀번호는 최소 8자이상의 문자, 숫자, 특수문자($@$!%*#?&)를 포함해야 합니다.")){
			return false;
		}
		if(cfpw.value=="") {
			alert("비밀번호를 다시 한 번 입력해 주세요");
			cfpw.focus();
			return false;
		}
		if(pw.value==cfpw.value) {
			alert("비밀번호가 일치하지 않습니다.");
			cfpw.focus();
			return false;
		}
		if(name.value=="") {
			alert("이름을 입력해 주세요");
			name.focus();
			return false;
		}
		if(year.value=="") {
			alert("년도를 선택해 주세요");
			year.focus();
			return false;
		}
		if(month.value=="") {
			alert("월을 선택해 주세요");
			month.focus();
			return false;
		}
		if(day.value=="") {
			alert("날짜를 선택해 주세요");
			day.focus();
			return false;
		}
		if(phoneInd1.value=="") {
			alert("식별번호를 선택해 주세요");
			phoneInd1.focus();
			return false;
		}
		if(post1.value=="") {
			alert("우편번호를 입력해주세요");
			post1.focus();
			return false;
		}
		if(address1.value=="") {
			alert("주소를 입력해주세요");
			address1.focus();
			return false;
		}
		if(address2.value=="") {
			alert("주소를 입력해주세요");
			address2.focus();
			return false;
		}
		alert("Welcome🍏");
		location.href="index.jsp";
	});
});

function validate2() {
	let vali = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지 검사할 정규식
	let vali2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ //비밀번호 정규식
	let vali3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
  
	//기업
	let idCom = document.getElementById("idCom");
	let pwCom = document.getElementById("pwCom");
	let cfpwCom = document.getElementById("cfpwCom");
	let perIC = document.getElementById("perIC");
	let perICPhone = document.getElementById("perICPhone");
	let perICPhone2 = document.getElementById("perICPhone2");
	let nameCom = document.getElementById("nameCom");
	let post1 = document.getElementById("post1");
	let address1 = document.getElementById("address1");
	let address2 = document.getElementById("address2");
	let representative = document.getElementById("representative");
    let companyNum = document.getElementById("companyNum");
    let formFile = document.getElementById("formFile");
    let post1Com = document.getElementById("post1Com");
    let address1Com = document.getElementById("address1Com");
    let address2Com = document.getElementById("address2Com");
  
	//검사
	if(!check(vali, idCom,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")){
		return false;
	}
	if(!check(vali2,pwCom,"비밀번호는 최소 8자이상의 문자, 숫자, 특수문자($@$!%*#?&)를 포함해야 합니다.")){
		return false;
	}
	if(pwCom.value!=cfpwCom.value) {
		alert("비밀번호가 일치하지 않습니다.");
		cfpw.focus();
		return false;
	}
	if(perICPhone.value=="") {
		alert("지역번호를 선택해 주세요");
		perICPhone.focus();
		return false;
	}
	if(perICPhone2.value=="") {
		alert("전화번호를 입력해 주세요");
		perICPhone.focus();
		return false;
	}
	if(nameCom.value=="") {
		alert("회사명를 입력해 주세요");
		nameCom.focus();
		return false;
	}
	if(post1.value=="") {
		alert("우편번호를 입력해주세요");
		post1.focus();
		return false;
	}
	if(address1.value=="") {
		alert("주소를 입력해주세요");
		address1.focus();
		return false;
	}
	if(address2.value=="") {
		alert("주소를 입력해주세요");
		address1.focus();
		return false;
	}
	if(representative.value=="") {
		alert("대표자명을 입력해 주세요");
		representative.focus();
		return false;
	}
	if(companyNum.value=="") {
		alert("사업자 등록번호를 입력해 주세요");
		companyNum.focus();
		return false;
	}
	if(formFile.value=="") {
		alert("증빙서류를 첨부해 주세요");
		formFile.focus();
		return false;
	}
	if(post1Com.value=="") {
		alert("우편번호를 입력해주세요");
		post1Com.focus();
		return false;
	}
	if(address1Com.value=="") {
		alert("주소를 입력해주세요");
		address1Com.focus();
		return false;
	}
	if(address2Com.value=="") {
		alert("주소를 입력해주세요");
		address2Com.focus();
		return false;
	}
	alert("Welcome🍏");
	location.href="index.jsp";
}

// 유효성검사 
window.addEventListener('load', () => {
	// const는 호출 결과를 form 상수에 받아서 활용함. 물론 상수나 변수에 함수를 할당할 수도 있다.
	const forms = document.getElementsByClassName('validation-form');
	Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function (event) {
			if (form.checkValidity() == false) {
				event.preventDefault();
				event.stopPropagation();
			}
			form.classList.add('was-validated');
		}, false);
	});
}, false);
=======

  // 개인 회원 유효성 검사
  function signUpInd_submit(){
    const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    const getPwCheck =  RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/);
    const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    const getPhone = RegExp(/\d{4}$/);

    // 아이디 공백 확인
    if($("#id").val() == ""){
        $("#id").addClass("is-invalid");
        $("#id").focus();
        $("#id").val("");
        return;
    }

    // 아이디 유효성 검사
    if(!getIdCheck.test($("#id").val())){
      alert("영문,숫자를 혼합하여 4자리~12자리 이내로 입력해주세요")
      $("#id").addClass("is-invalid");
      $("#id").focus();
      $("#id").val("");
      return;
  }

  // 비밀번호 공백 확인
    if($("#pw").val() == ""){
      $("#pw").addClass("is-invalid");
      $("#pw").focus();
      $("#pw").val("");
      return false;
  }

  // 비밀번호 유효성 검사
  if(!getPwCheck.test($("#pw").val())){
    alert("영문,숫자, 특수문자를 혼합하여 8자리~20자리 이내로 입력해주세요")
    $("#pw").addClass("is-invalid");
    $("#pw").focus();
    $("#pw").val("");
    return;
}

  // 비밀번호 확인 공백 확인 
  if($("#cfpw").val() == ""){
    $("#cfpw").addClass("is-invalid");
    $("#cfpw").focus();
    $("#cfpw").val("");
    return;
}

// 비밀번호와 비밀번호 확인이 같은지 확인
  if(($("#cfpw").val()!=$("#pw").val())){
    alert("입력하신 비밀번호가 다릅니다.")
    $("#cfpw").addClass("is-invalid");
    $("#cfpw").focus();
    $("#cfpw").val("");
    return;
}

// 비밀번호 확인 유효성 검사
if(!getPwCheck.test($("#cfpw").val())){
  alert("비밀번호가 유효하지 않습니다.")
  $("#cfpw").addClass("is-invalid");
  $("#cfpw").focus();
  $("#cfpw").val("");
  return;
}

// 개인 회원 성명 입력했는지?
if($("#name").val() == ""){
  $("#name").addClass("is-invalid");
  $("#name").focus();
  $("#name").val("");
  return;
}

// 연도 입력
if($("#year").val() == ""){
  $("#year").addClass("is-invalid");
  $("#year").focus();
  $("#year").val("");
  return;
}

// 월 입력
if($("#month").val() == ""){
  $("#month").addClass("is-invalid");
  $("#month").focus();
  $("#month").val("");
  return;
}

// 일 입력
if($("#day").val() == ""){
  $("#day").addClass("is-invalid");
  $("#day").focus();
  $("#day").val("");
  return;
}

// 성별

let genderChk = $("#gender option:selected").val(); 
if(genderChk == ""){
  $("#gender").addClass("is-invalid");
  $("#gender").focus();
  return;
}


// 이메일 공백 확인
if($("#email").val() == ""){
  $("#email").addClass("is-invalid");
  $("#email").focus();
  $("#email").val("");
  return;
}

// 이메일 유효성 검사
if(!getMail.test($("#email").val())){
  alert("유효한 이메일 주소가 아닙니다.")
  $("#email").addClass("is-invalid");
  $("#email").focus();
  $("#email").val("");
  return;
}

// 전화번호 공백 확인
if($("phoneInd2").val() == ""){
  $("#phoneInd2").addClass("is-invalid");
  $("#phoneInd2").focus();
  $("#phoneInd2").val("");
  return;
}

// 전화번호 유효성 검사
if(!getPhone.test($("#phoneInd2").val())){
  alert("유효한 전화번호가 아닙니다.")
  $("#phoneInd2").addClass("is-invalid");
  $("#phoneInd2").focus();
  $("#phoneInd2").val("");
  return;
}

// 주소 입력 확인
if($("#postCode").val() == ""){
  $("#postCode").addClass("is-invalid");
  $("#postCode").focus();
  return;
}
if($("#address").val() == ""){
  $("#address").addClass("is-invalid");
  $("#address").focus();
  return;
}
if($("#detailAddress").val() == ""){
  $("#detailAddress").addClass("is-invalid");
  $("#detailAddress").focus();
  return;
}

	alert("Welcome🍏");
  	location.href="index.jsp";
	// perFrm.submit();
  }
 // 고객 회원 유효성 검사
function signUpCom_submit(){
    const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    const getPwCheck =  RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/);
    const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    const getPhone = RegExp(/^\d{4}$/);
    const getComNum = RegExp(/([0-9]{3})-?([0-9]{2})-?([0-9]{5})/);
    
	// 아이디 공백 확인
  if($("#Comid").val() == ""){
        $("#Comid").addClass("is-invalid");
        $("#Comid").focus();
        return;
  }
  
  // 아이디 유효성 검사
  if(!getPhone.test($("#Comid").val())){
  	alert("영문,숫자를 혼합하여 4자리~12자리 이내로 입력해주세요")
  	$("#Comid").addClass("is-invalid");
  	$("#Comid").focus();
  	$("#Comid").val("");
  	return;
}
  
  // 비밀번호 공백 확인
  if($("#pwCom").val() == ""){
    $("#pwCom").addClass("is-invalid");
    $("#pwCom").focus();
    $("#pwCom").val("");
    return;
}

	// 비밀번호 유효성 검사
	if(!getPwCheck.test($("#pwCom").val())){
		alert("영문,숫자, 특수문자를 혼합하여 8자리~20자리 이내로 입력해주세요")
		$("#pwCom").addClass("is-invalid");
	    $("#pwCom").focus();
	    $("#pwCom").val("");
	}


	// 비밀번호 확인 공백 확인
	if($("#cfpwCom").val() == ""){
  	 $("#cfpwCom").addClass("is-invalid");
  	 $("#cfpwCom").focus();
  	 return;
	 }
	
	// 비밀번호와 비밀번호 확인이 같은지 확인
  	if(($("#cfpwCom").val()!=$("#pwCom").val())){
    alert("입력하신 비밀번호가 다릅니다.")
    $("#cfpwCom").addClass("is-invalid");
    $("#cfpwCom").focus();
    $("#cfpwCom").val("");
    return;
	}

	// 회사명 입력 확인
	if($("#comName").val() == ""){
	$("#comName").addClass("is-invalid");
	$("#comName").focus();
	return;
	}
	
	// 대표자명 입력 확인
	if($("representative").val() == ""){
	$("#representative").addClass("is-invalid");
	$("#representative").focus();
	return;
	}
	
	// 사업자 등록번호 공백 확인
	if($("#comNum").val() == ""){
	$("#comNum").addClass("is-invalid");
	$("#comNum").focus();
	return;
	}
	
	// 사업자 등록번호 유효성 검사
	if(!getComNum.test($("#comNum").val())){
	alert("유효하지 않은 비밀번호 입니다.");
	$("#comNum").addClass("is-invalid");
    $("#comNum").focus();
    $("#comNum").val("");
	}
	
	// 파일 등록 했는지 ? 
	if($("#formFile").val() == ""){
	$("#formFile").addClass("is-invalid");
	$("#formFile").focus();
	alert("1개월 이내 증빙서류 제출 바랍니다.");
	}
	
	// 주소 입력 확인
if($("#postCode2").val() == ""){
  $("#postCode2").addClass("is-invalid");
  $("#postCode2").focus();
  return;
}
if($("#address2").val() == ""){
  $("#address2").addClass("is-invalid");
  $("#address2").focus();
  return;
}
if($("#detailAddress2").val() == ""){
  $("#detailAddress2").addClass("is-invalid");
  $("#detailAddress2").focus();
  return;
}
	
	
	

	alert("Welcome🍏");
	location.href="index.jsp";
	// comFrm.submit();
  }
  
  
 
  
  
  
    // 개인회원 주소 입력
function sample6_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("extraAddress").value = extraAddr;
          
          } else {
              document.getElementById("extraAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('postCode').value = data.zonecode;
          document.getElementById("address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("detailAddress").focus();
      }
  }).open();
}

// 기업 회원 주소 입력
function sample7_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("extraAddress2").value = extraAddr;
          
          } else {
              document.getElementById("extraAddress2").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('postCode2').value = data.zonecode;
          document.getElementById("address2").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("detailAddress2").focus();
      }
  }).open();
}
>>>>>>> 우진
