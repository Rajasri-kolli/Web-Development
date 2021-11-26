<%-- 
    Document   : purchase
    Created on : 14 Apr, 2019, 7:51:30 PM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="dbcon.Dbconnection" %>
<%
    String username=(String)session.getAttribute("username");
    String sellername=request.getParameter("sellername");
     String id=request.getParameter("id");
      String pname=request.getParameter("pname");
       String pprize=request.getParameter("pprize");
       try
       {
         Connection con=Dbconnection.getConnection();
         Statement st=con.createStatement();
         int i=st.executeUpdate("insert into purchase values('"+id+"','"+username+"','"+sellername+"','"+pname+"','"+pprize+"')");
         if(i>0)
         {
              %>
       <script type="text/javascript">
           window.alert("Product Purchased SuccessFully");
           window.location="ConsumerHome.jsp";
           
           </script>
        <%
         }
else
{
 %>
       <script type="text/javascript">
           window.alert("Unable Purchase Product Right Now");
           window.location="ConsumerHome.jsp";
           
           </script>
        <%
}
       }
       catch(Exception e)
       {
           out.println(e);
       }
    %>