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

// 경력체크시 alert창띄우기

