<%@ page contentType="text/html;charset=utf-8" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<%@include file="getgougou.jsp"%>
<%
SmartUpload mySmartUpload =new SmartUpload();
mySmartUpload.initialize(pageContext);
long file_size_max=4000000;
String fileName2="",ext="",testvar="";
String url2="test/good/"; //���O�Ҧb�ڤ�󧨤�������󧨪��s�b�]�]�N�O�����n�ۤv�إ߹�������󧨡^
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
            	

//��l��

//�ȶȦP�N�W���������

try {
mySmartUpload.setAllowedFilesList("jpg,gif,png");//���B�����榡����̾ڶ��n�ۤv���
//�W����� 

} catch (Exception e){
%>
<SCRIPT language=javascript>
alert("�ȶȦP�N�W��.jpg�M.gif�����Ϥ����");
window.location=��test22.jsp��;
</script>
<%
}
try{ 

com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
if (myFile.isMissing()){%>
<SCRIPT language=javascript>
alert("�Х���ܭn�W�Ǫ����");
window.location=��upload.htm��;
</script>
<%}
else{
//String myFileName=myFile.getFileName(); //���o�W������󪺤��W��
ext= myFile.getFileExt(); //���o���W
int file_size=myFile.getSize(); //���o��󪺤j�p 
String saveurl="";
if(file_size<file_size_max){
//�����W�١A���o��e�W�Ǯɶ����@��ƭ�
String filename = gid;
saveurl=application.getRealPath("/")+url2;
saveurl+=filename+"."+ext; //�O�s���|
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