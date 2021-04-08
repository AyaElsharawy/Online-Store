/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.online_store;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
        HttpSession session = req.getSession(true);
       // String product_id = String.valueOf(session.getAttribute("id_product"));
     //   System.out.println("save" + product_id);
        Connection conn = null;
        PreparedStatement s;
        PrintWriter out = resp.getWriter();
String id_=req.getParameter("proid");
int Qua_=Integer.parseInt(req.getParameter("Quantity"));
 System.out.println("hiiiiiiii" +  id_);
  System.out.println("hiiiiii" +Qua_);

        
 
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, psqlPassword);
            s = conn.prepareStatement("select quantity  from product where id =" + id_ + "");

            ResultSet rs = s.executeQuery();
          //  int Qua = Integer.parseInt(req.getParameter("Quantity"));
            
            if (rs.next()) {
                int QuaDb = rs.getInt(1);
                if (QuaDb >Qua_) {

                    session.setAttribute("check", "true");
                    session.setAttribute("id_product", id_);
                    session.setAttribute("prodQuantity", Qua_);
                      System.out.println("countttttttttttt"+Qua_);

                    resp.sendRedirect("AddToCart?id_product=" + id_+"&Qua="+Qua_);
                } else {
                    resp.sendRedirect("Product_Details.jsp?id_product=" +id_);
                }
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
