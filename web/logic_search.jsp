<%-- 
    Document   : HomePage
    Created on : Mar 19, 2021, 8:58:05 PM
    Author     : Hagar
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.iti.online_store.HomePage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
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
       
        
        <!-- Nav Bar Start -->
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
                            
                            
                            <form id="myForm" action="logic_search.jsp">
                                <input type="text" name="search_input" placeholder="Search">
                            <button onclick="submitForm()"><i class="fa fa-search"></i></button>
                          <label for="price">Price</label>
                         <input type="radio" id="price" name="search" value="price" >
                         <label for="category">Category</label>
                         <input type="radio" id="category" name="search" value="category">
                        </form>
                            <script>
                                function submitForm() {
                                 document.getElementById("myForm").submit();
                                  }
                            </script>
                            
  
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
        
             <% String search = request.getParameter("search");
            boolean check = true;
            
            if ("price".equals(search) ) {
                    double search_input = Double.parseDouble(request.getParameter("search_input"));
                    Connection con = null;
                    // ResultSet result;
                    PreparedStatement statment;

                    String product_name = null;
                    String price = null;
                    String image = null;
                    int id = 0;
                    int quantity = 0;

                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "0000");
                    statment = con.prepareStatement("select id,name,price,image,quantity from product where price=" + search_input );

                    ResultSet result = statment.executeQuery();

                    while (result.next()) {
        %>


        <div class="row align-items-center product-slider product-slider-4">
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#"><%product_name = result.getString(2);
                            out.println(product_name);
                            %></a>
                            <%
                                id = result.getInt(1);
                                out.println("<input type=\"hidden\" value=\"" + id + "\" name=\"id\">");
                            %>


                    </div>
                    <div class="product-image">
                        <a href="product-detail.jsp">
                            <%
                                image = result.getString(4);
                                out.println("<img src=\"" + image + "\" width=\"300\" height=\"300\" alt=\"Product Image\">");
                                System.out.println(image);
                            %>
                        </a>


                        <a href="cart.html" stock class="btn cart">
                            <i >left in stock </i>
                            <span><%quantity = result.getInt(5);
                                out.println(quantity);
                                %></span>
                        </a>
                    </div>
                    <div class="product-price">
                        <h3><span>EGP </span><%
                            price = result.getString(3);
                            out.println(price);

                            %> </h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Add to cart</a>
                    </div>
                </div>
            </div>
        </div>
        <%}
            }
         else {

            int cat = 0;
            String search_inp = request.getParameter("search_input");
            if ("laptop".equalsIgnoreCase(search_inp)) {
                cat = 2;
            } else if ("mobile".equalsIgnoreCase(search_inp)) {
                cat = 1;
            } else {
                cat = -1;
            }
            if (cat == 2) {
                Connection con = null;
                // ResultSet result;
                PreparedStatement statment;

                String product_name = null;
                String price = null;
                String image = null;
                int id = 0;
                int quantity = 0;

            
                statment = con.prepareStatement("select id,name,price,image,quantity from product where category_id=2");

                ResultSet result = statment.executeQuery();

                while (result.next()) {
        %>

        <div class="row align-items-center product-slider product-slider-4">
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#"><%product_name = result.getString(2);
                            out.println(product_name);

                            %></a>
                            <%                                        id = result.getInt(1);
                                out.println("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
                            %>


                    </div>
                    <div class="product-image">
                        <a href="product-detail.jsp">
                            <%
                                image = result.getString(4);
                                out.println("<img src=\"" + image + "\" width=\"300\" height=\"300\" alt=\"Product Image\">");
                                System.out.println(image);
                            %>
                        </a>


                        <a href="cart.html" stock class="btn cart">
                            <i >left in stock </i>
                            <span><%quantity = result.getInt(5);
                                out.println(quantity);
                                %></span>
                        </a>
                    </div>
                    <div class="product-price">
                        <h3><span>EGP </span><%
                            price = result.getString(3);
                            out.println(price);
                            %> </h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Add to cart</a>
                    </div>
                </div>
            </div>
        </div>
        <% continue;
            }
        } else if (cat == 1) {

            Connection con = null;
            // ResultSet result;
            PreparedStatement statment;

            String product_name = null;
            String price = null;
            String image = null;
            int id = 0;
            int quantity = 0;

            
            statment = con.prepareStatement("select id,name,price,image,quantity from product where category_id=1");

            ResultSet result = statment.executeQuery();%>

        <%
            while (result.next()) {
        %>

        <div class="row align-items-center product-slider product-slider-4">
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="#"><%product_name = result.getString(2);
                            out.println(product_name);

                            %></a>
                            <%                                        id = result.getInt(1);
                                out.println("<input type=\"hidden\" value=\"" + id + "\" name=\"id\">");
                            %>


                    </div>
                    <div class="product-image">
                        <a href="product-detail.jsp">
                            <%
                                image = result.getString(4);
                                out.println("<img src=\"" + image + "\" width=\"300\" height=\"300\" alt=\"Product Image\">");
                                System.out.println(image);
                            %>
                        </a>


                        <a href="cart.html" stock class="btn cart">
                            <i >left in stock </i>
                            <span><%quantity = result.getInt(5);
                                out.println(quantity);
                                %></span>
                        </a>
                    </div>
                    <div class="product-price">
                        <h3><span>EGP </span><%
                            price = result.getString(3);
                            out.println(price);
                            %> </h3>
                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Add to cart</a>
                    </div>
                </div>
            </div>
        </div>
        <% continue;
                    }
                }
            }%>
        <!-- Brand Start -->
        <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/1.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/2.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/3.svg" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/4.svg" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/5.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/6.jpg" width="150" height="80" alt=""></div>
                </div>
            </div>
        </div>
        <!-- Brand End -->      
        
        
       
       
        
        <!-- Footer Start -->
        <div class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h2>Copy Rights : ITI - Telecom 41 </h2> 
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                           
                            
                        </div>
                    </div>
                </div>
                
                <div class="row payment align-items-center">
                    <div class="col-md-6">
                        <div class="payment-method">
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        
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
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
