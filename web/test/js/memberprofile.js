// 交易評價的送出按下後消失
$('.submit-button').click(function(e) {
$(this).toggleClass('hide');
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