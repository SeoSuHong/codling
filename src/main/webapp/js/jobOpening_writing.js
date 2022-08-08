/*hover*/ 
$(function(){
    let num = document.documentElement.scrollWidth
    if(num <= 1220){
        $("header").css({"width":"98vw"})
    } else {
        $("header").css({"width":"1220px"})
    }

    $(window).resize(function(){
        let number = document.documentElement.scrollWidth
        if(number <= 1220){
        $("header").css({"width":"98vw"})     
    } else {
        $("header").css({"width":"1220px"})
    }
    })
    
    $("#profile-hover").hide();

    $("#profile-box").hover(function() {
        $("#profile-hover").stop().slideDown();
    },function(){
        $("#profile-hover").stop().slideUp();
    });
    $("#profile-hover").hover(function() {
        $(this).stop().slideDown();
    },function(){
        $(this).stop().slideUp();
    });
})


/*추가 삭제버튼*/
function addForm() {
    $('#problem_list').append($('#list_file_tag').html());
    check_click();
}
function delForm(obj){
    var div = $(obj).parent();
    //console.log(div);
    //라인 삭제
    div.remove();
}

/*checkbox하나만 체크*/
function checkOnlyOne(element) {
  
    const checkboxes 
        = document.getElementsByName("career_status");
    
    checkboxes.forEach((cb) => {
      cb.checked = false;
    })
    
    element.checked = true;
}

/*주소찾기*/
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = ''; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수
	
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
	                
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
	
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("address").value = addr + extraRoadAddr;
			
			document.getElementById("detailAddr").focus();
		}
	}).open();
}

/*input 숫자만 입력*/
$(function(){
    $('.num').on('keypress', function(e){
        var charCode = e.which || e.keyCode;

        if (charCode > 31 && (charCode < 48 || charCode > 57)){
            alert("숫자만 입력하세요");
            return false;
        }
        return true;
    });
});


/*금액입력받기 */
function commas(t) {
    // 콤마 빼고 
    var x = t.value;         
    x = x.replace(/,/gi, '');
    // 숫자 정규식 확인
    var regexp = /^[0-9]*$/;
    if(!regexp.test(x)){ 
    $(t).val(""); 
        alert("숫자만 입력 가능합니다.");
    } else {
        x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");         
        $(t).val(x);         
    }
}

function disp(){var msg = "다음 여행지를 선택화셨습니다.\n";
	var checkBoxes = document.getElementsByName("career_status");
	for(var i=0; i<checkBoxes.length; i++){
	    if(checkBoxes[i].checked) {msg += "-" + checkBoxes[i].value + "\n";}
	}alert(msg);
}


// 경력체크시 alert창띄우기


//빈칸오류메세지
function checkfield(){
 
    if(document.addjoin.id.value==""){ //id값이 없을 경우
    alert("아이디를 입력하세요");         //메세지 경고창을 띄운 후
    document.addjoin.id.focus();     // id 텍스트박스에 커서를 위치
    exit;
    
    }else if(document.addjoin.pw.value==""){
    alert("비밀번호를 입력하세요");
    document.addjoin.pw.focus();
    exit;
    
    }else if(document.addjoin.pw2.value==""){
    alert("비밀번호확인을 입력하세요");
    document.addjoin.pw2.focus();
    exit;
    
    }else if(document.addjoin.name.value==""){
    alert("이름을 입력하세요");
    document.addjoin.name.focus();
    exit;
    
    }else if(document.addjoin.nick.value==""){
    alert("닉네임을 입력하세요");
    document.addjoin.nick.focus();
    exit;
    
    }else if(document.addjoin.addr.value==""){
    alert("주소를 입력하세요");
    document.addjoin.addr.focus();
    exit;
    
    }else if(document.addjoin.email.value==""){
    alert("이메일을 입력하세요");
    document.addjoin.email.focus();
    exit;
    
    }
    
    
    if(document.addjoin.pw.value!=document.addjoin.pw2.value){
    //비밀번호와 비밀번호확인의 값이 다를 경우
    
    alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
    document.addjoin.pw.focus();
    exit;
    
    }
    
    
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    
    if(exptext.test(document.addjoin.email.value)==false){
    //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
    
    alert("이 메일형식이 올바르지 않습니다.");
    document.addjoin.email.focus();
    exit;
    }
    
    document.addjoin.submit();
    
   }

