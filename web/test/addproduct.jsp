<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="getgougou.jsp"%>
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	String	gid=request.getParameter("g_id");
	String	gtype=request.getParameter("g_type");
	String	gprice=request.getParameter("g_price");
	String	gstorage=request.getParameter("g_storage");
	String	gplace=request.getParameter("g_place");
	String	gfarm=request.getParameter("g_farm");
	String	glike=request.getParameter("g_like");
	String	geff=request.getParameter("g_eff");

		if(gid==null||gid.equals("")||gtype==null||gtype.equals("")||gprice==null||gprice.equals("")||gstorage==null||gstorage.equals("")||gplace==null||gplace.equals("")||gfarm==null||gfarm.equals("")||glike==null||glike.equals("")||geff==null||geff.equals(""))
            {
		        out.write("<script language=javascript>alert('輸入錯誤');</script>");
		       response.setHeader("refresh","0;URL=window_add_product.jsp");
		    }
            else
            {
                sql="insert goods(g_id,g_type,g_price,g_storage,g_place,g_farm,g_like,g_eff) values('"+gid+"','"+gtype+"','"+gprice+"','"+gstorage+"','"+gplace+"','"+gfarm+"','"+glike+"','"+geff+"');";
                        con.createStatement().executeUpdate(sql); 
                        out.write("<script language=javascript>alert('新增商品完成');</script>");
                        response.setHeader("refresh","0;URL=complete.html");

            }
		
	%>
</body>
</html>

//  照片   <form action="/somewhere/to/upload" enctype="multipart/form-data">
                            /*    <img class="td_width_80" id="preview_progressbarTW_img" src="#" />
                                <input name="g_photo" type="file" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png"/ >
               </form>*/
