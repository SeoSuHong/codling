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

function schoolSelect(obj, opt) {
	var $table = $(obj).parents('table');

	if(opt === '고등학교') {
		$table.children().children(":last").hide();
	} else {
		$table.children().children(":last").show();
	}
}

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

var xhr;
var checkFirst = loopSend = false;
var lastKeyword = "";
//Timeout을 1초로 걸었다. 일정 단어 완성 뒤 검색어를 만들어 검색하기 위해서 이다.
function keyDown() {
		let stackWrap = document.getElementById("stackWrap");
		let height = stackWrap.clientHeight - 80;
		$(stackWrap).css('height', height);

    if (checkFirst == false) {
    	//1초뒤 sendKeyword() 수행
        setTimeout("sendKeyword()", 300);
        loopSend = true;
    }
}
	
//Ajax를 활용하여 suggest.jsp 에게 요청을 하는 함수이다. 넘겨주는 값은 keyword이며 Post방식으로 전송한다.
function sendKeyword() {
    if (loopSend == false)
        return;
    else {
        var keyWord = document.resumeForm.keyword.value;

        //키워드가 hide 함수를 불러 검색어 창 숨기기
        if (keyWord === "") {
            lastKeyword = "";
            hide("suggest");
        //검색어가 있는 경우 suggest.jsp에게 값 요청
        } else if (keyWord !== lastKeyword) {
            lastKeyword = keyWord;

            var para = "keyword=" + keyWord;
            
            xhr = new XMLHttpRequest();
            xhr.open("post", "suggest", true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        process();
                    } else {
                        alert("요청실패1" + xhr.status);
                    }
                }
            }
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send(para);
        }
    }
}

//Ajax의 결과를 받고 처리하는 공간이다.
//Ajax에게 받은 Data(이름)에 링크를 건 뒤 Output-Suggest에 보여지는 형식이다.
function process() {
    var data = xhr.responseText;
    var result = data.split("|");
    var tot = result[0];
    if (tot > 0) {
        var datas = result[1].split(",");
        var stack = "";
        //각각의 이름에 링크 걸기 각각의 이름은 func(자기이름)이 들어가 있다.
        for (var i = 0; i < datas.length; i++) {
            stack += "<li><a href=\"javascript:func('" + datas[i] + "')\">" + datas[i] + "</a></li>";
        }
        //Output-Suggest에 결과 보여주기
        var listView = document.getElementById("suggest").innerHTML = stack;
        show("suggest");
    }

}

//이름 클릭시 Output-Selected 에 값 넣기. Suggest창 숨기기
function func(reData) {
	$('#stacks').append('<span class="st"><div name="stackList" class="stack">' + reData + '</div><span onclick="parentElement.remove(this)" style="cursor:pointer"> X </div></div>');
	
    loopSend = checkFirst = false;
    lastKeyword = "";
    hide("suggest");

    resumeForm.keyword.value="";

}

//Suggest 창 숨기는 함수
function hide(ele) {
    var e = document.getElementById(ele);
    if (e) e.style.display = "none";

	let stackWrap = document.getElementById("stackWrap");
	$(stackWrap).css('height', 'auto');
}

//Suggest 창 보이게 속성 바꾸는 함수
function show(ele) {
    var e = document.getElementById(ele);
    if (e) e.style.display = "";
}

// 포트폴리오 URL추가 버튼 클릭 시
function addUrl(obj) {
	var addNode = "<br><input name='url' placeholder=' github.com/SeoSuHong/codling'> <input type='button' class='delUrlBtn' value='삭제' onclick='delUrl(this)'>";
	var addPos = obj.parentNode;
	$(addPos).append(addNode);
	
	addPos.childNodes[1].value++;
}

// 포트폴리오 URL삭제 버튼 클릭 시
function delUrl(obj) {
	obj.parentNode.childNodes[1].value--;
	
	var br = obj.previousElementSibling.previousElementSibling;
	var input = obj.previousElementSibling;
	br.remove();
	input.remove();
	obj.remove();
}

