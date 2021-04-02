/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductDetails;

import java.io.*;  
    import javax.servlet.*;  
    import javax.servlet.http.*;  
    import java.sql.*;  
        
    public class ProductDetails extends HttpServlet  
    {    
    private final String url = "jdbc:postgresql://localhost/souq";
    private final String user = "postgres";
    private final String psqlPassword = "1111";
        
        
        
        
         public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException 
          {  
              
              
             PrintWriter out = res.getWriter();  
             res.setContentType("text/html");  
             
              String ID = req.getParameter("id");
             
             
             
             
             
             out.println("<!DOCTYPE html>\n" +
"<html lang=\"en\">\n" +
"    <head>\n" +
"        <meta charset=\"utf-8\">\n" +
"        <title>E Store - eCommerce HTML Template</title>\n" +
"        <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n" +
"        <meta content=\"eCommerce HTML Template Free Download\" name=\"keywords\">\n" +
"        <meta content=\"eCommerce HTML Template Free Download\" name=\"description\">\n" +
"\n" +
"        <!-- Favicon -->\n" +
"        <link href=\"img/favicon.ico\" rel=\"icon\">\n" +
"\n" +
"        <!-- Google Fonts -->\n" +
"        <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap\" rel=\"stylesheet\">\n" +
"\n" +
"        <!-- CSS Libraries -->\n" +
"        <link href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" rel=\"stylesheet\">\n" +
"        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\" rel=\"stylesheet\">\n" +
"        <link href=\"lib/slick/slick.css\" rel=\"stylesheet\">\n" +
"        <link href=\"lib/slick/slick-theme.css\" rel=\"stylesheet\">\n" +
"\n" +
"        <!-- Template Stylesheet -->\n" +
"        <link href=\"css/style.css\" rel=\"stylesheet\">\n" +
"    </head>\n" +
"\n" +
"    <body>");  
             try 
             {  
                 Class.forName("org.postgresql.Driver");  
                 Connection con = DriverManager.getConnection(url, user,  psqlPassword);  
             
                 Statement stmt = con.createStatement();  
                 
                 
                 ResultSet rs = stmt.executeQuery("select * from product where id = 1");  
             
                 
                 
                 
                 
                 
                 
                 out.println(" <div class=\"nav\">\n" +
"            <div class=\"container-fluid\">\n" +
"                <nav class=\"navbar navbar-expand-md bg-dark navbar-dark\">\n" +
"                    <a href=\"#\" class=\"navbar-brand\">MENU</a>\n" +
"                    <button type=\"button\" class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#navbarCollapse\">\n" +
"                        <span class=\"navbar-toggler-icon\"></span>\n" +
"                    </button>\n" +
"\n" +
"                    <div class=\"collapse navbar-collapse justify-content-between\" id=\"navbarCollapse\">\n" +
"                        <div class=\"navbar-nav mr-auto\">\n" +
"                            <a href=\"index.html\" class=\"nav-item nav-link active\">Home</a>\n" +
"                            <a href=\"product-list.html\" class=\"nav-item nav-link\">Products</a>\n" +
"                      \n" +
"                            <a href=\"my-account.html\" class=\"nav-item nav-link\">My Profile</a>\n" +
"                        \n" +
"                        </div>\n" +
"                        <div class=\"navbar-nav ml-auto\">\n" +
"                            <div class=\"nav-item dropdown\">\n" +
"                                <a href=\"#\" class=\"nav-link dropdown-toggle\" data-toggle=\"dropdown\">User Account</a>\n" +
"                                <div class=\"dropdown-menu\">\n" +
"                                    <a href=\"#\" class=\"dropdown-item\">Login</a>\n" +
"                                    <a href=\"#\" class=\"dropdown-item\">Register</a>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </nav>\n" +
"            </div>\n" +
"        </div>\n" +
"        <!-- Nav Bar End -->      \n" +
"        \n" +
"        <!-- Bottom Bar Start -->\n" +
"        <div class=\"bottom-bar\">\n" +
"            <div class=\"container-fluid\">\n" +
"                <div class=\"row align-items-center\">\n" +
"                    <div class=\"col-md-3\">\n" +
"                        <div class=\"logo\">\n" +
"                            <a href=\"index.html\">\n" +
"                                <img src=\"img/logo.png\" alt=\"Logo\">\n" +
"                            </a>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-6\">\n" +
"                        <div class=\"search\">\n" +
"                            <input type=\"text\" placeholder=\"Search\">\n" +
"                            <button><i class=\"fa fa-search\"></i></button>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-3\">\n" +
"                        <div class=\"user\">\n" +
"                            \n" +
"                            <a href=\"cart.html\" class=\"btn cart\">\n" +
"                                <i class=\"fa fa-shopping-cart\"></i>\n" +
"                                <span>(0)</span>\n" +
"                            </a>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"        <!-- Bottom Bar End -->       \n" +
"        \n" +
"        <!-- Breadcrumb Start -->\n" +
"        <div class=\"breadcrumb-wrap\">\n" +
"            <div class=\"container-fluid\">\n" +
"                <ul class=\"breadcrumb\">\n" +
"                    <li class=\"breadcrumb-item\"><a href=\"#\">Home</a></li>\n" +
"                    <li class=\"breadcrumb-item\"><a href=\"#\">Products</a></li>\n" +
"                    <li class=\"breadcrumb-item active\">Product Detail</li>\n" +
"                </ul>\n" +
"            </div>\n" +
"        </div>\n" +
"        <!-- Breadcrumb End -->\n" +
"        \n" +
"        <!-- Product Detail Start -->\n" +
"        <div class=\"product-detail\">\n" +
"            <div class=\"container-fluid\">\n" +
"                <div class=\"row\">\n" +
"                    <div class=\"col-lg-8\">\n" +
"                        <div class=\"product-detail-top\">\n" +
"                            <div class=\"row align-items-center\">\n" +
"                                <div class=\"col-md-5\">\n" +
"                                    <div class=\"product-slider-single normal-slider\">");  
                 
                 //      out.println("<tr><th>name</th><th>pass</th><tr>");  
                 while (rs.next()) 
                 {  
                    int prodID = rs.getInt(1);  
                     String prodName = rs.getString(2);
                     String prodDesc = rs.getString(3);  
                     String prodImg = rs.getString(4);
                     int prodPrice = rs.getInt(5);  
                      int prodQuant = rs.getInt(6);
                      int prodCat = rs.getInt(7);  
                     
                     
                     
                     out.println(" <img src=\""+prodImg+" \" alt=\"Product Image\">");  
                     out.println(" </div>\n" +
"                                   \n" +
"                                </div>\n" +
"                                <div class=\"col-md-7\">\n" +
"                                    <div class=\"product-content\">\n" +
"                                        <div class=\"title\"><h2>"); 
                     
                     
                     
                       out.println(prodName+ "</h2></div>\n" +
"                                       \n" +
"                                        <div class=\"price\">\n" +
"                                            <h4>Price:</h4>\n" +
"                                            <p>");  
                       
                       
                        out.println( prodPrice+ "</p>\n" +
"                                        </div>\n" +
"                                        <div class=\"quantity\">\n" +
"                                            <h4>Quantity:</h4>\n" +
"                                            <div class=\"qty\">");  
                        
                        out.println(" <form method=\"get\"  action=\"saveQuantity\">\n" +
"                                               \n" +
"                                               <input type=\"text\"  name=\"Quantity\">\n" +
"                                               \n" +
                              "  <input type=\"hidden\"  name=\"ID\" value=\""+prodID+" \">\n" +
"                                               \n" +
                                
"                                            </div>\n" +
"                                        </div>    \n" +
"                                        <div class=\"action\">\n" +
"                                            <input type=\"submit\" value=\"Add to cart\">\n" +
"                                           </form> \n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                        \n" +
"                        <div class=\"row product-detail-bottom\">\n" +
"                            <div class=\"col-lg-12\">\n" +
"                                <ul class=\"nav nav-pills nav-justified\">\n" +
"                                    <li class=\"nav-item\">\n" +
"                                        <a class=\"nav-link active\" data-toggle=\"pill\" href=\"#description\">Description</a>\n" +
"                                    </li>\n" +
"                                   \n" +
"                                </ul>\n" +
"\n" +
"                                <div class=\"tab-content\">\n" +
"                                    <div id=\"description\" class=\"container tab-pane active\">\n" +
"                                        <h4>Product description</h4>\n" +
"                                        <p>");
                        
                        
                        out.println(prodDesc+ " </p>\n" +
"                                    </div>\n" +
"                                    \n" +
"                            \n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                        ");
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                 }  
                 
                 
                 out.println("  </div>\n" +
"                    \n" +
"                    \n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"        <!-- Product Detail End -->\n" +
"        \n" +
"       \n" +
"        \n" +
"       <!-- Footer Start -->\n" +
"       <div class=\"footer\">\n" +
"        <div class=\"container-fluid\">\n" +
"            <div class=\"row\">\n" +
"                <div class=\"col-lg-3 col-md-6\">\n" +
"                    <div class=\"footer-widget\">\n" +
"                        \n" +
"                    </div>\n" +
"                </div>\n" +
"                \n" +
"                <div class=\"col-lg-3 col-md-6\">\n" +
"                    <div class=\"footer-widget\">\n" +
"                        \n" +
"                    </div>\n" +
"                </div>\n" +
"\n" +
"                <div class=\"col-lg-3 col-md-6\">\n" +
"                    <div class=\"footer-widget\">\n" +
"                        <h2>Copy Rights : ITI - Telecom 41 </h2> \n" +
"                    </div>\n" +
"                </div>\n" +
"\n" +
"                <div class=\"col-lg-3 col-md-6\">\n" +
"                    <div class=\"footer-widget\">\n" +
"                       \n" +
"                        \n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"            \n" +
"            <div class=\"row payment align-items-center\">\n" +
"                <div class=\"col-md-6\">\n" +
"                    <div class=\"payment-method\">\n" +
"                        \n" +
"                    </div>\n" +
"                </div>\n" +
"                <div class=\"col-md-6\">\n" +
"                    \n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"    </div>\n" +
"    <!-- Footer End -->\n" +
"    \n" +
"    <!-- Footer Bottom Start -->\n" +
"    <div class=\"footer-bottom\">\n" +
"        <div class=\"container\">\n" +
"            <div class=\"row\">\n" +
"               \n" +
"            </div>\n" +
"        </div>\n" +
"    </div>\n" +
"    <!-- Footer Bottom End -->       \n" +
"        <!-- Back to Top -->\n" +
"        <a href=\"#\" class=\"back-to-top\"><i class=\"fa fa-chevron-up\"></i></a>\n" +
"        \n" +
"        <!-- JavaScript Libraries -->\n" +
"        <script src=\"https://code.jquery.com/jquery-3.4.1.min.js\"></script>\n" +
"        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js\"></script>\n" +
"        <script src=\"lib/easing/easing.min.js\"></script>\n" +
"        <script src=\"lib/slick/slick.min.js\"></script>\n" +
"        \n" +
"        <!-- Template Javascript -->\n" +
"        <script src=\"js/main.js\"></script>\n" +
"    </body>\n" +
"</html>");  
                 
                 rs.close();   
                 con.close();  
                 stmt.close();
                }  
                 catch (Exception e) 
                {  
                // out.println("error");  
             }
             
       
             
         }  
     }  
