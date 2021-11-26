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
                    <li><a href="ConsumerHome.jsp">HOME</a></li>
                    <li><a href="ViewProducts.jsp">VIEW PRODUCTS</a></li>
                    <li><a href="SendComplaints.jsp">SEND COMPLAINTS</a></li>
                    <li><a href="ViewComplaintsStatus.jsp">VIEW COMPLAINTS STATUS</a></li>
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
                    <h1> Send Complaint
                        <br />
                        <strong> </strong>
                    </h1>
                    <% String username=(String)session.getAttribute("username");
                    String sellername=request.getParameter("sellername");
     String id=request.getParameter("id");
      String pname=request.getParameter("pname");
       String pprize=request.getParameter("pprize");
                    %>
                    <h3></h3>
                    <form name="login" action="SendComplaints" method="post" enctype="multipart/form-data">
                    <table align="center" cellpadding="10px;" border="4px;">
                        <tr><td>Product ID</td><td><input type='text' name='id' value='<%=id%>' readonly=""></td></tr>
                        <tr><td>Buyer Name</td><td><input type='text' name='username' value='<%=username%>' readonly=""></td></tr>
                    <tr><td>Seller Name</td><td><input type='text' name='sellername' value='<%=sellername%>' readonly=""></td></tr>
                    <tr><td>Product Name</td><td><input type='text' name='pname' value='<%=pname%>' readonly=""></td></tr>
                    <tr><td>Product Prize</td><td><input type='text' name='pprize' value='<%=pprize%>' readonly=""></td></tr>
                    <tr><td>Choose Location</td><td><input type='text' name='location' ></td></tr>
                    <tr><td>Choose Product Image</td><td><input type='file' name='image' ></td></tr>
                    <tr><td><input type="Submit" value="Send Complaint"></td><td><input type="reset"></td></tr>
                    </table>
                    </form>
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
                &copy; 2019 Venkatarao Ganipisetty| All Right Reserved 				
		
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
