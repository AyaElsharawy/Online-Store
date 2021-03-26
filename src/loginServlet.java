/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

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
public class loginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("password");
        Connection con = null;
        String username_ = null;
        String pass = null;
        int id = 0 ;
        // ResultSet result;
        PreparedStatement statment;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/souq", "postgres", "1111");
            statment = con.prepareStatement("select id,username,password from users where username=? and password=?");
            statment.setString(1, username);
            statment.setString(2, password);

            ResultSet result = statment.executeQuery();
            boolean check = false;
            while (result.next()) {
                check = true;
                
               username_ = result.getString(2);
               pass = result.getString(3);
                id = result.getInt(1); 
             System.out.println(username+ pass + id); 
            }

            if (check) {
                HttpSession session = request.getSession(true);
                session.setAttribute("check", "true");
                session.setAttribute("username", username_);
                session.setAttribute("password",pass);
                session.setAttribute("id",id);
                //session.setAttribute("username", user_n);
                respond.sendRedirect("Home.html");

                //respond.sendRedirect("Profile_page?username="+first_name);
            } else {
                respond.sendRedirect("loginHtml.html");
            }

            result.close();
            statment.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
