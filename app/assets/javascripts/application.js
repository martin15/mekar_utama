// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery
//= require rails-ujs
//= require popper
//= require bootstrap
//= require_tree .

$(document).ready(function(){
	//Remove outline from links
	$("a").click(function(){
		$(this).blur();
	});

	//When mouse rolls over
	$("li#list-product").mouseover(function(){
    $("li#list-product").css("background", "linear-gradient(to bottom, #332391 0%, #3a2a9a 21%, #3f2fa7 27%,              #4133b1 41%, #442ec9 71%, #553afb 100%) repeat scroll 0 0 rgba(0, 0, 0, 0)");
		//$("ul#parent-list-product").show().animate({queue:false, duration:400, easing: 'easeOutBounce'})
		$("ul#parent-list-product").fadeIn(1);
	  //alert("aaa");
  });

	//When mouse is removed
	$("li#list-product").mouseleave(function(){
//		$("ul#parent-list-product").stop().animate(
//      {queue:false, duration:600, easing: 'easeInBack'//,
//      //complete: function() {$("span.sub-menu").hide()}
//      }
//    )
		$("ul#parent-list-product").fadeOut(500);
    setTimeout(function () {
        $("li#list-product").css("background", "linear-gradient(to bottom, #ff908a 0%, #f65c54 27%, #dd281c 70%, #dc261c 80%,              #db241c 100%) repeat scroll 0 0 rgba(0, 0, 0, 0)");
    }, 200);
    //$("li#list-product").delay(800).css("background", "#linear-gradient(to bottom, #9aff72 0%, #9afd62 27%, #9aed52 70%, #9add42 80%, #9acd32 100%) repeat scroll 0 0 rgba(0, 0, 0, 0)")
	});

  var nav = $('#nav'),
      bars = $('#bars'),
      menu = $('#menu'),
      up = $('#up'),
      prevOffset = 0,
      mainSection = $('.main-section'),
      mainSectionLength = mainSection.length,
      links = $('#menu li'),
      flag = 0,
      flag2 = 0,
      lastI = 100,
      body = $('body');
      myWindow = $(window);
  
  $(".faq-nav a").click(function() {
    $(".faq-nav a").removeClass("active");
    $(this).addClass("active");
  });

  // menu bars on click
  function barsClicked() {
    bars.toggleClass('clicked');
    menu.slideToggle(300);
  }

  bars.on('click', barsClicked);

  // up icon on click
  $('#up').on('click', function () {
      $('html, body').animate({
          scrollTop: 0
      }, {
          duration: 1800,
          easing: 'easeInOutQuint'
      });
  });

  // on resize functions
  myWindow.on('resize', function () {
    if (bars.css('display') === 'block') {
        menu.css('display', 'none');
        bars.removeClass('clicked');
    } else {
        menu.css('display', 'block');
    }
  });

  // change navbar active link while scrolling
  if (flag === 0 && mainSectionLength) {
    flag = 1;
    flag2 = 0;
    for (let i = mainSectionLength - 1; i >= 0; i--) {
        if (myWindow.scrollTop() >= mainSection.eq(i).offset().top) {
            if (i != lastI) {
                links.eq(i + 1).addClass('active').siblings().removeClass('active');
                lastI = i;
            }
            flag2 = 1;
            break;
        }
    }
    if (flag2 === 0) {
        links.eq(0).addClass('active').siblings().removeClass('active');
        lastI = -1;
    }
    flag = 0;
  }

  $('a[href*=\\#]').bind('click', function(e) {
    e.preventDefault(); // prevent hard jump, the default behavior

    var target = $(this).attr("href").replace('/',''); // Set the target as variable

    // perform animated scrolling by getting top-position of target-element and set it as scroll target
    if($('html, body').has(target).length == 0 ){
      window.location.href = $(this).attr("href");
    }else{
      $('html, body').animate({
        scrollTop: $(target).offset().top - 80
      }, 600);
    }

    return false;
  });

});


function is_best_seller_picture(name, p_id, i_id){
  $("#loader_"+name).show();
  if($("#"+name).is(':checked')){
    var bs = true;
  }else{
    var bs = false;
  }
  $.ajax({
    type: "GET",
    url:    "/admin/products/"+p_id+"/product_images/"+i_id+"/set_best_seller", // should be mapped in routes.rb
    data: {is_best_seller: bs},
    datatype:"html", // check more option
    success: function(data) {
      $("#loader_"+name).hide();
    },
    async:   true
  });
}


function zoom_image(el){
  alert($(this).parent().attr('class'))
  $(this)
    .css({
        "display":"none"
//      "transform": "scale(1.1)",
//      "transition": "all 0.5s ease 0s"
    });
  $(this).find("div.product-info > a")
    .css({
      "color": "#f08364"
    })
}

