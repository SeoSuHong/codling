$(function() {
    $('.a_per').click( function() {
        $(this).css('background','#A5E374');
        $(this).css('color','white');
        $('.a_com').css('background','#F0F0F0');
        $('.a_com').css('color','#858585');
    });
    $('.a_com').click( function() {
        $(this).css('background','#A5E374');
        $(this).css('color','white');
        $('.a_per').css('background','#F0F0F0');
        $('.a_per').css('color','#858585');
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
//엔터시 로그인
$(function() {
	$("#password").keypress(function (e){
		if(e.keyCode === 13){
			perCheck();
		}
	});
	
	$("#com-password").keypress(function (e){
		if(e.keyCode === 13){
			comCheck();
		}
	});
});
//로그인 API

window.Kakao.init("370fa568d4acbeb9115655e735792c45");

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope:'profile_nickname, profile_image, account_email, gender',
                success: function(authObj) {
                    console.log(autoObj);
                    window.Kakao.API.request({
                        url:'/v2/user/me', 
                        success: res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                        }
                    });
                }
            })
        }

//처음 실행하는 함수
	function init() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
			options = new gapi.auth2.SigninOptionsBuilder();
			options.setPrompt('select_account');
	        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
			options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
	        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
	        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
			gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
		})
	}
	
	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
	    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
			url: 'https://people.googleapis.com/v1/people/me'
	        // key에 자신의 API 키를 넣습니다.
			, data: {personFields:'birthdays', key:'AIzaSyCVu2ya6dVaACUjx4cHYS3Y43UFvNkSlj0', 'access_token': access_token}
			, method:'GET'
		})
		.done(function(e){
	        //프로필을 가져온다.
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		})
		.fail(function(e){
			console.log(e);
		})
	}
	function onSignInFailure(t){		
		console.log(t);
	}
	
	var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "VbyRMVals_lVgeC5hpie", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
					callbackUrl: "http://localhost:8090/index.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
					isPopup: false,
					callbackHandle: true
				}
			);	
		
		naverLogin.init();
		
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
		    		
					console.log(naverLogin.user); 
		    		
		            if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
		
		
		var testPopUp;
		function openPopUp() {
		    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp(){
		    testPopUp.close();
		}
		
		function naverLogout() {
			openPopUp();
			setTimeout(function() {
				closePopUp();
				}, 1000);
		}