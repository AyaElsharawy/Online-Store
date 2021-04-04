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

/**
 *
 * @author anton
 */
public class AddToCart extends HttpServlet {
    ArrayList<Integer> ids = new ArrayList<Integer>();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int Quantity = Integer.parseInt(request.getParameter("Quantity"));
        //for (int i=0;i<Quantity;i++){
            ids.add(Integer.parseInt(request.getParameter("ID")));
            
        //}
        response.sendRedirect("home.jsp");
        
    }

    

}
