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
                    <td>圖片</td>
                    <td>品種</td>
                    <td>價錢(包)</td>
                    <td>數量</td>
                    <td>生長環境</td>
                    <td>養殖方法</td>
                    <td>菇菇外觀</td>
                    <td>食用功效</td>

                </tr>
            </thead>
            <tbody>
                <form action="addproduct.jsp" method="POST">
                    <tr>
                        <td><input type="text" class="td_width_80" name="g_id"></td>
                        <td class="td_width_20">
                        <img src="icon/list.png" class="td_width_20">
                        </td>
                        <td class="td_width_20"><input type="text" name="g_type"></td>
                        <td><input type="text" class="td_width_80" name="g_price"></td>
                        <td><input type="text" class="td_width_80" name="g_storage"></td>
                        <td><input type="text" name="g_place"></td>
                        <td><input type="text" name="g_farm"></td>
                        <td><input type="text" name="g_like"></td>
                        <td><input type="text" name="g_eff"></td>
                    </tr>
            </tbody>
        </table>
        <br>
        <button class="win_add_bt">確定新增</button>
        </form>
        
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

</script>
