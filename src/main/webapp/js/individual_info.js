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

function modifyChk() {
	if($('#checkPwWrap').css("display") == "none") {
		$('#checkPwWrap').css("display", "flex");
		$('#password').val('');
	} else if(document.indiInfoForm.password.value == "") {
		alert('비밀번호를 입력해 주세요.');
		document.indiInfoForm.password.focus();
	} else {
		document.indiInfoForm.action = "individual_modify";
		document.indiInfoForm.method = "get";
		document.indiInfoForm.submit();
	}
}

function deleteChk() {
	document.indiInfoForm.action = "individualInfo";
	document.indiInfoForm.method = "post";
	document.indiInfoForm.submit();
}