// submit
function resumeChk() {
	// 이력서 제목
	if(document.resumeForm.title.value == "") {
		alert("이력서 제목을 입력해 주세요.");
		document.resumeForm.title.focus();
		return;
	}
	
	// 학력사항
	var schools = document.getElementsByName('school');
	var schoolNames = document.getElementsByName('schoolName');
	var schoolStartDates = document.getElementsByName('schoolStartDate');
	var schoolEndDates = document.getElementsByName('schoolEndDate');
	var statuses = document.getElementsByName('status');
	var departments = document.getElementsByName('department');
	
	for(var i = 0; i < schools.length - 1; i++){
		if(schools[i].value == "") {
			alert("학력을 선택해 주세요.");
			schools[i].focus(); return;
		}
		if(schoolNames[i].value == "") {
			alert("학교명을 입력해 주세요.");
			schoolNames[i].focus(); return;
		}
		if(schoolStartDates[i].value == "") {
			alert("재학기간을 입력해 주세요.");
			schoolStartDates[i].focus(); return;
		}
		if(schoolEndDates[i].value == "") {
			alert("재학기간을 입력해 주세요.");
			schoolEndDates[i].focus(); return;
		}
		if(statuses[i].value == "") {
			alert("학력상태를 선택해 주세요.");
			statuses[i].focus(); return;
		}
		if(departments[i].value == "") {
			alert('학과를 입력해 주세요.');
			departments[i].focus(); return;
		}
	}
	
	// 스택
	var stacks = document.getElementsByName('stackList');
	var stack = "";
	if(stacks.length === 0) {
		alert('기술스택을 1가지 이상 입력해 주세요.');
		document.resumeForm.keyword.focus();
	} else {
		for(var i = 0; i < stacks.length; i++) {
			if(i < stacks.length - 1)
				stack += stacks[i].innerText + "/";
			else
				stack += stacks[i].innerText;
		}
		document.resumeForm.stacks.value = stack;
	}
	
	
	// 경력사항
	var prev_companies = document.getElementsByName('prev_company');
	var tenureStartDates = document.getElementsByName('tenureStartDate');
	var tenureEndDates = document.getElementsByName('tenureEndDate');
	var positions = document.getElementsByName('position');
	var career_departments = document.getElementsByName('career_department');
	
	for(var i = 0; i < prev_companies.length - 1; i++) {
		if(prev_companies[i].value != "") {
			if(tenureStartDates[i].value == "") {
				alert('재직기간을 입력해 주세요.');
				tenureStartDates[i].focus(); return;
			}
			if(tenureEndDates[i].value == "") {
				alert('재직기간을 입력해 주세요.');
				tenureEndDates[i].focus(); return;
			}
			if(positions[i].value == "") {
				alert('직급/직책을 입력해 주세요.')
				positions[i].focus(); return;
			}
			if(career_departments[i].value == "") {
				alert('근무부서를 입력해 주세요.')
				career_departments[i].focus(); return;
			}
		}
	}
	
	// 자격증 내역
	var names = document.getElementsByName("name");
	var agencies = document.getElementsByName("agency");
	var passes = document.getElementsByName("pass");
	var acquireDates = document.getElementsByName("acquireDate");
	
	for(var i = 0; i < names.length - 1; i++) {
		if(names[i].value != "") {
			if(agencies[i].value == "") {
				alert("발행처/기관을 입력해 주세요.");
				agencies[i].focus; return;
			}
			if(passes[i].value == "") {
				alert("합격구분을 선택해 주세요.");
				passes[i].focus; return;
			}
			if(acquireDates[i].value == "") {
				alert("취득일을 입력해 주세요.");
				acquireDates[i].focus; return;
			}
		}
	}
	
	// 포트폴리오
	var portfolioNames = document.getElementsByName('portfolioName');
	var files = document.getElementsByName('file');
	
	for(var i = 0; i < portfolioNames.length - 1; i++) {
		if(files[i].value != "")
			files[i].nextElementSibling.value = files[i].files.length;
		else
			files[i].nextElementSibling.value = 0;
	}
	
	document.resumeForm.submit();
}