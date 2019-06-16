<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="getgougou.jsp"%>
<%
    //抓帳號是誰
                          ResultSet man=null;
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
                                        sql="SELECT * FROM member WHERE m_ac='"+acc+"' and m_pw='"+pas+"'";
                                        man=con.createStatement().executeQuery(sql);
                                        man.next();
                                        if(man.getString("m_level").equals("0"))
                                        {
                                               String act = request.getParameter("act");
                                                String amount=request.getParameter("amount");
                                                String gid=request.getParameter("g_id");
                                                sql="select * from good where g_id='"+gid+"'";//抓特定商品的資訊
                                                ResultSet gou=con.createStatement().executeQuery(sql);
                                                ResultSet tmp=null;
                                                gou.next();
                                                if(act!=null){
                                                    if(act.equals("shopping"))
                                                    {
                                                        String sql2="select * from shopping where g_id='"+gid+"' and m_ac='"+acc+"'";
                                                       tmp=con.createStatement().executeQuery(sql2);
                                                        if(tmp.next()){
                                                              out.write("<script language=javascript>alert('重複加入購物車囉')</script>");
                                                        }
                                                        else{
                                                            sql="insert into shopping(g_id,m_ac,s_amount) value('"+gid+"','"+acc+"','"+amount+"')";
                                                            con.createStatement().execute(sql);
                                                            out.write("<script language=javascript>alert('成功加入"+gou.getString("g_type")+"x"+amount+"進購物車')</script>");
                                                        }
                                                        response.setHeader("refresh","0;url=a_product.jsp");
                                                    }
                                                    else if(act.equals("love"))
                                                    {
                                                         sql="insert into love(g_id,m_ac,love_amount) value('"+gid+"','"+acc+"','"+amount+"')";
                                                        con.createStatement().execute(sql);
                                                        out.write("<script language=javascript>alert('成功加入"+gou.getString("g_type")+"x"+amount+"進菇菇收藏館')</script>");
                                                        response.setHeader("refresh","0;url=a_product.jsp");
                                                    }
                                                }
                                        }
                                        else
                                        {
                                            out.write("<script language=javascript>alert('請先或註冊哦!');</script>");
                                            response.setHeader("refresh","0;URL=index.jsp");
                                        }
                                    }
                               catch (Exception e){ 
out.print(e.toString()); 
}
                               
 
%>