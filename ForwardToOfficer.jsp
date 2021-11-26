<%-- 
    Document   : ForwardToOfficer
    Created on : 15 Apr, 2019, 10:01:01 AM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="dbcon.Dbconnection" %>
<%
    String id=request.getParameter("id");
    String username=request.getParameter("username");
    String sellername=request.getParameter("sellername");
    try
    {
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
    int i=st.executeUpdate("update complaints set status='Officer' where id='"+id+"' and username='"+username+"' and sellername='"+sellername+"'");
    if(i>0)
    {
        %>
        <script type="text/javascript">
            window.alert("Complaint Forwarded To Officer");
            window.location="SellerHome.jsp";
        </script>        
<%
    }
else
{
 %>
        <script type="text/javascript">
            window.alert("Unable to  Forwarded The Complaint To Officer");
            window.location="SellerHome.jsp";
        </script>        
<%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>