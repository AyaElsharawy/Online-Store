/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductDetails;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hagar
 */
public class saveQuantity extends HttpServlet {
    private final String url = "jdbc:postgresql://localhost/souq";
    private final String user = "postgres";
    private final String psqlPassword = "1111";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String ID = req.getParameter("ID");
        
        Connection conn = null ;
        PreparedStatement s ;
        PrintWriter out = resp.getWriter();
        
          try {
              Class.forName("org.postgresql.Driver");
               conn = DriverManager.getConnection(url , user ,psqlPassword);
               s=conn.prepareStatement("select quantity  from product where id = 1 ");
              // s.setString(1, name);
               ResultSet rs = s.executeQuery();
                 int Qua = Integer.parseInt(req.getParameter("Quantity"));
               if(rs.next()) {
         //   out.println("<hrml> <body> <h1 style=\"color:green\">  user exist </h1> </body> </html>");
                
                  int QuaDb =  rs.getInt(1);
                  if ( QuaDb > Qua )
                    
                  {
                  
                  
                   HttpSession session = req.getSession(true);
                session.setAttribute("check", "true");
                session.setAttribute("productID", ID);
                session.setAttribute("prodQuantity",Qua);
                    resp.sendRedirect("ProductDetails");  
                  
                  }
                   
                
                  
                
        
                  else
                       resp.sendRedirect("ProductDetails");  
               }
        else {
                   
              resp.sendRedirect("ProductDetails");  
               }
         rs.close();
        s.close();
        conn.close();
               
               
            
          } catch (ClassNotFoundException ex) {
              Logger.getLogger(saveQuantity.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              Logger.getLogger(saveQuantity.class.getName()).log(Level.SEVERE, null, ex);
          }
         
        
        
    }

   
}
