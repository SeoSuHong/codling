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
var address = document.getElementById('area').value; // 회사 주소
var corpName = document.getElementById('corpName').value; // 회사 이름
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도 생성    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색
geocoder.addressSearch(address, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시
       var marker = new kakao.maps.Marker({
           map: map,
           position: coords
       });

       // 인포윈도우로 장소에 대한 설명을 표시
       var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">' + corpName + '</div>'
       });
       infowindow.open(map, marker);

       // 지도의 중심을 결과값으로 받은 위치로 이동
       map.setCenter(coords);
    } 
});