window.onscroll = function() {scrollFunction()};

function scrollFunction(){
    if(document.body.scrollTop > 250 || document.documentElement.scrollTop > 250){
        document.getElementById("scroll-header").style.top = "0";
    }else{
        document.getElementById("scroll-header").style.top = "-130px";
    }
}

// search 보이기
function showSearch() {
	$('#searchHide').animate({height:"67px"}, 300);
}

// search 숨기기
function hideSearch() {
	$('#keyList').css({"border-bottom":"none"});
	$('#keyList').stop().animate({height:"0px"}, 500);
	$('#searchHide').stop().animate({height:"0px"}, 300);
}

// searchList 보이기
function showSearchList() {
	$('#keyList').css({"border-bottom":"3px solid #A5E374"});
	$('#keyList').stop().animate({height:"300px"}, 500);
}

// searchList 숨기기
function hideSearchList() {
	$('#keyList').css({"border-bottom":"none"});
	$('#keyList').stop().animate({height:"0px"}, 500);
}

// searchList 체크
$(function() {
	// 지역 체크 시
	var areas = document.getElementsByName('area');
	var area = document.querySelector('.a');

	for(var i = 0; i < areas.length; i++) {
		areas[i].addEventListener('change', function() {
			if(this.checked) {
				if(area.firstChild == null) {
					area.innerHTML += "<span class='aKey'>" + this.value + "</span>";
				} else {
					area.innerHTML += "<span class='aKey'> · " + this.value + "</span>";
				}
			} else {
				var keys = document.getElementsByClassName('aKey');
				for(var j = 0; j < keys.length; j++) {
					var txt = keys[j].innerText;
					
					if(txt.indexOf(this.value) != -1) {
						keys[j].remove();
					}
				}
			}
		})
	}
	
	// 분야 체크 시
	var fields = document.getElementsByName('field');
	var field = document.querySelector('.f');

	for(var i = 0; i < fields.length; i++) {
		fields[i].addEventListener('change', function() {
			if(this.checked) {
				if(field.firstChild == null) {
					field.innerHTML += "<span class='fKey'>" + this.value + "</span>";
				} else {
					field.innerHTML += "<span class='fKey'> · " + this.value + "</span>";
				}
			} else {
				var keys = document.getElementsByClassName('fKey');
				for(var j = 0; j < keys.length; j++) {
					var txt = keys[j].innerText;
					
					if(txt.indexOf(this.value) != -1) {
						keys[j].remove();
					}
				}
			}
		})
	}
	
	// 경력 체크 시
	var careers = document.getElementsByName('career');
	var career = document.querySelector('.c');
	
	for(var i = 0; i < careers.length; i++) {
		careers[i].addEventListener('change', function() {
			if(this.checked) {
				careers.forEach((c) => {c.checked = false;})
				this.checked = true;
				
				if(this.value == '신입')
					career.innerHTML = "<span class='cKey'>" + this.value + "</span>";
				else
					career.innerHTML = "<span class='cKey'>" + this.value + "년</span>";
			} else {
				career.innerHTML = "";
			}
		})
	}
	
	// 급여 체크 시
	var pays = document.getElementsByName('pay');
	var pay = document.querySelector('.p');
	
	for(var i = 0; i < pays.length; i++) {
		pays[i].addEventListener('change', function() {
			if(this.checked) {
				pays.forEach((p) => {p.checked = false;})
				this.checked = true;
				
				var key = this.nextSibling.nextSibling;
				pay.innerHTML = "<span class='pKey'>" + key.innerText + "↑</span>";
			} else {
				pay.innerHTML = "";
			}
		})
	}
})

$(function() {

    var idx = 1;
    var marginPx = 1020;
    var rightMarginPx = 1020;
    var leftMarginPx = -1020;

    var marginVal = document.querySelector('.advertisement').children.length * marginPx;
    $(".leftArrow").click(function() {
        if(leftMarginPx >= 0) {
            $(".advertisement").stop().animate({"margin-left":"-" + leftMarginPx + "px"}, 500, function() {
                leftMarginPx -= marginPx;
                rightMarginPx -= marginPx;
                idx --;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }else{
            $(".advertisement").stop().animate({"margin-left":"-" + rightMarginPx*5 + "px"}, 500, function() {
                leftMarginPx += marginPx*5;
                rightMarginPx += marginPx*5;
                idx +=5;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }
    })
    
    $(".rightArrow").click(function() {
        if(marginVal > rightMarginPx) {
            $(".advertisement").stop().animate({"margin-left":"-" + rightMarginPx + "px"}, 500, function() {
                rightMarginPx += marginPx;
                leftMarginPx += marginPx;
                idx ++;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }else{
            $(".advertisement").stop().animate({"margin-left": "0px"}, 500, function() {
                rightMarginPx -= marginPx*5;
                leftMarginPx -= marginPx*5;
                idx -=5;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }
    })
    //이미지 자동 슬라이드 호버시 슬라이드 멈춤
    var timer = setInterval(fnSlide,5000);
    $(".pow_box").hover(function(){
        clearInterval(timer);
    },function(){
        timer = setInterval(fnSlide,5000);
    });
    function fnSlide() {
       
        if(marginVal > rightMarginPx) {
            $(".advertisement").stop().animate({"margin-left":"-" + rightMarginPx + "px"}, 500, function() {
                rightMarginPx += marginPx;
                leftMarginPx += marginPx;
                idx ++;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }else{
            $(".advertisement").stop().animate({"margin-left": "0px"}, 500, function() {
                rightMarginPx -= marginPx*5;
                leftMarginPx -= marginPx*5;
                idx -=5;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
            })
        }
    };


    // 바 클릭
    var bar = document.getElementById('btn_bar').children;
    for(var i = 0; i < bar.length; i++) {
        const bar_idx = i;
        bar[bar_idx].addEventListener('click', function() {
            $(".advertisement").stop().animate({"margin-left":"-" + bar_idx*1020 + "px"}, 500, function() {
                idx = bar_idx + 1;
                $(".apply_bar").css({"background-color":"#D9D9D9"});
                $(".apply_bar:nth-child(" + idx + ")").css({"background-color":"#A5E374"});
                rightMarginPx = idx * marginPx;
                leftMarginPx = -1020 + ((idx-1) * marginPx);
            });
        })
    }
});
//스크롤 마이메뉴 다운드롭
$(function(){
    $("#scroll-profile-hover").hide();

        $("#scroll-hover-box").hover(function() {
            $("#scroll-profile-hover").stop().slideDown();
        },function(){
            $("#scroll-profile-hover").stop().slideUp();
        });
        $("#scroll-profile-hover").hover(function() {
            $(this).stop().slideDown();
        },function(){
            $(this).stop().slideUp();
    });
});
//top 마이메뉴 다운드롭
$(function(){
    $("#profile-hover").hide();

        $("#hover-box").hover(function() {
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


function showCount(no) {
    if($("#" + no).css("display") == "none") {
    	$("#" + no).css('display', 'block');
	}
}

function hideCount(no) {
    if($("#" + no).css("display") == "block") {
    	$("#" + no).css('display', 'none');
	}
}

function topSearch() {
	if(document.topSearchForm.search.value == '') {
		alert('검색어를 입력해 주세요');
		document.topSearchForm.search.focus();
	} else {
		document.topSearchForm.submit();
	}
}

function search() {
	document.searchForm.submit();
}