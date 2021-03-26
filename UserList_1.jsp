<%-- 
    Document   : user
    Created on : Mar 22, 2021, 5:15:32 PM
    Author     : Dell
--%>



<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
              rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="CSS/slick.css" rel="stylesheet">
        <link href="CSS/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="CSS/CSS.css" rel="stylesheet">
    </head>

    <body>
        <!-- Top bar Start -->
        <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <i class="fa fa-envelope"></i>
                        support@email.com
                    </div>
                    <div class="col-sm-6">
                        <i class="fa fa-phone-alt"></i>
                        +012-345-6789
                    </div>
                </div>
            </div>
        </div>
        <!-- Top bar End -->

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
                            <a href="index.html" class="nav-item nav-link">Home</a>
                            <a href="product-list.html" class="nav-item nav-link">Products</a>
                            <a href="product-detail.html" class="nav-item nav-link">Product Detail</a>
                            <a href="cart.html" class="nav-item nav-link">Cart</a>
                            <a href="checkout.html" class="nav-item nav-link">Checkout</a>
                            <a href="my-account.html" class="nav-item nav-link">My Account</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">More Pages</a>
                                <div class="dropdown-menu">
                                    <a href="wishlist.html" class="dropdown-item active">Userslist</a>
                                    <a href="login.html" class="dropdown-item">Login & Register</a>
                                    <a href="contact.html" class="dropdown-item">Contact Us</a>
                                </div>
                            </div>
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
                            <a href="wishlist.html" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                                <span>(0)</span>
                            </a>
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
                    <li class="breadcrumb-item active">Userslist</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Users Start -->
        <div class="wishlist-page">
            <div class="container-fluid">
                <div class="wishlist-page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>User Name</th>
                                            <th>Password</th>
                                            <th>E-mail</th>
                                            <th>Address</th>
                                            <th>Balance</th>
                                        </tr>
                                    </thead>
                                    <%
                                        try {
                                            String driver = "org.postgresql.Driver";
                                            String url = "jdbc:postgresql://localhost:5432/souq";
                                            String username = "postgres";
                                            String password = "3333";
                                            String myDataField = null;
                                            String myQuery = "select * from users";
                                            Connection myConnection = null;
                                            PreparedStatement myPreparedStatement = null;
                                            ResultSet myResultSet = null;
                                            Class.forName(driver).newInstance();
                                            myConnection = DriverManager.getConnection(url, username, password);
                                            System.out.println("Opened database successfully");
                                            myPreparedStatement = myConnection.prepareStatement(myQuery);
                                            ResultSet rs = myPreparedStatement.executeQuery();

                                            ResultSetMetaData rsmd = rs.getMetaData();
                                            while (rs.next()) { %> 
                                    <tr>
                                        <td>  <%String Uname = rs.getString("username");
                                            out.println(Uname);
                                            %></td>
                                        <td><% int Password = rs.getInt("password");
                                            out.println(Password);
                                            %></td>
                                        <td><%String Email = rs.getString("email");
                                            out.println(Email);
                                            %></td> 
                                        <td><%String Address = rs.getString("address");
                                            out.println(Address);
                                            %></td>
                                        <td><div class="balance"><% int Balance = rs.getInt("balance");
                                            out.println(Balance);

                                                %>

                                                <button class="btn_edit">edit</button>

                                            </div>
                                        </td>
                                    </tr>                                 
                                    <%         }
                                        } catch (ClassNotFoundException e) {
                                            e.printStackTrace();
                                        } catch (SQLException ex) {
                                            out.print("SQLException: " + ex.getMessage());
                                            out.print("SQLState: " + ex.getSQLState());
                                            out.print("VendorError: " + ex.getErrorCode());
                                        }
                                    %>



                                    <!-- Wishlist End -->

                                    <!-- Footer Start -->
                                    <div class="footer">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-6">
                                                    <div class="footer-widget">
                                                        <h2>Get in Touch</h2>
                                                        <div class="contact-info">
                                                            <p><i class="fa fa-map-marker"></i>123 E Store, Los Angeles, USA</p>
                                                            <p><i class="fa fa-envelope"></i>email@example.com</p>
                                                            <p><i class="fa fa-phone"></i>+123-456-7890</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-6">
                                                    <div class="footer-widget">
                                                        <h2>Follow Us</h2>
                                                        <div class="contact-info">
                                                            <div class="social">
                                                                <a href=""><i class="fab fa-twitter"></i></a>
                                                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                                                <a href=""><i class="fab fa-instagram"></i></a>
                                                                <a href=""><i class="fab fa-youtube"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-6">
                                                    <div class="footer-widget">
                                                        <h2>Company Info</h2>
                                                        <ul>
                                                            <li><a href="#">About Us</a></li>
                                                            <li><a href="#">Privacy Policy</a></li>
                                                            <li><a href="#">Terms & Condition</a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-6">
                                                    <div class="footer-widget">
                                                        <h2>Purchase Info</h2>
                                                        <ul>
                                                            <li><a href="#">Payment Policy</a></li>
                                                            <li><a href="#">Shipping Policy</a></li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row payment align-items-center">
                                                <div class="col-md-6">
                                                    <div class="payment-method">
                                                        <h2>We Accept:</h2>
                                                        <img src="img/payment-method.png" alt="Payment Method" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="payment-security">
                                                        <h2>Secured By:</h2>
                                                        <img src="img/godaddy.svg" alt="Payment Security" />
                                                        <img src="img/norton.svg" alt="Payment Security" />
                                                        <img src="img/ssl.svg" alt="Payment Security" />
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
                                                <div class="col-md-6 copyright">
                                                    
                                                </div>

                                                <div class="col-md-6 template-by">
                                                    
                                                </div>
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
                                    </body>
                                    </html>
