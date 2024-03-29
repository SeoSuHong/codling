

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

//submit 눌렀을때 signUpInd_submit 함수 실행
function signUpInd_submit() {
  const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    const getPwCheck =  RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/);
    const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    const getPhone = RegExp( /^[0-9]{8}$/);

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
    alert("영문, 숫자, 특수문자를 혼합하여 8자리~20자리 이내로 입력해주세요")
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

// 성별 확인
let genderChk = $("#gender option:selected").val(); 
if(genderChk == ""){
  $("#gender").addClass("is-invalid");
  $("#gender").focus();
  return;
}

// 성별 체크 시
if(genderChk !=""){
	$("#gender").removeClass("is-invalid");
  	$("#gender").focus();
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
if($("phoneInd2").val() === ""){
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
if($("#address").val() == ""){
  $("#address").addClass("is-invalid");
  $("#address").focus();
  return;
}
  document.indiModifyForm.submit();
}

function findAddress() {
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