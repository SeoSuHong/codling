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
});

function modifyChk() {
	if($('#checkPwWrap').css("display") == "none") {
		$('#checkPwWrap').css("display", "flex");
		$('#password').val('');
	} else if(document.corpInfoForm.password.value == "") {
		alert('비밀번호를 입력해 주세요.');
		document.corpInfoForm.password.focus();
	} else {
		document.corpInfoForm.action = "corporation_modify";
		document.corpInfoForm.method = "get";
		document.corpInfoForm.submit();
	}
}

function deleteChk() {
	if($('#checkPwWrap').css("display") == "none") {
		$('#checkPwWrap').css("display", "flex");
		$('#password').val('');
	} else if(document.corpInfoForm.password.value == "") {
		alert('비밀번호를 입력해 주세요.');
		document.corpInfoForm.password.focus();
	} else {
		document.corpInfoForm.action = "individualInfo";
		document.corpInfoForm.method = "post";
		document.corpInfoForm.submit();
	}
}