<%@page import="java.util.ArrayList"%>
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
                            <a href="UserOrders.jsp" class="nav-item nav-link">My Orders</a>

                            

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
                            <a href="UserOrder.jsp">
                                <img src="img/logo.png" alt="Logo">
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
                                    <th>Order ID</th>
                                    <th>Total</th>
                                    <th>Payment Method</th>
                                    <th>Status</th>
                                    <th> Date </th>
                                    <th> Expected Date </th>
                                    <th> Order Details </th>
                                </tr>
                            </thead>
                            <%
                                try {
                                    HttpSession test = request.getSession(false);
                                    int userID= (Integer)(session.getAttribute("id"));
                                    String driver = "org.postgresql.Driver";
                                    String url = "jdbc:postgresql://localhost:5432/souq";
                                    String username = "postgres";
                                    String password = "1235";
                                    String myDataField = null;
                                    String myQuery = "  select * from orders where user_id ="+userID+" group by id,user_id order by date  ; ";
                                    String myQuery2 = " select product_id,quantity from order_product , orders where order_id = id ;";
                                    Connection myConnection = null;
                                    PreparedStatement myPreparedStatement = null;
                                    PreparedStatement myPreparedStatement2 = null;
                                    ResultSet myResultSet = null;
                                    Class.forName(driver).newInstance();
                                    myConnection = DriverManager.getConnection(url, username, password);
                                    System.out.println("Opened database successfully");
                                    myPreparedStatement = myConnection.prepareStatement(myQuery);
                                    myPreparedStatement2 = myConnection.prepareStatement(myQuery2);
                                    ResultSet rs = myPreparedStatement.executeQuery();
                                     ResultSet rs2 = myPreparedStatement2.executeQuery();

                                    ResultSetMetaData rsmd = rs.getMetaData();
                                    
                                    while (rs.next()) { 
                            %> 
                            <tr>
                                <td> 
                                 <%  int OrderID = rs.getInt("id");
                                    out.println(OrderID);
                                    %>
                                </td>
                                <td> 
                                    
                                   <%  int Total = rs.getInt("total");
                                    out.println(Total);
                                    %>
                                
                                </td>
                                <td><% String Payment_Method = rs.getString("payment_method");
                                    out.println(Payment_Method);
                                    %></td>
                                <td><%String Status = rs.getString("status");
                                    out.println(Status);
                                    %></td> 
                                <td><%String date = rs.getString("date");
                                    out.println(date);
                                    %></td>
                                <td>
                                    <%String exp_date = rs.getString("exp_date");
                                    out.println(exp_date);
                                    %>
                                </td>
                                <td>
                                    <%
 
  while (rs2.next()) {
String product_id = rs2.getString("product_id");
String quantity = rs2.getString("quantity");

  out.println("ProductID: "+product_id+"---->"+"Quantity: "+quantity+ "\n");
break;
  } 

                                    %>
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

                        </table>
                    </div>

                    <!-- Wishlist End -->

                    
                    
                    
                    

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
                    <script src="lib/easing/easing.min.js"></script>
                    <script src="lib/slick/slick.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="js/main.js"></script>
                    </body>

                    </html>
                    </body>
                    </html>
