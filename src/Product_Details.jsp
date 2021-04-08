 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.iti.online_store.saveQuantity"%>
<%
     String url = "jdbc:postgresql://localhost/souq";
     String user = "postgres";
     String psqlPassword = "1111";             
     String product_id = "1" ;
                  //request.getParameter("id_product"); 
              
             %>
             
<html lang="en">
    <head>
      <meta charset=\"utf-8\">
    <title>E Store - eCommerce HTML Template</title>
      <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
      <meta content="eCommerce HTML Template Free Download" name="description">
      <!-- Favicon -->
       <link href="img/favicon.ico" rel="icon">

       <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

     <!-- CSS Libraries -->
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="CSS/slick.css" rel="stylesheet">
        <link href="CSS/slick-theme.css" rel="stylesheet">

       <!-- Template Stylesheet -->
        <link href="CSS/style.css" rel="stylesheet">
    </head>

    <body> 
        <%
 
                 Class.forName("org.postgresql.Driver");  
                 Connection con = DriverManager.getConnection(url, user,  psqlPassword);  
             
                 Statement stmt = con.createStatement();  
                 
                 
                 ResultSet rs = stmt.executeQuery("select * from product where id ="+product_id+"");  
               //  request.getSession(true);
                 
                 
     %>            
                 
                 
                 
                  <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="index.html" class="nav-item nav-link active">Home</a>
                            <a href="product-list.html" class="nav-item nav-link">Products</a>
                     
                          <a href="my-account.html" class="nav-item nav-link">My Profile</a>

                       </div>
                       <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                               <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item">Login</a>
                                    <a href="#" class="dropdown-item">Register</a>
                               </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Nav Bar End -->    
       
        <!-- Bottom Bar Start -->
       <div class="bottom-bar">
           <div class="container-fluid">
              <div class="row align-items-center">
                    <div class="col-md-3">
                       <div class="logo">
                           <a href="index.html">
                              <img src="img/logo.png" alt="Logo">
                           </a>
                       </div>
                    </div>
                    <div class="col-md-6">
                       <div class="search">
                            <input type="text" placeholder="Search">
                            <button><i class="fa fa-search"></i></button>
                        </div>
                   </div>
                   <div class="col-md-3">
                        <div class="user">

                           <a href="cart.html" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>(0)</span>
                           </a>
                        </div>
                    </div>
                </div>
            </div>
     </div>
        <!-- Bottom Bar End -->       

      <!-- Breadcrumb Start -->
       <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                   <li class="breadcrumb-item active">Product Detail</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
      
        <!-- Product Detail Start -->
        <div class="product-detail">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                       <div class="product-detail-top">
                            <div class="row align-items-center">
                               <div class="col-md-5">
                                    <div class="product-slider-single normal-slider"> 
                 
                                        <%  
                 while (rs.next()) 
                 {  
                      int prodQuant = rs.getInt(6);
                      int prodCat = rs.getInt(7);  
                     
                     %>
                     
                                 <img src="<%out.println(  rs.getString(4)); %>"  alt="Product Image">
                      </div>

                               </div>
                                <div class="col-md-7">
                                    <div class="product-content">
                                       <div class="title">
                                           <h2><%out.println(  rs.getString(2)); %></h2></div>

                                       <div class="price">
                                            <h4>Price:</h4>
                                           <p>   <%out.println(  rs.getInt(5)); %></p>
                                      </div>
                                     <div class="quantity">
                                            <h4>Quantity:</h4>
                                           <div class="qty"> 
                                               
                                                               <%
                                            session.setAttribute("id_product", rs.getInt(1));  
                                            System.out.println("yesssssssss");
                                             System.out.println( session.getAttribute("id_product"));
                                            //session.setAttribute("id_product", rs.getInt(1));  
                                      %>
                                               
                                               
                        
                                           <form method="get"  action="saveQuantity">
                                               <%System.out.println("product"+rs.getInt(1));%>
                                               <input type="text"  name="Quantity">
                                                 <input type="submit" value="AddToCart">
                                                  <input type="hidden" name="proid" value=<%=product_id%>>
                                       
                                                                                                 </form>
 
                                                 
                                                 </div>  
                                                 </div>
                                             
                                           
                                  
                                     
                                               
                        
                                           
                                  
                                </div>
                           </div>
                       </div>
                    
                        <div class="row product-detail-bottom">
                           <div class="col-lg-12">
                             <ul class="nav nav-pills nav-justified">
                                  <li class="nav-item">
                                       <a class="nav-link active" data-toggle="pill" href="#description">Description</a>
                                 </li>
                                 
                              </ul>

                             <div class="tab-content">
                                    <div id="description" class="container tab-pane active">
                                       <h4>Product description</h4>
                                       <p>  <%out.println(  rs.getString(3)); %> </p>
                                        <%     }  %> 
                                    </div>
                             
                                </div>
                            </div>
                       </div>
               </div>
               </div>
           </div>
       </div>
                                    
     <!-- Product Detail End --> 
   <!-- Footer Start -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Copy Rights : ITI - Telecom 41 </h2> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Footer Bottom Start -->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">

                </div>
            </div>
        </div>
        <!-- Footer Bottom End -->        

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="js/easing.min.js"></script>
        <script src="js/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    
    <%                
                 rs.close();   
                 con.close();  
                 stmt.close();
%>
</body>
</html>  