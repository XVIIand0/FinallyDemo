<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">

    <title>期末專案</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" type="text/css" href="css/shopcart.css">
    <link rel="stylesheet" type="text/css" href="css/carts_product.css">
	</head>
<style>
html,body{
	font-family: Microsoft JhengHei;
}
</style>
<body>
<%
ResultSet man=null;
String sql2;

     //判別會員有沒有登入
	 try{
                                try{
                                        Cookie getC[]=request.getCookies();
                                        for(int i=0;i<getC.length;i++)
                                        {
                                            if(getC[i].getName().equals("getin"))
                                            {
                                                String[] sp=getC[i].getValue().split("-");
                                                acc=sp[0];
                                                pas=sp[1];
                                            }
                                        }
                                        sql="SELECT * FROM member WHERE m_ac='"+acc+"' and m_pw='"+pas+"'";
                                        man=con.createStatement().executeQuery(sql);
                                        man.next();
                                        if(man.getString("m_level").equals("0"))
                                        {

                                        }
                                        else
                                        {
                                            out.write("<script language=javascript>alert('請先或註冊哦!');</script>");
                                            response.setHeader("refresh","0;URL=index.jsp");
                                        }
                                    }
                                catch(Exception e)
                                    {
                                          out.write("<script language=javascript>alert('請先或註冊哦!');</script>");
                                            response.setHeader("refresh","0;URL=index.jsp");
                                    }
%>
    <!--購物車開頭-->
    <div class="content">
        <br>
        <div class="topic"><b>- 我的購物車 -</b></div>

        <img style="margin-left:5%;" src="img/shoping1.png">

        <div class="cartMain">
            <table id="cartTable">
                <thead>
                    <tr>
                        <th>
                            <label style="margin-left: 25%;" for="fl select-all">
                                <input type="checkbox" class="check-all check" /><!--用jsp hidden-->
                                <span><a href="javascript:void(0)" class="selallSPAN">&nbsp;全選</a></span>
                            </label>
                        </th>
                        <th style="width: 25%;">商品</th>
                         <th style="width: 10%;">品名</th>
                        <th style="width: 10%;">價格</th>
                        <th style="width: 15%;">數量</th>
                       
                        <th style="width: 10%;">小計</th>
                        <th>刪除</th>
                    </tr>
                </thead>
                <tbody>
                    <!--商品-->
                    
                    <!--商品-->
					<%
						sql = "select g_id , s_amount , s_id from shopping where m_ac= '"+acc+"';";
						ResultSet rs = con.createStatement().executeQuery(sql);
						ResultSet rs2;
						if(rs.next())
						{
							
						
						rs = con.createStatement().executeQuery(sql);
						String gid ;
						String all_sid = "";
						int total= 0;
						while(rs.next()){
							gid = rs.getString("g_id");
							
							sql2 = "select g_photo , g_type , g_price from good where g_id="+gid+";";
							rs2 = con.createStatement().executeQuery(sql2);
							rs2.next();
							all_sid =(all_sid+","+rs.getString("s_id"));
							out.print("<form enctype='multipart/form-data' class='"+gid+"' ><input name='sid' type='hidden' value='"+rs.getString("s_id")+"'>");
							out.print("<tr>");
							out.print(" <td class='checkbox'>");
							out.print("<input type='checkbox' jul='"+gid+"' peter='"+rs.getString("s_id")+"' class='check-one check' />");
							out.print("</td>");
							out.print("<td class='goods'>");
							out.print("<img style='margin-left: 25%;' src='"+rs2.getString("g_photo")+"' />");
							out.print("<br><br>");
							out.print("</td>");
							out.print("<td> <span><a href='product.jsp?="+gid+"' >"+rs2.getString("g_type")+"</a></span><br /></td>");
							out.print("<td class='price'>"+rs2.getString("g_price")+"</td>");
							out.print("<td  class='count'>");
							out.print("<span style='margin-left: 25%;' class='reduce'>-</span>");
							out.print("<input  type='text' class='count-input' value='1'/>");
							out.print("<input  name='counts' type='hidden' class='counts-input' value='1'/>");
							out.print(" <span class='add'>+</span>");
							total = (Integer.valueOf(rs.getString("s_amount")).intValue()*Integer.valueOf(rs2.getString("g_price")).intValue());
							out.print("<td class='subtotal'>"+total+"</td>");
							out.print("<td>");
							out.print("<span></span>");
							out.print("<img src='icon/garbage.png' class='deleteOne'>");
							out.print("</td>");
							out.print("</tr></form>");
						}
						
						
					%>
                              
                        
                        
                        
                       
                        
                
                        



                </tbody>
            </table>

        </div>
        <div class="cartFooter" id="cartFooter">
            <div class="selall fl">
                <label for="fl select-all">
                    <input type="checkbox" class="check-all check" />
                    <span><a href="javascript:void(0)" class="selallSPAN">&nbsp;全選</a></span>
                </label>
            </div>
            <a href="#" id="multiDelete" class="fl delete">多選刪除</a>
			<%out.print("<form class='delete_all'><input name='de_all' type ='hidden' value='1"+all_sid+"'>");%>
            <a href="#" id="allDelete" class="fl delete">清空購物車</a>
			<%out.print("</form>");%>
            <a href="#">
                <div class="fr closing">結帳去</div>
            </a>
            <div class="fr total">合計<span id="priceTotal">0</span>元</div>
			<%out.print("<form action='order.jsp' class='sendout'><input id='total_c' type = 'hidden' name='total_c'>");%>
			<%out.print("<input type='hidden' id ='gs' name='gs'><input type ='hidden' id='qs' name='qs'></form>");
			}
						else{
							out.write("<script language=javascript>alert('購物車裡沒東西 快去逛逛吧!');</script>");
							response.setHeader("refresh","0;URL=a_product.jsp");
						}%>
            <div class="fr selected" id="selected">
                已選商品
                <span id="selectedTotal">0</span>件
                <span class="arrow up">︽點我查看</span>
                <span class="arrow down">︾</span>
            </div>
            <div class="selected-view">
                <div id="selectedViewList" class="clearfix">

                </div>
                <span class="arrow">◆<span>◆</span></span>
            </div>
        </div>
    </div>


</body>

</html>

<script>

	var selected = [];
var i;
var all ="1" ;
	$("#multiDelete").click(function(){
  $(".check-one:checked").each(function(){
		selected.push($(this).attr("peter"));		
	});
	for (i = 0 ; i<selected.length ; i++){
	 all += ","+selected[i];  
	}
	
});

	
	
    window.onload = function() {

        if (!document.getElementsByClassName) {
            document.getElementsByClassName = function(cls) {
                var ret = [];
                var els = document.getElementsByTagName('*');
                for (var i = 0; i < els.length; i++) {
                    if (els[i].className === cls ||
                        els[i].className.indexOf(cls + ' ') >= 0 ||
                        els[i].className.indexOf(' ' + cls) >= 0 ||
                        els[i].className.indexOf(' ' + cls + ' ') >= 0) {
                        ret.push(els[i]);
                    }
                };
                return ret;
            }
        }
        var cartTable = document.getElementById('cartTable');
        var tr = cartTable.children[1].rows; //children子節點;
        var checkInputs = document.getElementsByClassName('check');
        var checkAllInput = document.getElementsByClassName('check-all');
        var selectedTotal = document.getElementById('selectedTotal');
        var priceTotal = document.getElementById('priceTotal');
        var selected = document.getElementById('selected');
        var cartFooter = document.getElementById('cartFooter');
        var selectedViewList = document.getElementById('selectedViewList');
        var multiDelete = document.getElementById('multiDelete');
        var allDelete = document.getElementById('allDelete');
        var selallSPAN = document.getElementsByClassName('selallSPAN');

        //選擇框事件；
        for (var i = 0; i < checkInputs.length; i++) {
            checkInputs[i].onclick = function() {
                if (this.className === 'check-all check') { //全選；
                    for (var j = 0; j < checkInputs.length; j++) {
                        checkInputs[j].checked = this.checked;
                    }
                };
                if (this.checked == false) {
                    for (var k = 0; k < checkAllInput.length; k++) {
                        checkAllInput[k].checked = false;
                    }
                }
                getTotal();
            }
        };
        selallSPAN[0].onclick = selallSPAN[1].onclick = function() {
            for (var k = 0; k < checkAllInput.length; k++) {
                if (checkAllInput[k].checked) {
                    checkAllInput[k].checked = false;

                } else {
                    checkAllInput[k].checked = true;
                }
            }
            for (var j = 0; j < checkInputs.length; j++) {
                checkInputs[j].checked = checkAllInput[0].checked;
            }
            getTotal();
        }

        //計算；
        function getTotal() {
            var selected = 0;
            var price = 0;
            var HTMLstr = '';
            for (var i = 0; i < tr.length; i++) {
                var perCount = tr[i].getElementsByTagName('input')[1].value;
                if (tr[i].getElementsByTagName('input')[0].checked) {
                    tr[i].className = "on";
                    selected += parseInt(tr[i].getElementsByTagName('input')[1].value);
                    price += parseFloat(tr[i].cells[5].innerHTML);
                    HTMLstr += '<div><img src="' + tr[i].getElementsByTagName('img')[0].src + '"/><span class="selCount">' + perCount + '</span><span class="del" index="' + i + '">取消選擇</span></div>'
                } else {
                    tr[i].className = " ";
                }
            };
            selectedTotal.innerHTML = selected;
            priceTotal.innerHTML = price.toFixed(0);
			$("#total_c").val(price.toFixed(0));
            selectedViewList.innerHTML = HTMLstr;
            //選中0时；
            if (selected == 0) {
                cartFooter.className = "cartFooter";
            }
        }

        //已選框的選擇；
        selected.onclick = function() {
            if (cartFooter.className == 'cartFooter') {
                if (selectedTotal.innerHTML != 0) {
                    cartFooter.className = 'cartFooter show';
                }
            } else {
                cartFooter.className = "cartFooter";
            }
        }

        //取消選擇---》事件代理
        selectedViewList.onclick = function(e) {
            e = e || window.event;
            var el = e.srcElement;
            if (el.className == "del") {
                var index = el.getAttribute('index');
                var input = tr[index].getElementsByTagName('input')[0];
                input.checked = false;
                input.onclick();
            }
        }

        //加减事件；
        for (var i = 0; i < tr.length; i++) {
            //加减按钮；
            tr[i].onclick = function(e) {
                e = e || window.event;
                document.onselectstart = new Function("event.returnValue=false;");
                var el = e.target || e.srcElement;
                var cls = el.className;
                var input = this.getElementsByTagName('input')[1];
                var val = parseInt(input.value);
                var reduce = this.getElementsByTagName('span')[3];
                switch (cls) {
                    case 'add':
                        input.value = val + 1;
						$(this).find(".counts-input").val((val+1));
                        reduce.innerHTML = '';
                        getSubtotal(this);
                        break;
                    case 'reduce':
                        if (val > 1) {
                            input.value = val - 1;
                            getSubtotal(this);
                        }
                        if (input.value <= 1) {
                            reduce.innerHTML = '';
                        }
                        break;
                    case 'deleteOne':
                        //單行刪除；
                        var conf = confirm('確定要刪除嗎？');
                        if (conf) {
							var f1 = $(this).parent().find('form');
                           this.parentNode.removeChild(this);
							$.ajax({
                cache: true,
                type: "get",
                url:"delet_shopcart.jsp",
                data:f1.serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("刪除失敗");
                },
                success: function(data) {
                    alert("刪除成功");
					 
                    
                }

            });
							
                        }
                        break;
                    default:
                        break;
                }
                getTotal();
            }
            //input輸入事件；
            tr[i].getElementsByTagName('input')[1].onkeyup = function() {
                var val = parseInt(this.value);
                var tr = this.parentNode.parentNode;
                var reduce = tr.getElementsByTagName('span')[3];
                if (isNaN(val) || val < 1) {
                    val = 1;
                }
                this.value = val; //輸入控制；
                if (val <= 1) {
                    reduce.innerHTML = "";
                } else {
                    reduce.innerHTML = "";
                }
                getSubtotal(tr);
                getTotal();
            }
        };
        //小計
        function getSubtotal(tr) {
            var tds = tr.cells;
            var price = parseFloat(tds[3].innerHTML);
            var count = tr.getElementsByTagName('input')[1].value;
            var subTotal = parseFloat(price * count).toFixed(0); //小數點第0位
            tds[5].innerHTML = subTotal;
			
        }

        //刪除；

        multiDelete.onclick = function() {
            if (selectedTotal.innerHTML != '0') {
                var conf = confirm('確定要刪除嗎？');
                if (conf) {
                    cartDel();
                    getTotal();
					$.ajax({
                cache: true,
                type: "get",
                url:"delet_shopcart.jsp",
                data:"de_all="+all,// 你的formid
                async: false,
                error: function(request) {
                    alert("刪除失敗");
                },
                success: function(data) {
                    alert("刪除成功");
					 
                    
                }

            });
                }

            }
        }
        allDelete.onclick = function() {
            var conf = confirm('確定要清空購物車嗎？');
            if (conf) {
                checkAllInput[0].checked = true;
                checkAllInput[0].onclick();
                
					var f2 = $(this).parent();
							
                           
							$.ajax({
                cache: true,
                type: "get",
                url:"delet_shopcart.jsp",
                data:f2.serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("刪除失敗");
                },
                success: function(data) {
                    alert("刪除成功");
					 this.parentNode.removeChild(this);
                    
                }

            });
			cartDel();
                getTotal();
            }
        }

        function cartDel() {
            for (var i = 0; i < tr.length; i++) {
                var input = tr[i].getElementsByTagName('input')[0];
                if (input.checked) {
                    tr[i].parentNode.removeChild(tr[i]);
                    i--; //刪除時注意i 的變化；
                };
            };
        }
    }
	var f5;
	var countss = [];
	var all_c ="1";
	$(".closing").click(function(){
   all="1";
  $(".check-one:checked").each(function(){
		selected.push($(this).attr("jul"));		
	});
	$(".check-one:checked").each(function(){
		f5 = $(this).parent().parent().children(".count").children(".counts-input");
		countss.push(f5.attr("value"));		
	});
	for (i = 0 ; i<selected.length ; i++){
	 all += ","+selected[i];  
	}
	for (i = 0 ; i<countss.length ; i++){
	 all_c += ","+countss[i];  
	}
	$("#gs").val(all);
	$("#qs").val(all_c);
	$(".sendout").submit();
});
	

</script>
	 <%}
	 catch(SQLException sExec)
		{
			out.println("SQL錯誤"+sExec.toString());
		}	%>
