// 개인회원 기업회원 버튼 
$(function() {
	$("#company").hide()
	$("#personButton").click(function() {
		$("#personButton").css({ "background-color": "#A5E374", "color": "white" })
		$("#companyButton").css({ "background-color": "#F0F0F0", "color": "#858585" })
		$("#individual").show()
		$("#company").hide()
	})

	$("#companyButton").click(function() {
		$("#companyButton").css({ "background-color": "#A5E374", "color": "white" })
		$("#personButton").css({ "background-color": "#F0F0F0", "color": "#858585" })
		$("#individual").hide()
		$("#company").show()
		$("#company").prop("display", "block")
	})
});

// 생년월일 select  
$(document).ready(function() {
	var now = new Date();
	var year = now.getFullYear();
	var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
	var day = (now.getDate()) > 9 ? '' + (now.getDate()) : '0' + (now.getDate());

	//년도 selectbox만들기               
	for (var i = 1900; i <= year; i++) {
		$('#year').append('<option value="' + i + '">' + i + '년</option>');
	}

	// 월별 selectbox 만들기            
	for (var i = 1; i <= 12; i++) {
		var mm = i > 9 ? i : "0" + i;
		$('#month').append('<option value="' + mm + '">' + mm + '월</option>');
	}

	// 일별 selectbox 만들기
	for (var i = 1; i <= 31; i++) {
		var dd = i > 9 ? i : "0" + i;
		$('#day').append('<option value="' + dd + '">' + dd + '일</option>');
	}
	$("#year  > option[value=" + year + "]").attr("selected", "true");
	$("#month  > option[value=" + mon + "]").attr("selected", "true");
	$("#day  > option[value=" + day + "]").attr("selected", "true");
})

// 생년월일 select
$(document).ready(function() {
	var now = new Date();
	var year = now.getFullYear();
	var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
	var day = (now.getDate()) > 9 ? '' + (now.getDate()) : '0' + (now.getDate());

	//년도 selectbox만들기               
	for (var i = 1900; i <= year; i++) {
		$('#year').append('<option value="' + i + '">' + i + '년</option>');
	}

	// 월별 selectbox 만들기            
	for (var i = 1; i <= 12; i++) {
		var mm = i > 9 ? i : "0" + i;
		$('#month').append('<option value="' + mm + '">' + mm + '월</option>');
	}

	// 일별 selectbox 만들기
	for (var i = 1; i <= 31; i++) {
		var dd = i > 9 ? i : "0" + i;
		$('#day').append('<option value="' + dd + '">' + dd + '일</option>');
	}
	$("#year  > option[value=" + year + "]").attr("selected", "true");
	$("#month  > option[value=" + mon + "]").attr("selected", "true");
	$("#day  > option[value=" + day + "]").attr("selected", "true");
});

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
	if ($("#id").val() == "ezen") {
		$("#id").addClass("is-invalid");
		$("#id").focus();
		return;
	}
}

