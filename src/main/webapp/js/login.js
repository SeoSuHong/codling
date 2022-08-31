$(function() {
    $('.a_per').click( function() {
        $(this).css('background','#A5E374');
        $(this).css('color','white');
        $('.a_com').css('background','#F0F0F0');
        $('.a_com').css('color','#858585');

		$('#com-id').val('');
		$('#com-password').val('');
    });
    $('.a_com').click( function() {
        $(this).css('background','#A5E374');
        $(this).css('color','white');
        $('.a_per').css('background','#F0F0F0');
        $('.a_per').css('color','#858585');

		$('#per-id').val('');
		$('#password').val('');
    });
});

$(function() {
    $(".com_log").hide()
    $(".a_per").click(function(){
      $(".per_log").show();
      $(".com_log").hide();
    })
    $(".a_com").click(function(){
      $(".per_log").hide();
      $(".com_log").show();
      $(".com_log").prop("display","block");
    })
});

// 개인회원 로그인 공백 체크
function perCheck() {
	if(document.perLogFrm.perId.value == "") {
		alert("아이디를 입력해 주세요.");
		document.perLogFrm.perId.focus();
	} else if(document.perLogFrm.perPassword.value == "") {
		alert("패스워드를 입력해 주세요.");
		document.perLogFrm.perPassword.focus();
	} else {
		document.perLogFrm.submit();
	}
}

// 기업회원 로그인 공백 체크
function comCheck() {
	if(document.comLogFrm.comId.value == "") {
		alert("아이디를 입력해 주세요.");
		document.comLogFrm.comId.focus();
	} else if(document.comLogFrm.comPassword.value == "") {
		alert("패스워드를 입력해 주세요.");
		document.comLogFrm.comPassword.focus();
	} else {
		document.comLogFrm.submit();
	}
}