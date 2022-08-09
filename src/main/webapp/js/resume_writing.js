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
/*학력추가 삭제버튼*/
function addForm() {
    $('#problem_list').append($('#edu_level_info').html());
    check_click();
}
function delForm(obj){
    var div = $(obj).parent();
    //console.log(div);
    //라인 삭제
    div.remove();
}
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
/* 경력사항 추가 삭제 버튼 */
function addForm2() {
    $('#problem_list2').append($('#experienced_info').html());
    check_click();
}
function delForm2(obj){
    var div = $(obj).parent();
    //console.log(div);
    //라인 삭제
    div.remove();
}
/* 자격증 추가 삭제 버튼 */
function addForm3() {
    $('#problem_list3').append($('#license_info').html());
    check_click();
}
function delForm3(obj){
    var div = $(obj).parent();
    //console.log(div);
    //라인 삭제
    div.remove();
}
/* 포트폴리오 추가 삭제 버튼 */
function addForm4() {
    $('#problem_list4').append($('#portfolio_info').html());
    check_click();
}
function delForm4(obj){
    var div = $(obj).parent();
    //console.log(div);
    //라인 삭제
    div.remove();
}
//첨부파일, url중에 선택
// $(function() {
//     $("#company").hide()
//     $("#personButton").click(function(){
//       $("#personButton").css({"background-color": "#A5E374", "color": "white"})
//       $("#companyButton").css({"background-color": "#F0F0F0", "color": "#858585"})
//       $("#individual").show()
//       $("#company").hide()
//     })
//     $("#companyButton").click(function(){
//       $("#companyButton").css({"background-color": "#A5E374", "color": "white"})
//       $("#personButton").css({"background-color": "#F0F0F0", "color": "#858585"})
//       $("#individual").hide()
//       $("#company").show()
//       $("#company").prop("display","block")
//     })
// });
//첨부파일명 가져오기
// $(document).ready(function(){
//     $('input[type=file]').on('change',function(){
//         if(window.FileReader){
//             var filename = $(this).val().split('/').pop().split('\\').pop();
//            } else {
//             var filename = $(this).val().split('/').pop().split('\\').pop();
//            }
//     });
   
//   });
/* 첨부파일 */
$(document).ready(function(){
    var fileTarget = $('.filebox .upload-hidden');
  
    fileTarget.on('change', function(){  // 값이 변경되면
      if(window.FileReader){  // modern browser
        var filename = $(this)[0].files[0].name;
      } 
      else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
      }
      
      // 추출한 파일명 삽입
      $(this).siblings('.uploadname').val(filename);
    });
  }); 
/////////////////
   $("#file").on('change',function(){
    var fileName = $("#file").val();
    $(".upload_name").val(fileName);
});
  

$(document).ready(function() {
	let urlBtn = $('.urlbtn');
	let fileBtn = $('.filebtn');
	let urlBox = $('.url_box');
	let filebox = $('.file_box');
	
	for(var i = 0; i < urlBtn.length; i++) {
		const idx = i;
		urlBtn[idx].addEventListener('click', function() {
			$(urlBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
	        $(fileBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
	        $(urlBox[idx]).css('display', 'block');
	        $(filebox[idx]).css('display', 'none');
		});
		fileBtn[idx].addEventListener('click', function() {
			$(urlBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
	        $(fileBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
	        $(urlBox[idx]).css('display', 'none');
	        $(filebox[idx]).css('display', 'block');
		});
	}
	
	$('.portfolio_add').click(function() {
		let urlBtn = $('.urlbtn');
		let fileBtn = $('.filebtn');
		let urlBox = $('.url_box');
		let filebox = $('.file_box');
		
		for(var i = 0; i < urlBtn.length; i++) {
			const idx = i;
			urlBtn[idx].addEventListener('click', function() {
				$(urlBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
		        $(fileBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
		        $(urlBox[idx]).css('display', 'block');
		        $(filebox[idx]).css('display', 'none');
			});
			fileBtn[idx].addEventListener('click', function() {
				$(urlBtn[idx]).css({"background-color": "#d6d6d6", "color": "#858585"});
		        $(fileBtn[idx]).css({"background-color": "#A5E374", "color": "white"});
		        $(urlBox[idx]).css('display', 'none');
		        $(filebox[idx]).css('display', 'block');
			});
		}
	});
});

function check(){
	
	$(document).ready(function(){
	let education = $('input[name="education"]');
	
		if(document.resume_Frm.resumetitle.value == ""){
			alert("이력서 제목을 입력해주세요.")
			document.resume_Frm.resumetitle.focus();
			return;
		}
	
	for(var i = 0; i< education.length; i++){
		const idx = i;
		
		if(document.resume_Frm.education[i].value == ""){
			alert("학력을 선택해주세요.")
			document.resume_Frm.education[i].focus();
			return;
			}
		}
		
		if(document.resume_Frm.resumetitle.value == ""){
			alert("이력서 제목을 입력해주세요.")
			document.resume_Frm.resumetitle.focus();
			return;
		}
	
	});
}


  