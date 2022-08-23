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


/* 학점 숫자 소수점 허용*/ 
function isNumberKey(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
    	return false;
	// Textbox value    
	var _value = event.srcElement.value;    
	// 소수점(.)이 두번 이상 나오지 못하게
	var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
	if (_pattern0.test(_value)) {
	    if (charCode == 46) {
	        return false;
        }
    }
    // 1의 자리 숫자이면 .만 입력가능
    var _pattern1 = /^\d{1}$/; // 현재 value값이 1자리 숫자이면 . 만 입력가능
    if (_pattern1.test(_value)) {
        if (charCode != 46) {
            alert("4.5 이하의 숫자만 입력가능합니다");
            return false;
        }
    }
    // 소수점 둘째자리까지만 입력가능
    var _pattern2 = /^\d*[.]\d{2}$/; // 현재 value값이 소수점 둘째짜리 숫자이면 더이상 입력 불가
    if (_pattern2.test(_value)) {
        alert("소수점 둘째자리까지만 입력가능합니다.");
        return false;
    }  
    return true;
}

//0~4.5 범위
$(document).on("keyup", "input[name^=grade]", function() {
    var val= $(this).val();
    if(val < 0 || val > 4.5) {
        alert("0~4.5 범위로 입력해 주십시오.");
        $(this).val('');
    }
});

/* 추가버튼*/
$(function() {
	var addEduBtn = document.getElementById("addEducation");
	var addCarBtn = document.getElementById("addCareer");
	var addLicBtn = document.getElementById("addLicense");
	var addPortBtn = document.getElementById("addPortfolio");
	
	addEduBtn.addEventListener('click', function() {
    	$('#education').append($('#hideEduWrap').html());
	})
	
	addCarBtn.addEventListener('click', function() {
    	$('#career').append($('#hideCarWrap').html());
	})
	
	addLicBtn.addEventListener('click', function() {
    	$('#license').append($('#hideLicWrap').html());
	})
	
	addPortBtn.addEventListener('click', function() {
    	$('#portfolio').append($('#hidePortWrap').html());
	})
});

function delForm(obj){
    var div = $(obj).parent().parent();
    //라인 삭제
    div.remove();
}