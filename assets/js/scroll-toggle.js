$(function () {
    var lastScrollTop = 0;
    var delta = 10;
    var $document = $(document);
    var $window = $(window);
    var $nav = $('#nav')
    var navbarHeight = $nav.outerHeight();
    var trapped = false;
    var trapTimer;

    $window.on('hashchange', function(){
        trapped = true;

        if(trapTimer){
            clearTimeout(trapTimer);
        }

        trapTimer = setTimeout(function(){
            trapped = false;
        }, 300);
    })

    $window.scroll(function (event) {
        setTimeout(hasScrolled,
            // make sure `hashchange` event go first
            0);
    });

    function hasScrolled() {
        var st = $window.scrollTop();
        if(trapped){
            lastScrollTop = st;
            return;
        }

        // Make sure they scroll more than delta
        if (Math.abs(lastScrollTop - st) <= delta)
            return;

        // If they scrolled down and are past the navbar, add class .nav-up.
        // This is necessary so you never see what is "behind" the navbar.
        if (st > lastScrollTop && st > navbarHeight) {
            // Scroll Down
            $nav.addClass('nav-hide');
        } else {
            // Scroll Up
            if (st + $window.height() < $document.height()) {
                $nav.removeClass('nav-hide');
            }
        }

        lastScrollTop = st;
    }
})