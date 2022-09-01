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
					career.innerHTML = "<span class='cKey'>" + this.value + "년↑</span>";
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