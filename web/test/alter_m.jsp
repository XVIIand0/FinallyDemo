<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html;charset=utf-8" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<%@include file="getgougou.jsp"%>
<html>
<body>
	<%
	//抓帳號是誰
	
                         String acc=null;
                         String pas=null;
                        
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

                            }
                        catch(Exception e)
                        {

                        }
		SmartUpload mySmartUpload =new SmartUpload();
mySmartUpload.initialize(pageContext);
long file_size_max=4000000;
String fileName2="",ext="",testvar="";
String url2="test/m_img/"; //應保證在根文件夾中有此文件夾的存在（也就是說須要自己建立對應的文件夾）
mySmartUpload.upload();
		String mname=mySmartUpload.getRequest().getParameter("m_name");
		String mpw=mySmartUpload.getRequest().getParameter("m_pw");
		String mmail=mySmartUpload.getRequest().getParameter("m_mail");
		String mphone=mySmartUpload.getRequest().getParameter("m_phone");
		String mad=mySmartUpload.getRequest().getParameter("m_ad");
		
		if(mpw==null||mpw.equals("")){
			out.write("<script language=javascript>alert('密碼不能為空!');</script>");
			response.setHeader("refresh","0;URL=member_center.jsp");
		
		try {
mySmartUpload.setAllowedFilesList("jpg,gif,png");//此處的文件格式能夠依據須要自己改動
//上載文件 

} catch (Exception e){
%>
<SCRIPT language=javascript>
alert("僅僅同意上傳.jpg和.gif , .png類型圖片文件");
window.location=‘member_center.jsp‘;
</script>
<%
}
		}
		else{
		try
		{                                                          
			com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
if (myFile.isMissing()){%>
<SCRIPT language=javascript>
alert("請先選擇要上傳的文件");
window.location=‘upload.htm‘;
</script>
<%}
			ext= myFile.getFileExt(); //取得後綴名
int file_size=myFile.getSize(); //取得文件的大小 
String saveurl="";
if(file_size<file_size_max){
//更改文件名稱，取得當前上傳時間的毫秒數值
String filename = acc;
saveurl=application.getRealPath("/")+url2;
saveurl+=filename+"."+ext; //保存路徑
myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
out.print(saveurl);
	String m_photo= "m_img/"+acc+"."+ext;
			sql="UPDATE member SET  m_photo='"+m_photo+"', m_name='"+mname+"',m_pw='"+mpw+"',m_mail='"+mmail+"',m_phone='"+mphone+"',m_ad='"+mad+"' WHERE m_ac='"+acc+"'";
			con.createStatement().executeUpdate(sql); 
			//String myFileName=myFile.getFileName(); //取得上載的文件的文件名稱

			out.write("<script language=javascript>alert('修改完成，請重新豋入!');</script>");
			response.setHeader("refresh","0;URL=index.jsp");
		
        }
		}
		catch(Exception e)
		{
		 
			out.write("<script language=javascript>alert('修改錯誤"+e.toString()+"');</script>");
			
		}		
		}

	con.close();
	%>
</body>
</html>
