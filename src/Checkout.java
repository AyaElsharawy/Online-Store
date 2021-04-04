/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
import login.loginServlet;

/**
 *
 * @author Hagar
 */
public class Checkout extends HttpServlet {

  
    public void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
          String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
          String address = request.getParameter("address");
      
        Connection con = null;
        int id = 0 ;
  
        // ResultSet result;
        PreparedStatement statment;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1111");
            statment = con.prepareStatement("select id from users where  first_name=? and  last_name=? and  email=?  and  phone=? and  address=? ");
            statment.setInt(1, id);
            

            ResultSet result = statment.executeQuery();
            boolean check = false;
            while (result.next()) {
                check = true;
            }

            if (check) {
                HttpSession session = request.getSession(true);
                session.setAttribute("checkBilling", "true");
                session.setAttribute("userId", id);
                
               
                respond.sendRedirect("Home.html");

            } else {
                respond.sendRedirect("checkout.html");
            }

            result.close();
            statment.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Checkout .class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Checkout .class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    

}
