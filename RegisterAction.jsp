<%-- 
    Document   : AddManagerAction
    Created on : 13 Apr, 2019, 10:44:18 AM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dbcon.Dbconnection"%>
<%
    
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");
    String username=request.getParameter("username");
   
    String password=request.getParameter("password");
    String role=request.getParameter("role");
    try
    {
      Connection con=Dbconnection.getConnection();
      Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select count(*) from register where username='"+username+"'");
      while(rs.next())
      {
          int count=rs.getInt(1);
          if(count==0)
          {
              int i=st.executeUpdate("insert into register values('"+fname+"','"+lname+"','"+email+"','"+mobile+"','"+address+"','"+username+"','"+password+"','"+role+"')");
             int ii=st.executeUpdate("insert into login values('"+username+"','"+password+"','"+role+"')");
              if((i>0)&&(ii>0))
              {
                  %>
       <script type="text/javascript">
           window.alert("Registration Completed SuccessFully");
           window.location="Registration.jsp";
           
           </script>
        <%
              }
else
{
%>
       <script type="text/javascript">
           window.alert("Unable to Register Right Now");
           window.location="Registration.jsp";
           
           </script>
        <%
}
          }
else
{
%>
       <script type="text/javascript">
           window.alert("This User Name is Alredy Exists");
           window.location="Registration.jsp";
           
           </script>
        <%
}
      }
%>
       <script type="text/javascript">
            window.alert("This User Name is Alredy Exists");
           window.location="Registration.jsp";
           </script>
        <%
    }
      catch(Exception e)
              {
              out.println(e);
              }
      %>