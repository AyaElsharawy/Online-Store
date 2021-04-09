/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.JavaWebProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anton
 */
public class AddToCart extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(true);
        ArrayList<Integer> ids = new ArrayList<Integer>();
    ArrayList<Integer> count = new ArrayList<Integer>();
    
    String id=(String)request.getParameter("ID");
        System.out.println("id"+ id);
    String Quantity=(String)request.getParameter("Quantity");
    System.out.println("Quantity"+Quantity);
        ids.add(Integer.parseInt(id.trim()));
        System.out.println("ids s "+ids.size());
        count.add(Integer.parseInt(Quantity.trim() ));
        System.out.println("count"+count.get(0));
        //HttpSession test = request.getSession(false);
        //System.out.print("hello"+test.getAttribute("userId"));
        //int Quantity = Integer.parseInt(request.getParameter("Quantity"));
        //for (int i=0;i<Quantity;i++){
            //String id=request.getParameter("ID");
            //int x=Integer.parseInt(id.trim());
            //ids=(ArrayList<Integer>)test.getAttribute("productID");
            //ids.add(x);
            //ids.add(6);
            session.setAttribute("productID", ids);
            session.setAttribute("count", count);
            response.sendRedirect("Cart.jsp");
            
        //}
        
        
    }

    

}