// 개인 회원 유효성 검사
$(function() {
	let idCheck = false;
	let prev_id = "";
	const getIdCheck = RegExp(/^[a-z0-9]{4,12}$/);
	const getPwCheck = RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	const getPhone = RegExp(/^[0-9]{8}$/);

	$("#indiIdCheck").click(function() {
		// 아이디 공백 확인
		if ($("#indiId").val() == "") {
			$("#indiId").addClass("is-invalid");
			$("#indiId").focus();
			return;
		}

		// 아이디 유효성 검사
		if (!getIdCheck.test($("#indiId").val())) {
			alert("아이디는 영어와 숫자를 혼합하여 4자리~12자리 이내로 입력해 주세요.")
			$("#indiId").addClass("is-invalid");
			$("#indiId").focus();
			return;
		}

		// ID 중복확인
		prev_id = $("#indiId").val();

		$.ajax({
			type : "post",
			url : "idCheck",
			data : {
				"position" : "individual",
				"id" : prev_id
			},
			success : function(data) {
				if(data == "true") {
					idCheck = false;
					alert("이미 사용중인 아이디 입니다.");
				} else {
					idCheck = true;
					alert("사용 가능한 아이디 입니다.");
				}				
			}
		})
	})

	$("#indiSignUpBtn").click(function() {
		let curr_id = $("#indiId").val();
		
		// 아이디 공백 확인
		if ($("#indiId").val() == "") {
			$("#indiId").addClass("is-invalid");
			$("#indiId").focus();
			return;
		}

		// 아이디 유효성 검사
		if (!getIdCheck.test($("#id").val())) {
			alert("아이디는 특수문자, 소문자, 숫자를 혼합하여 4자리~12자리 이내로 입력해 주세요.")
			$("#indiId").addClass("is-invalid");
			$("#indiId").focus();
			return;
		}

		// 비밀번호 공백 확인
		if ($("#pw").val() == "") {
			$("#pw").addClass("is-invalid");
			$("#pw").focus();
			return false;
		}

		// 비밀번호 유효성 검사
		if (!getPwCheck.test($("#pw").val())) {
			alert("영문,숫자, 특수문자를 혼합하여 8자리~20자리 이내로 입력해주세요")
			$("#pw").addClass("is-invalid");
			$("#pw").focus();
			return;
		}

		// 비밀번호 확인 공백 확인 
		if ($("#cfpw").val() == "") {
			$("#cfpw").addClass("is-invalid");
			$("#cfpw").focus();
			return;
		}

		// 비밀번호와 비밀번호 확인이 같은지 확인
		if (($("#cfpw").val() != $("#pw").val())) {
			alert("입력하신 비밀번호가 다릅니다.")
			$("#cfpw").addClass("is-invalid");
			$("#cfpw").focus();
			return;
		}

		// 비밀번호 확인 유효성 검사
		if (!getPwCheck.test($("#cfpw").val())) {
			alert("비밀번호가 유효하지 않습니다.")
			$("#cfpw").addClass("is-invalid");
			$("#cfpw").focus();
			return;
		}

		// 개인 회원 성명 입력했는지?
		if ($("#name").val() == "") {
			$("#name").addClass("is-invalid");
			$("#name").focus();
			return;
		}

		// 연도 입력
		if ($("#year").val() == "") {
			$("#year").addClass("is-invalid");
			$("#year").focus();
			return;
		}

		// 월 입력
		if ($("#month").val() == "") {
			$("#month").addClass("is-invalid");
			$("#month").focus();
			return;
		}

		// 일 입력
		if ($("#day").val() == "") {
			$("#day").addClass("is-invalid");
			$("#day").focus();
			return;
		}

		// 성별 확인

		let genderChk = $("#gender option:selected").val();
		if (genderChk == "") {
			$("#gender").addClass("is-invalid");
			$("#gender").focus();
			return;
		}

		// 성별 체크 시
		if (genderChk != "") {
			$("#gender").removeClass("is-invalid");
			$("#gender").focus();
		}

		// 이메일 공백 확인
		if ($("#email").val() == "") {
			$("#email").addClass("is-invalid");
			$("#email").focus();
			return;
		}

		// 이메일 유효성 검사
		if (!getMail.test($("#email").val())) {
			alert("유효한 이메일 주소가 아닙니다.")
			$("#email").addClass("is-invalid");
			$("#email").focus();
			return;
		}

		// 전화번호 공백 확인
		if ($("phoneInd2").val() == "") {
			$("#phoneInd2").addClass("is-invalid");
			$("#phoneInd2").focus();
			return;
		}

		// 전화번호 유효성 검사
		if (!getPhone.test($("#phoneInd2").val())) {
			alert("유효한 전화번호가 아닙니다.")
			$("#phoneInd2").addClass("is-invalid");
			$("#phoneInd2").focus();
			return;
		}

		// 주소 입력 확인
		if ($("#postCode").val() == "") {
			$("#postCode").addClass("is-invalid");
			$("#postCode").focus();
			return;
		}
		if ($("#address").val() == "") {
			$("#address").addClass("is-invalid");
			$("#address").focus();
			return;
		}
		if ($("#detailAddress").val() == "") {
			$("#detailAddress").addClass("is-invalid");
			$("#detailAddress").focus();
			return;
		}
		if(prev_id != curr_id || !idCheck) {
			alert("아이디 중복확인을 체크해 주세요.");
			$("#indiId").focus();
			return;
		}
		perFrm.submit();
	});
});

