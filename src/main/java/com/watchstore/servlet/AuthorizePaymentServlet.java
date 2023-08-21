package com.watchstore.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.watchstore.dao.CartDaoImp;
import com.watchstore.paypal.PaymentServices;
import com.watchstore.pojo.Cart;
import com.paypal.base.rest.PayPalRESTException;
 
@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public AuthorizePaymentServlet() {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String userId=(String)request.getParameter("userId");
    	System.out.println("User Id : "+userId);
    	List<Cart> listOfproductInCart=new CartDaoImp().getCartByUserId(Integer.parseInt(userId));
         
   //     OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(listOfproductInCart);
 
            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
 
}