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