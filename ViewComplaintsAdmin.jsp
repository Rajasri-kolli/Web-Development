<%-- 
    Document   : OfficerHome
    Created on : 14 Apr, 2019, 4:01:41 PM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<!-- HEAD SECTION -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>LOCATION BASED CONSUMER COMPLAINT</title>
    <!--GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <!--BOOTSTRAP MAIN STYLES -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!--FONTAWESOME MAIN STYLE -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <!--CUSTOM STYLE -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
    <!--END HEAD SECTION -->
<body>   
     <!-- NAV SECTION -->
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">LOCATION BASED CONSUMER COMPLAINT</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="AdminHome.jsp">HOME</a></li>
                    <li><a href="ViewSellersAdmin.jsp">VIEW SELLERS</a></li>
                    <li><a href="ViewConsumer.jsp">SEND COMSUMERS</a></li>
                    <li><a href="ViewComplaintsAdmin.jsp">VIEW COMPLAINTS</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                    
                </ul>
            </div>
           
        </div>
    </div>
     <!--END NAV SECTION -->
     <!-- HEADER SECTION -->
    <div id="header-section">
        <div class="container">
            <div class="row centered">
                <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                    <h1>View Your Products Complaint's
                        <br />
                        <strong> </strong>
                    </h1>
                    <% String username=(String)session.getAttribute("username");%>
                               <%@page import="java.sql.*"%>
                    <%@page import="dbcon.Dbconnection"%>
                    <%try
                    {
                        String location=request.getParameter("location");
                        Connection con=Dbconnection.getConnection();
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select * from complaints");
                        %>
                        <table align="center" cellpadding="10px;" border="4px;">
                            <tr>
                                 <th><font color="white">Product Id</th>
                                <th><font color="white">Buyer Name</th>
                                <th><font color="white">Seller Name</th>
                                <th><font color="white">Product Name</th>
                                <th><font color="white">Product Prize</th>
                                <th><font color="white">Location</th>
                                <th><font color="white"> Complaint Status </th>
                                <th><font color="white">Product Image</th>
                                
                                
                                
                               
                          
                                
                            
                            </tr>
                            
                            <tr>
                                <%while(rs.next())
                            {%>
                                <td><font color="white"><%=rs.getString(1)%></td>
                                <td><font color="white"><%=rs.getString(2)%></td>
                                <td><font color="red" size='5'><%=rs.getString(3)%></td>
                                <td><font color="white"><%=rs.getString(4)%></td>
                                 <td><font color="white"><%=rs.getString(5)%></td>
                                  <td><font color="white"><%=rs.getString(6)%></td>
                                   <td><font color="Black" size="5"><%=rs.getString(7)%></td>
                                <td><font color="white"><img src="view1.jsp?id=<%=rs.getString(1)%>" width="100px" height="100px"></td>
                                    </tr>
                             <%
                            }
                    }
catch(Exception e)
{
out.println(e);
}
                    %>
                     <br />
                 
                </div>
            </div>
           
        </div>
       
    </div> 
      <!--END HEADER SECTION -->
    <!--ABOUT SECTION -->
    
    <div id="footer">
        <div class="container">
            <div class="row ">
               			
		
            </div>
            
        </div>
       
    </div>  
    <!--END FOOTER SECTION --> 
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY LIBRARY -->
    <script src="assets/js/jquery.js"></script>
    <!-- CORE BOOTSTRAP LIBRARY -->
    <script src="assets/js/bootstrap.min.js"></script>
     <!-- SCROLL REVEL LIBRARY FOR SCROLLING ANIMATIONS-->
    <script src="assets/js/scrollReveal.js"></script>
       <!-- CUSTOM SCRIPT-->
    <script src="assets/js/custom.js"></script>
</body>
</html>
