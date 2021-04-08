package com.iti.online_store;


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
    
ArrayList<Integer> ids = new ArrayList<Integer>();
ArrayList<Integer> count = new ArrayList<Integer>();
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    

HttpSession session= request.getSession(false);
int id=Integer.parseInt(request.getParameter("id_product").trim());
int Count=Integer.parseInt(request.getParameter("Qua").trim());
//ids =(ArrayList<Integer>)session.getAttribute("productID");
//count =(ArrayList<Integer>)session.getAttribute("quantityProd");

    
    
 //String id=String.valueOf(session.getAttribute("id_product"));
  //  System.out.println("valueeeeeeeeeeeeeeeeeeeeeeeee"+id);
 //String Count=String.valueOf( session.getAttribute("prodQuantity"));
    // System.out.println("countttttttttttt"+Count);
        
   
//int Id=id.trim();
// System.out.println("valueeeeeeeeeeeeeeeeeeeeeeeee"+IdInt);
//int Countt =Integer.parseInt(Count.trim());
// System.out.println("valueeeeeeeeeeeeeeeeeeeeeeeee"+CountInt);

    ids.add(id);
    count.add(Count);
    

                       for (int i = 0; i < ids.size();i++) 
	      { 		      
	          System.out.println(ids.get(i)); 		
	      }   		
                       
                         
                       for (int i = 0; i <count.size();i++) 
	      { 		      
	          System.out.println(count.get(i)); 		
	      }   		
    
    
    
     session.setAttribute("productID", ids);   
     session.setAttribute("quantityProd", count);   
    





//System.out.print("hello"+test.getAttribute("userId"));
//int Quantity = Integer.parseInt(request.getParameter("Quantity"));
//for (int i=0;i<Quantity;i++){
//String id=request.getParameter("ID");
//int x=Integer.parseInt(id.trim());
//ids=(ArrayList<Integer>)test.getAttribute("productID");
//ids.add(x);
//ids.add(6);

response.sendRedirect("cart.jsp");

//}


}





}