$(function(){
    let num = document.documentElement.scrollWidth
    if(num <= 1220){
        $("header").css({"width":"100vw"})
    } else {
        $("header").css({"width":"1220px"})
    }
    if(num <= 1220){
        $("#menu-bar").css({"width":"100vw"})
    } else {
        $("#menu-bar").css({"width":"1220px"})
    }
    if(num <= 1220){
        $(".btn-sel").css({"width":"100vw"})
    } else {
        $(".btn-sel").css({"width":"1220px"})
    }
    if(num <= 1220){
        $(".btn-res").css({"width":"100vw"})
    } else {
        $(".btn-res").css({"width":"1220px"})
    }
    $(window).resize(function(){
        let number = document.documentElement.scrollWidth
    if(number <= 1220){
        $("header").css({"width":"100vw"})     
    } else {
        $("header").css({"width":"1220px"})
    }
    if(number <= 1220){
        $("#menu-bar").css({"width":"100vw"})     
    } else {
        $("#menu-bar").css({"width":"1220px"})
    }
    if(number <= 1220){
        $(".btn-sel").css({"width":"100vw"})     
    } else {
        $(".btn-sel").css({"width":"1220px"})
    }
    if(number <= 1220){
        $(".btn-res").css({"width":"100vw"})
    } else {
        $(".btn-res").css({"width":"1220px"})
    }
    });
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
});


$(function() {
    $('.btn').click( function() {
        if( $(this).html() == '선택' ) {
        $(this).html('취소');
        }
        else {
        $(this).html('선택');
        }
    });
    $('.btn').click( function() {
        if( $(this).html() == '선택' ) {
        $(this).css('background', '#A5E374');
        $(this).css('color', 'white');
        }
        else {
        $(this).css('background', '#D6D6D6');
        $(this).css('color', '#858585');
        }
    });
    });
    