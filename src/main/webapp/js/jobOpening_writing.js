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
}
function delForm(obj){
    var div = $(obj).parent();
    //라인 삭제
    div.remove();
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

// 경력 체크 시 경력 input readonly 해제
$(document).ready(function(){
	let checkList = $(".careerChk");
	let careerList = $(".career_year");
	
	for(let i = 0; i < checkList.length; i++) {
		const idx = i;
		checkList[idx].addEventListener('change', function() {
			if($(checkList[idx]).is(":checked")) {
				$(careerList[idx]).attr('readonly', false);
				$(careerList[idx]).focus();
			} else {
				$(careerList[idx]).val('');
				$(careerList[idx]).attr('readonly', true);
			}
		});
	}
	$("#add").click(function() {
		let checkList = $(".careerChk");
		let careerList = $(".career_year");
		
		for(let i = 0; i < checkList.length; i++) {
			const idx = i;
			checkList[idx].addEventListener('change', function() {
				if($(checkList[idx]).is(":checked")) {
					$(careerList[idx]).attr('readonly', false);
					$(careerList[idx]).focus();
				} else {
					$(careerList[idx]).val('');
					$(careerList[idx]).attr('readonly', true);
				}
			});
		}
	});
});

function insertJobOpeningChech() {
	
}