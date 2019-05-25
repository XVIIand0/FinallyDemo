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

$(".label_pass").mousedown(function(e){ //点击鼠标就算不松开也会触发事件
     $(this).mousemove(function(e){  //在此作用域中不断移动获取XY坐标
         document.title=e.pageX+'---'+e.pageY
     });
     $(".sing_pass").attr("type","text");
     $(".label_pass").removeClass('fa-eye-slash');
      $(".label_pass").addClass('fa-eye');

 });
$(".label_pass").mouseup(function(){  //松开鼠标左键触发事件
     $(this).unbind('mousemove');
     $(".sing_pass").attr("type","password");
     $(".label_pass").addClass('fa-eye-slash');
      $(".label_pass").removeClass('fa-eye');
       //解绑之前的mousemove事件
 });
