// 交易評價的送出按下後消失
$('.submit-button').click(function(e) {
var p = $(this).parent();
var form_P2 = p.parent();
var form_name = form_P2.parent();
var parent = $(this).parent(".order-card_bottom");
var review_all = parent.children(".review-all");
var review_board = review_all.children(".review");
var brother_star = parent.children(".star") ;
var stars= brother_star.children(".fas") ;
var brother_review = review_board.children(".product-review");
var review_content = brother_review.val();
$(this).toggleClass('hide');
$.ajax({
                cache: true,
                type: "get",
                url:"addcomment.jsp",
                data:form_name.serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("新增失敗");
                    $(this).toggleClass('hide');
                },
                success: function(data) {
                    alert("新增成功");
                    
brother_review.remove();
review_board.append("<p class='product-review'>"+review_content);
stars.addClass("ov");

                }

            });
});

// 食譜送出按鈕按下後消失
$('.recipe-submit-button').click(function(e) {
$(this).toggleClass('hide');
});

// 會員資料的Tab
function openCity(evt, cityName) {
var i, tabcontent, tablinks;
tabcontent = document.getElementsByClassName("tabcontent");
for (i = 0; i < tabcontent.length; i++) {
tabcontent[i].style.display = "none";
}
tablinks = document.getElementsByClassName("tablinks");
for (i = 0; i < tablinks.length; i++) {
tablinks[i].className = tablinks[i].className.replace(" active", "");
}
document.getElementById(cityName).style.display = 'block';
evt.currentTarget.className += " active";
}

// 上傳會員圖片
function readURL(input){
if(input.files && input.files[0]){
var imageTagID = input.getAttribute("targetID");
var reader = new FileReader();
reader.onload = function (e) {
var img = document.getElementById(imageTagID);
img.setAttribute("src", e.target.result)
}
reader.readAsDataURL(input.files[0]);
}
}




// When the user clicks the button, open the modal 
$(".change-button").click(function(e){
  var openname = $(this).attr("id");
  var af_open = openname.substring(3);
  $(("#Modal"+af_open)).css("display","block");
});
$('.modal').click(function(e) {
  var target = $(e.target);
   if(!target.is('.modal-content *'))
      
         $(".modal").css("display","none");   
});

$(".fa-grin-hearts").mouseover(function(){
	if(!$(this).hasClass("ov")){
	if(!$(this).hasClass("ed")){
	var prea = $(this).prevAll();
	var afta = $(this).nextAll();
	$(this).css("color","yellow");
	afta.css("color","grey");
    prea.css("color","yellow");
}
}
});
$(".fa-grin-hearts").mouseout(function(){
	if(!$(this).hasClass("ov")){
	if(!$(this).hasClass("ed")){
	$(this).css("color","grey");
	var prea = $(this).prevAll();
	prea.css("color","black");
}
}
});
$(".fa-grin-hearts").click(function(){
	if(!$(this).hasClass("ov")){
	var allb = $(this).siblings();
	var pare = $(this).parent(".star");
	var all_ch = pare.children();
	
	var star = pare.children(".total_star");

	if(!$(this).hasClass("ed")){
	var now = $(all_ch).index(this);
	all_ch.addClass("ed");
	star.val(now+1);
	}
	else{
	var now = $(all_ch).index(this);
	var prea = $(this).prevAll();
	var afta = $(this).nextAll();
	var pare = $(this).parent(".star");
	var star = pare.children(".total_star");
	$(this).css("color","yellow");
	afta.css("color","grey");
    prea.css("color","yellow");
    star.val(now+1);
   
}
 now = 0;	
}});


