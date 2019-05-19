$(function(){
    // 
    var duration = 300;

    // aside ----------------------------------------
    var $aside = $('.page-main > aside');
    var $asidButton = $aside.find('.qq')
        .on('click', function(){
            $aside.toggleClass('open');
            if($aside.hasClass('open')){
                $aside.stop(true).animate({left: '-70px'}, duration, 'easeOutBack');
                $('.img_bg').toggleClass('img_hide');
                $('.qq').toggleClass('opened');
                $('.qq').removeClass('qq');
                $asidButton.find('img').attr('src', 'close.png');
            }else{
                $aside.stop(true).animate({left: '-450px'}, duration, 'easeInBack');
                $('.img_bg').removeClass('img_hide');
                $('.opened').toggleClass('qq');
                $('.opened').removeClass('opened');               
                $asidButton.find('img').attr('src', 'menu.png');
            };
        });

});
$(".open_log").click(function(){
		$(".login_wrap").toggleClass("login_wrap_up");
		              
    })



   $('body').click(function(e) {
	var target = $(e.target);
   if(!target.is('.login_wrap *') && !target.is('.open_log*'))
      
         $(".login_wrap").removeClass("login_wrap_up");
     
      
});

$('#signUpBtn').click(function() {
    $('#main').toggleClass('singUpActive');
    $('#main').removeClass('loginActive');
});

$("#loginBtn").click(function() {
    $('#main').toggleClass('loginActive');
    $('#main').removeClass('singUpActive');
});