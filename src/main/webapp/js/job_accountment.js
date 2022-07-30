let didScroll;
let lastScrollTop = 0;
let delta = 70;
let navHeight = $('nav').outerHeight();


$(window).scroll(function (event) {
    didScroll = true;
});

setInterval(function () {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 400);

function hasScrolled() {
    var st = $(this).scrollTop();

    if (Math.abs(lastScrollTop - st) <= delta)
        return;

    if (st > lastScrollTop && st > navHeight) {
        $('nav').stop().animate({
            top: ["-20px", "swing"]
        }, 400).promise();
    } else {
        if (st + $(window).height() < $(document).height()) {
            $('nav').stop().animate({
                top: ["-130px", "swing"]
            }, 400).promise();
        }
    }

    lastScrollTop = st;
}


// 지도 Library
$(function(){
	var container = document.getElementById('map');
	var address = document.getElementById('area').value;
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	}
	
	var map = new kakao.maps.Map(container, options);
	var places = new kakao.maps.services.Places();
	
	
	var callback = function(result, status) {
    	if (status === kakao.maps.services.Status.OK) {
        console.log(result);
    	}
	};

	places.keywordSearch(address, callback);
});

