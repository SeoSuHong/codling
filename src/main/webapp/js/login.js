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
      $(".per_log").show()
      $(".com_log").hide()
    })
    $(".a_com").click(function(){
      $(".per_log").hide()
      $(".com_log").show()
      $(".com_log").prop("display","block")
    })
    });