<%-- 
    Document   : product
    Created on : Apr 2, 2021, 9:05:43 PM
    Author     : Eng.Aya
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="Home.jsp" class="nav-item nav-link active">Home</a>
                            <a href="product_users.jsp" class="nav-item nav-link">Products</a>

                            <a href="profile.jsp" class="nav-item nav-link">My Profile</a>

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
                            <a href="Home.jsp">
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
                                <input type="radio" id="category" name="search" value="category" >
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
                            <%   HttpSession test = request.getSession(false);
                                ArrayList<Integer> ids = new ArrayList<Integer>();
                                ArrayList<Integer> count = new ArrayList<Integer>();
                                ids = (ArrayList<Integer>) test.getAttribute("productID");
                                count = (ArrayList<Integer>) test.getAttribute("quantityProd");%>
                            <a href="cart.jsp" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span><% out.print(ids.size());  %></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bottom Bar End -->       

       
        <%
        
                Connection con = null;
                PreparedStatement statment;

                String product_name = null;
                String price = null;
                String image = null;
                int id = 0;
                int quantity = 0;

                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1235");
                statment = con.prepareStatement("select id,name,price,image,quantity from product where category_id=2");

                ResultSet result = statment.executeQuery();

                while (result.next()) {
        %>

        
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="Product_Details.jsp?id_product=<%out.println(result.getInt(1)); %>">
                            <%product_name = result.getString(2);
                            out.println(product_name);

                            %></a>
                            


                    </div>
                    <div class="product-image">
                        <a href="Product_Details.jsp?id_product=<%out.println(result.getInt(1)); %>">
                            <%
                                image = result.getString(4);
                                out.println("<img src=\"" + image + "\" width=\"300\" height=\"300\" alt=\"Product Image\">");
                               
                            %>
                        </a>


                        <a href="#" stock class="btn cart">
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
                        <a class="btn" href="cart.jsp"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                    </div>
                </div>
            </div>
        
        <% continue;
            }
             product_name = null;
             price = null;
             image = null;
             id = 0;
             quantity = 0;

           
          
            statment = con.prepareStatement("select id,name,price,image,quantity from product where category_id=1");

            result = statment.executeQuery();
        %>

        <%
            while (result.next()) {
        %>

        
            <div class="col-lg-3">
                <div class="product-item">
                    <div class="product-title">
                        <a href="Product_Details.jsp?id_product=<%out.println(result.getInt(1)); %>">
                            <%product_name = result.getString(2);
                            out.println(product_name);

                            %></a>                         
                    </div>
                    <div class="product-image">
                        <a href="Product_Details.jsp?id_product=<%out.println(result.getInt(1)); %>">
                            <%
                                image = result.getString(4);
                                out.println("<img src=\"" + image + "\" width=\"300\" height=\"300\" alt=\"Product Image\">");
                                
                            %>
                        </a>


                        <a href="#" stock class="btn cart">
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
                        <a class="btn" href="cart.jsp"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                    </div>
                </div>
            </div>
       
        <% continue;
                    }
                
            %>
        
        
      
     <!-- Brand Start -->
        <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/1.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/2.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/3.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/4.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/5.png" width="150" height="80" alt=""></div>
                    <div class="brand-item"><img src="img/6.png" width="150" height="80" alt=""></div>
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
                            <h2>Get in Touch</h2>
                            <div class="contact-info">
                                <p><i class="fa fa-map-marker"></i>Smart Village</p>
                                <p><i class="fa fa-envelope"></i>support@gmail.com</p>
                                <p><i class="fa fa-phone"></i>+01281856864</p>
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
                                <li><a href="#">Pyament Policy</a></li>
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
    </body>
</html>