var app = new Vue({
  el: '#app',
  data(){
    return{
      alist : "oink",
      blist : "ounk",
      asets : "ihih",
      bsets : "ahah",
    }
  },
  computed:{
  	c_alist(){ return this.alist.trim().split(",")},
    c_blist(){ return this.blist.trim().split(",")},
    c_asets(){ return this.asets.trim().split(",")},
    c_bsets(){ return this.bsets.trim().split(",")},
  	l_a_not_in_b(){
  		res = [];
  		for (var i = 1; i <= this.c_alist.length; i++) {
  			res.push(i)
  		}
  		return res
  	}
  },
  delimiters: ['~~','~~']
})

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