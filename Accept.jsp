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
    int i=st.executeUpdate("update complaints set status='Your Complaint was Accepted It Will Slove With in Short time' where id='"+id+"' and username='"+username+"' and sellername='"+sellername+"'");
    if(i>0)
    {
        %>
        <script type="text/javascript">
            window.alert("Complaint Accepted SuccessFully");
            window.location="OfficerHome.jsp";
        </script>        
<%
    }
else
{
 %>
        <script type="text/javascript">
            window.alert("Unable to  Accepted The Complaint Right Now");
            window.location="OfficerHome.jsp";
        </script>        
<%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>