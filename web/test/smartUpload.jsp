<%@ page contentType="text/html;charset=utf-8" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<%@include file="getgougou.jsp"%>
<%
SmartUpload mySmartUpload =new SmartUpload();
mySmartUpload.initialize(pageContext);
long file_size_max=4000000;
String fileName2="",ext="",testvar="";
String url2="test/good/"; //應保證在根文件夾中有此文件夾的存在（也就是說須要自己建立對應的文件夾）
mySmartUpload.upload();
String gid=mySmartUpload.getRequest().getParameter("g_id");
String	gtype=mySmartUpload.getRequest().getParameter("g_type");
String	gtag=mySmartUpload.getRequest().getParameter("g_tag");
String	gprice=mySmartUpload.getRequest().getParameter("g_price");
String	gstorage=mySmartUpload.getRequest().getParameter("g_storage");
String	gplace=mySmartUpload.getRequest().getParameter("g_place");
String	gfarm=mySmartUpload.getRequest().getParameter("g_farm");
String	glike=mySmartUpload.getRequest().getParameter("g_like");
String	geff=mySmartUpload.getRequest().getParameter("g_eff");
String deb= gid+" "+gtype+" "+gtag+""+gprice+" "+gstorage+" "+gplace+" "+gfarm+" "+glike+" "+geff;

if(gid==null||gid.equals("")||gtype==null||gtype.equals("")||gtag==null||gtag.equals("")||gprice==null||gprice.equals("")||gstorage==null||gstorage.equals("")||gplace==null||gplace.equals("")||gfarm==null||gfarm.equals("")||glike==null||glike.equals("")||geff==null||geff.equals(""))
            {
        		
		        out.write("<script language=javascript>alert('"+deb+"');</script>");
		    }
            else
            {
            	

//初始化

//僅僅同意上載此類文件

try {
mySmartUpload.setAllowedFilesList("jpg,gif,png");//此處的文件格式能夠依據須要自己改動
//上載文件 

} catch (Exception e){
%>
<SCRIPT language=javascript>
alert("僅僅同意上傳.jpg和.gif類型圖片文件");
window.location=‘test22.jsp‘;
</script>
<%
}
try{ 

com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
if (myFile.isMissing()){%>
<SCRIPT language=javascript>
alert("請先選擇要上傳的文件");
window.location=‘upload.htm‘;
</script>
<%}
else{
//String myFileName=myFile.getFileName(); //取得上載的文件的文件名稱
ext= myFile.getFileExt(); //取得後綴名
int file_size=myFile.getSize(); //取得文件的大小 
String saveurl="";
if(file_size<file_size_max){
//更改文件名稱，取得當前上傳時間的毫秒數值
String filename = gid;
saveurl=application.getRealPath("/")+url2;
saveurl+=filename+"."+ext; //保存路徑
myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
out.print(saveurl);
String gphoto= "good/"+gid+"."+ext;
sql="insert good(g_id,g_type,g_tag,g_price,g_storage,g_photo,g_place,g_farm,g_like,g_eff) values('"+gid+"','"+gtype+"','"+gtag+" ','"+gprice+"','"+gstorage+"','"+gphoto+"','"+gplace+"','"+gfarm+"','"+glike+"','"+geff+"');";
                        con.createStatement().executeUpdate(sql); 
String ret = "window.close();";
out.print("<script language=javascript>" + ret + "</script>");

}
}
}catch (Exception e){ 
out.print(e.toString()); 
    out.println(deb);
}
}
%> 