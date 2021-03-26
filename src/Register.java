/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package register;

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

/**
 *
 * @author Hagar
 */
public class Register extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        String firstname = request.getParameter("fname");
        String lastname = request.getParameter("lname");
        String username = request.getParameter("uname");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String birthday = request.getParameter("birthday");
        String balance = request.getParameter("balance");            
        String job = request.getParameter("job");    
  
       
        Connection con = null;
        
      
        
        // ResultSet result;
        PreparedStatement statment;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1111");
            statment = con.prepareStatement("insert into users (first_name,last_name, username , email, password ,address, phone , birthday , balance , job) values (?,?,?,?,?,?,?,?,?,?)  ");
            statment.setString(1, firstname);
            statment.setString(2, lastname);
            statment.setString(3, username);
            statment.setString(4, mail);
            statment.setString(5, password );
            statment.setString(6, address);
            statment.setString(7,  mobile);
            statment.setString(8, birthday );
            statment.setString(9, balance);
            statment.setString(10, job);

            ResultSet result = statment.executeQuery();
           
           
           
                HttpSession session = request.getSession(true);
                session.setAttribute("check", "true");
                session.setAttribute("fname", firstname);
                session.setAttribute("lname",lastname);
                session.setAttribute("username", username);
                session.setAttribute("mail",mail);
               
                session.setAttribute("password",password);
                session.setAttribute("address", address);
                session.setAttribute(" mobile", mobile );
                session.setAttribute("birthday",birthday);
                session.setAttribute("balance", balance);
                session.setAttribute(" job", job  );
               
                
                
                
                
                
                

                //respond.sendRedirect("Profile_page?username="+first_name);
       
                respond.sendRedirect("Home.html");
            

            result.close();
            statment.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
