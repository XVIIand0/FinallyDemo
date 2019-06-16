<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>新增商品</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/window.css">
    <link rel="stylesheet" type="text/css" href="css/back.css">
    <script src="js/jquery-3.2.1.min.js"></script>
</head>

<body>
    <div class="window_shopping_back">

        <p><b>
                <center>新增商品</center>
            </b></p>

        <table>
            <thead>
                <tr>

                    <td>商品編號</td>
                    <td>品種</td>
                    <td>屬性</td>
                    <td>價錢(包)</td>
                    <td>數量</td>
                    <td>生長環境</td>
                    <td>養殖方法</td>
                    <td>菇菇外觀</td>
                    <td>食用功效</td>
                    <td>圖片</td>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <form class="add_form" action="smartUpload.jsp" method="post" enctype="multipart/form-data" name="form1">

                        <td><input type="text" class="td_width_80" id="g_id" name="g_id"></td>
                        <td class="td_width_20"><input type="text" name="g_type"></td>
                        <td><select name="g_tag">
                                <option value="magic">魔力</option>
                                <option value="loyal">務實</option>
                                <option value="green">養身</option>
                                <option value="power">超能力</option>
                                <option value="eval">邪惡</option>
                            </select></td>
                        <td><input type="text" class="td_width_80" name="g_price"></td>
                        <td><input type="text" class="td_width_80" name="g_storage"></td>
                        <td><input type="text" name="g_place"></td>
                        <td><input type="text" name="g_farm"></td>
                        <td><input type="text" name="g_like"></td>
                        <td><input type="text" name="g_eff"></td>

                        <td class="td_width_20">
                            <img class="td_width_80" id="preview_progressbarTW_img" src="#" />
                            <input name="g_photo" type="file" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png"/>
                        </td>
                    </form>
                </tr>
            </tbody>
        </table>
        <br>
        <button class="win_add_bt">確定新增</button>

    </div>
</body>

</html>
<script>
    function readURL(input) {

        if (input.files && input.files[0]) {

            var imageTagID = input.getAttribute("targetID");

            var reader = new FileReader();

            reader.onload = function(e) {

                var img = document.getElementById(imageTagID);

                img.setAttribute("src", e.target.result)

            }

            reader.readAsDataURL(input.files[0]);

        }

    }
    $(".win_add_bt").click(function() {
        $(".add_form").submit();
    });

</script>
