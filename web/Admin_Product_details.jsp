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
                            <a href="wishlist.html" class="nav-item nav-link">Product Detail</a>
                            <a href="wishlist.html" class="nav-item nav-link">Customers</a>
                            
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
                    <li class="breadcrumb-item active">Product Details</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Wishlist Start -->
        <div class="Product_Details-page">
            <div class="container-fluid">
                <div class="Product_Details-page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Product image</th>
                                            <th>Product Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Description</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <tr>
                                            <td class="col-width">
                                                <div class="img">
                                                    <a href="#"><img src="img/product-6.jpg" alt="Image"></a>
                                                </div>
                                            </td>
                                            <td class="col-width">
                                            <p>Product Name</p>
                                                </td>
                                            <td class="col-width">$99</td>
                                            
                                            <td class="col-width"> 
                                                <div class="qty">
                                                    <button class="btn-minus"><i class="fa fa-minus"></i></button>
                                                    <input type="text" value="1">
                                                    <button class="btn-plus"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </td>
                                            <td class="col-width"><div >
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum.</div></td>
                                            <td class="col-width"><button><i class="fa fa-trash"></i></button>
                                            <button class="btn-cart">Edite</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-width">
                                                <div class="img">
                                                    <a href="#"><img src="img/product-7.jpg" alt="Image"></a>
                                                    
                                                </div>
                                            </td>
                                            <td class="col-width">
                                            <p>Product Name</p>
                                                </td>
                                            <td class="col-width">$99</td>
                                            <td class="col-width">
                                                <div class="qty">
                                                    <button class="btn-minus"><i class="fa fa-minus"></i></button>
                                                    <input type="text" value="1">
                                                    <button class="btn-plus"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </td>
                                            <td class="col-width"><div  >
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum.</div></td>
                                            <td class="col-width"><button><i class="fa fa-trash"></i></button>
                                            <button class="btn-cart">Edite</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-width">
                                                <div class="img">
                                                    <a href="#"><img src="img/product-8.jpg" alt="Image"></a>
                                                    
                                                </div>
                                            </td>
                                            <td class="col-width">
                                            <p>Product Name</p>
                                                </td>
                                            <td class="col-width">$99</td>
                                            <td class="col-width">
                                                <div class="qty">
                                                    <button class="btn-minus"><i class="fa fa-minus"></i></button>
                                                    <input type="text" value="1">
                                                    <button class="btn-plus"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </td>
                                            <td class="col-width"><div >
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum.</div></td>
                                            <td class="col-width"><button><i class="fa fa-trash"></i></button>
                                            <button class="btn-cart">Edite</button></td>
                                        </tr>
                                        <tr>
                                            <td class="col-width">
                                                <div class="img">
                                                    <a href="#"><img src="img/product-9.jpg" alt="Image"></a>
                                                    
                                                </div>
                                            </td>
                                            <td class="col-width">
                                            <p>Product Name</p>
                                                </td>
                                            <td class="col-width">$99</td>
                                            <td class="col-width">
                                                <div class="qty">
                                                    <button class="btn-minus"><i class="fa fa-minus"></i></button>
                                                    <input type="text" value="1">
                                                    <button class="btn-plus"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </td>
                                            <td class="col-width"><div >
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum.</div></td>
                                            <td class="col-width"><button><i class="fa fa-trash"></i></button>
                                                <button class="btn-cart">Edite</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-width">
                                                <div class="img">
                                                    <a href="#"><img src="img/product-10.jpg" alt="Image"></a>
                                                   
                                                </div>
                                            </td>
                                            <td class="col-width">
                                            <p>Product Name</p>
                                                </td>
                                            <td class="col-width">$99</td>
                                            <td class="col-width">
                                                <div class="qty">
                                                    <button class="btn-minus"><i class="fa fa-minus"></i></button>
                                                    <input type="text" value="1">
                                                    <button class="btn-plus"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </td>
                                            <td class="col-width"><div >
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum.</div></td>
                                            <td class="col-width"><button><i class="fa fa-trash"></i></button>
                                            <button class="btn-cart">Edite</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <button class="btn-insert">Insert New Product</button>
                        </div>
                    </div>
                </div>
            </div>
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
        
        
    </body>
</html>
