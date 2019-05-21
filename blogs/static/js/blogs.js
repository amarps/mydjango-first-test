$(document).ready(function() {
	var navbar = $(".navbar");
	var content = $("#content");
	var content1 = $("#content1");
	var pos = navbar.position();
	$(window).scroll(function() {
		var windowpos = $(window).scrollTop();
		if (windowpos >= pos.top & windowpos <=60) {
			navbar.removeClass("bg-dark");
			navbar.removeClass("navbar-dark");
			navbar.addClass("navbar-light");
		} else {
			navbar.addClass("bg-dark");
			navbar.addClass("navbar-dark");
			navbar.removeClass("navbar-light");
		}
	});
});