// 기업 회원 유효성 검사
$(function() {
	let idCheck = false;
	let prev_id = "";
	const getIdCheck = RegExp(/^[a-z0-9]{4,12}$/);
	const getPwCheck = RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	const getPhone = RegExp(/^[0-9]{7,8}$/);
	const getComNum = RegExp(/([0-9]{3})-?([0-9]{2})-?([0-9]{5})/);

	$("#corpIdCheck").click(function() {
		// 아이디 공백 확인
		if ($("#corpId").val() == "") {
			$("#corpId").addClass("is-invalid");
			$("#corpId").focus();
			return;
		}
	
		// 아이디 유효성 검사
		if (!getIdCheck.test($("#corpId").val())) {
			alert("영문,숫자를 혼합하여 4자리~12자리 이내로 입력해주세요")
			$("#corpId").addClass("is-invalid");
			$("#corpId").focus();
			return;
		}
		
		// ID 중복확인
		prev_id = $("#corpId").val();

		$.ajax({
			type : "post",
			url : "idCheck",
			data : {
				"position" : "corporation",
				"id" : prev_id
			},
			success : function(data) {
				if(data == "true") {
					idCheck = false;
					alert("이미 사용중인 아이디 입니다.");
				} else {
					idCheck = true;
					alert("사용 가능한 아이디 입니다.");
				}				
			}
		})
	})

	$("#corpSignUpBtn").click(function() {
		let curr_id = $("#corpId").val();
		
		// 아이디 공백 확인
		if ($("#corpId").val() == "") {
			$("#corpId").addClass("is-invalid");
			$("#corpId").focus();
			return;
		}
	
		// 아이디 유효성 검사
		if (!getIdCheck.test($("#corpId").val())) {
			alert("영문,숫자를 혼합하여 4자리~12자리 이내로 입력해주세요")
			$("#corpId").addClass("is-invalid");
			$("#corpId").focus();
			return;
		}
	
		// 비밀번호 공백 확인
		if ($("#corPw").val() == "") {
			$("#corPw").addClass("is-invalid");
			$("#corPw").focus();
			return;
		}
	
		// 비밀번호 유효성 검사
		if (!getPwCheck.test($("#corPw").val())) {
			alert("영문,숫자, 특수문자를 혼합하여 8자리~20자리 이내로 입력해주세요")
			$("#corPw").addClass("is-invalid");
			$("#corPw").focus();
			return;
		}
	
		// 비밀번호 확인 공백 확인
		if ($("#cfpwCom").val() == "") {
			$("#cfpwCom").addClass("is-invalid");
			$("#cfpwCom").focus();
			return;
		}
	
		// 비밀번호와 비밀번호 확인이 같은지 확인
		if (($("#cfpwCom").val() != $("#corPw").val())) {
			alert("입력하신 비밀번호가 다릅니다.")
			$("#cfpwCom").addClass("is-invalid");
			$("#cfpwCom").focus();
			return;
		}
	
		// 회사명 입력 확인
		if ($("#comName").val() == "") {
			$("#comName").addClass("is-invalid");
			$("#comName").focus();
			return;
		}
	
		// 전화번호 공백 확인
		if ($("#telePhone").val() == "") {
			$("#telePhone").addClass("is-invalid");
			$("#telePhone").focus();
			return;
		}
	
		// 전화번호 유효성 확인
		if (!getPhone.test($("#telePhone").val())) {
			alert("유효하지 않은 전화번호입니다.")
			$("#telePhone").addClass("is-invalid");
			$("#telePhone").focus();
		}
	
		// 대표자명 입력 확인
		if ($("#representative").val() == "") {
			$("#representative").addClass("is-invalid");
			$("#representative").focus();
			return;
		}
	
		// 사업자 등록번호 공백 확인
		if ($("#comNum").val() == "") {
			$("#comNum").addClass("is-invalid");
			$("#comNum").focus();
			return;
		}
	
		// 사업자 등록번호 유효성 검사
		if (!getComNum.test($("#comNum").val())) {
			alert("유효하지 않은 사업자등록번호 입니다.");
			$("#comNum").addClass("is-invalid");
			$("#comNum").focus();
			return;
		}
	
		// 주소 입력 확인
		if ($("#email2").val() == "") {
			$("#email2").addClass("is-invalid");
			$("#email2").focus();
			return;
		}
	
		// 주소 입력 확인
		if ($("#postCode2").val() == "") {
			$("#postCode2").addClass("is-invalid");
			$("#postCode2").focus();
			return;
		}
		if ($("#address2").val() == "") {
			$("#address2").addClass("is-invalid");
			$("#address2").focus();
			return;
		}
		if ($("#detailAddress2").val() == "") {
			$("#detailAddress2").addClass("is-invalid");
			$("#detailAddress2").focus();
			return;
		}
		if(prev_id != curr_id || !idCheck) {
			alert("아이디 중복확인을 체크해 주세요.");
			$("#corpId").focus();
			return;
		}
	
		// 첨부파일 등록 
		if ($("#formFile").val() == "") {
			alert("1개월 이내에 사업자등록증 첨부파일을 등록해 주시기 바랍니다.");
		}
		comFrm.submit();
	})
});

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
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = '(' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("detailAddress").value = extraAddr;

			} else {
				document.getElementById("detailAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
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

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = '(' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("detailAddress2").value = extraAddr;

			} else {
				document.getElementById("detailAddress2").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("address2").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress2").focus();
		}
	}).open();
}
