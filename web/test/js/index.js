
	$('#tab-2').on('click', function() {
		$('.product_img').toggleClass('hide_product'); 
		
		$('.tab-pane').removeClass('current'); 

		$(this).addClass('current');
		$('#' + tabId).addClass('current');
	});
var $wrap = $('#main');
var $signUpBtn = $wrap.find('#signUpBtn');
var $loginBtn = $wrap.find("#loginBtn");

$signUpBtn.on('click', function() {
    $wrap.addClass('singUpActive');
    $wrap.removeClass('loginActive');
});

$loginBtn.on('click', function() {
    $wrap.addClass('loginActive');
    $wrap.removeClass('singUpActive');
});
$(document).ready(function(){ 
    $('.tab-a').click(function(){  
      $(".tab").removeClass('tab-active');
      $(".tab[data-id='"+$(this).attr('data-id')+"']").addClass("tab-active");
      $(".tab-a").removeClass('active-a');
      $(this).parent().find(".tab-a").addClass('active-a');
     });
});
