$(function(){
    let num = document.documentElement.scrollWidth
    if(num <= 1000){
        $("header").css({"width":"98vw"})
    } else {
        $("header").css({"width":"1000px"})
    }

    $(window).resize(function(){
        let number = document.documentElement.scrollWidth
        if(number <= 1000){
        $("header").css({"width":"98vw"})     
    } else {
        $("header").css({"width":"1000px"})
    }
    })

    $("#btn_phone").click(function(){
        $("#btn_phone").css({"background-color":"#A5E374", "color":"white", "border":"2px solid #87cc52"})
        $("#btn_email").css({"background-color":"white", "color":"#373F57", "border":"2px solid #929292"})
        $("#chk_phone").show();
        $("#chk_email").hide();
    })

    $("#btn_email").click(function(){
        $("#btn_email").css({"background-color":"#A5E374", "color":"white", "border":"2px solid #87cc52"})
        $("#btn_phone").css({"background-color":"white", "color":"#373F57", "border":"2px solid #929292"})
        $("#chk_phone").hide();
        $("#chk_email").show();
    })
})

// 휴대폰 번호로 찾기 인증확인 버튼 클릭 시
function checkFindPhone() {
    let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

    if(document.findPhoneForm.name.value == "") {
        alert("이름을 입력해 주세요.");
        document.findPhoneForm.name.focus();
    } else if(document.findPhoneForm.phoneNum.value == "") {
        alert("휴대폰 번호를 입력해 주세요.");
        document.findPhoneForm.phoneNum.focus();
    } else if (!regPhone.test(document.findPhoneForm.phoneNum.value)) { 
        alert("올바른 휴대폰 번호를 입력해 주세요.");
        document.findPhoneForm.phoneNum.focus();
    } else if(document.findPhoneForm.chk.value == "") {
        alert("인증번호를 입력해 주세요.");
        document.findPhoneForm.chk.focus();
    }
}

// 이메일 주소로 찾기 인증확인 버튼 클릭 시
function checkFindEmail() {
    let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    if(document.findEmailForm.name.value == "") {
        alert("이름을 입력해 주세요.");
        document.findEmailForm.name.focus();
    } else if(document.findEmailForm.email.value == "") {
        alert("이메일 주소를 입력해 주세요.");
        document.findEmailForm.email.focus();
    } else if(!regEmail.test(document.findEmailForm.email.value)) {
        alert("올바른 이메일 주소를 입력해 주세요.");
        document.findEmailForm.email.focus();
    } else if(document.findEmailForm.chk.value == "") {
        alert("인증번호를 입력해 주세요.");
        document.findEmailForm.chk.focus();
    }
}