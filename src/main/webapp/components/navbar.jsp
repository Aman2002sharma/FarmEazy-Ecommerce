<%@ page import ="com.watchstore.pojo.*"%>
<%@ page import ="com.watchstore.dao.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%
     User user=(User)session.getAttribute("active-user"); 
%>

<%
         BrandDaoImp bdao=new BrandDaoImp();
         List<Brand> cl=bdao.getAllBrand();
         WatchDaoImp cdao=new WatchDaoImp();
         List<Watch> cll=cdao.getAllWatch();
%>

<nav class="navbar navbar-expand-lg navbar-light custom-bg sticky-top">

<div class="container-fluid">
  <a class="navbar-brand" href="index.jsp" style="color:white"><h3><span class="	fa fa-pagelines " style="color:white"></span> FarmEazy</h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="
    flex-wrap: wrap;
    justify-content: center;
  ">
    <ul class="navbar-nav mr-auto" >
    
    
    <%
         if(user!=null)
         {
        	 
        	 String userType=user.getUserType();
        	 if(userType.equals("admin"))
        	 {
    %>
                 <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp" style="color:white"><b>Admin Page</b> <span class="sr-only">(current)</span></a>
                 </li>
    <%
        	 }
         }
    %>
      <li class="nav-item active dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white">
         <b> Brands</b>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="index.jsp?category=0" style="color:white">All</a>
               <%
                    for(Brand c: cl)
                    {    	
               %> 
                         <a class="dropdown-item" href="index.jsp?category=<%=c.getBrandId() %>"><%=c.getBrandTitle() %></a>     
               <%
                    }
               %>
          
        </div>
      </li>
      
      <li class="nav-item active dropdown" >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white">
         <b> Categories</b>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="index.jsp?watch=0" style="color:white" >All</a>
               <%
                    for(Watch c: cll)
                    {    	
               %> 
                         <a class="dropdown-item" href="index.jsp?watch=<%=c.getWatchId() %>"><%=c.getWatchTitle() %></a>     
               <%
                    }
               %>
          
        </div>
      </li>
      
      <li class="nav-item active ml-2" data-toggle="modal" data-target=".aboutusmodal">
          <div class="nav-link" style="color:white;cursor: pointer" ><b>About us</b></div>
      </li>
      
      <li class="nav-item active ml-2" data-toggle="modal" data-target=".contactusmodal">
          <div class="nav-link" style="color:white;cursor: pointer" ><b>Contact us</b></div>
      </li>
     
    </ul>
    
    <form class="form-inline my-2 my-lg-0 custom-search flex-grow-1 order-1 order-xl-0" action="ProductOperationServlet" method="post">
      <input type="hidden" name="action" value="searchProduct">
      <input class="form-control mr-sm-2" type="text" placeholder="Search product" aria-label="Search" name="search">
      <button type="submit" class="btn btn-light" style="color:black"><b>Search</b></button>
    </form>
    
    <%
        if(user!=null)
        {
        	  
    %>
    
          <ul class="navbar-nav ml-auto">
              
              <%
                  if(user.getUserType().equals("normal"))
                  {
              %>
                     <li class="nav-item active" data-toggle="modal" data-target="#showmycartmodal">
                        <div class="nav-link"><img src="images/cart.png" style="width:23px;" alt="img">(<%=new CartDaoImp().totalCartByUserId(user.getUserId()) %>)</div>
                     </li> 
                     
                     <li class="nav-item active" data-toggle="modal" data-target="#showmyordermodal">
                        <a class="nav-link" href="#"><b>My Orders</b></a>
                     </li>
              <%
                  }
              %>
          
             <li class="nav-item active">
             <div class="nav-link" data-toggle="modal" data-target="#showprofilemodal" style="color:white"><b><%= user.getUserName()%></b></div>
             </li> 
             
             <li class="nav-item active">
             <div class="nav-link" data-toggle="modal" data-target=".changepasswordmodal" style="color:white"><b>change password</b></div>
             </li>  
      
             <li class="nav-item active" data-toggle="modal" data-target=".logout-modal">
             <a class="nav-link" href="#" style="color:white"><b>Logout</b></a>
             </li>    
         </ul>
   
    <%
        }
    
        else
        {
    %>
    <ul class="navbar-nav ml-auto">
       <li class="nav-item active">
        <div class="nav-link" data-toggle="modal" data-target=".forgetpasswordmodal" style="color:white"><b>Forget password</b></div>
      </li> 
    
      <li class="nav-item active">
        <a class="nav-link" href="register.jsp" style="color:white"><b>Register</b></a>
      </li>  
      
      <li class="nav-item active">
        <a class="nav-link" href="login.jsp" style="color:white"><b>Login</b></a>
      </li>    
    </ul>
    
    <%
        }
    %>     
    
  </div>
  </div>
</nav>

<!-- show profile modal -->

<div class="modal fade" id="showprofilemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY PROFILE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form >
         
         <div class="container text-center">
                   <img style="max-width:200px" class="img-fluid rounded-circle" src="userProfilePic/<%if(user!=null){ %><%=user.getUserPic() %><%} %>" alt="users_pic" >
         </div> 
         
  <div class="form-row mt-3">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4" value="<%if(user!=null){ %><%=user.getUserName() %><%} %>" readonly>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" value="<%if(user!=null){ %><%=user.getUserEmail() %><%} %>" readonly>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Phone</label>
      <input type="text" class="form-control" id="inputPassword4" value="<%if(user!=null){ %><%=user.getUserPhone() %><%} %>" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <textarea class="form-control" id="inputAddress" placeholder="1234 Main St" rows="3" readonly><%if(user!=null){ %><%=user.getUserAddress() %><%} %></textarea>
  </div>
 
  <div class="container text-center">
       <button type="button" class="btn custom-bg text-light" data-dismiss="modal">Close</button>
  </div>   
</form>
      </div>
    </div>
  </div>
</div>

<!--  -->

<!-- show my cart modal -->

<div class="modal fade" id="showmycartmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY CART</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <%
      if(user!=null)
      {
    	  List<Cart> l=new CartDaoImp().getCartByUserId(user.getUserId());
    	 
     %>
      <div class="modal-body">
        
        <%
            if(l.isEmpty())
            {
        %>
        <div class="text-center">
        <h1>CART IS EMPTY!!</h1>
        <hr>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        <%
            }
        
            else
            {
            	
            	
        %>
        <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Product Image</th>
      <th scope="col">Product Title</th>    
      <th scope="col">Product Description</th>
      <th scope="col">Product Brand</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
 
  
  <tbody>
   <%
      CartDaoImp ctdao=new CartDaoImp();
      
   %>
  
   <%
      for(Cart c:l)
      {
    	  int productId=c.getProductId();
    	  Product p=new ProductDaoImp().getProductById(productId);
   %>
    <tr class="text-center">
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="productImages/<%=p.getProductPhoto() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=p.getProductTitle() %></td>
      <td class="mid-align"><%=p.getProductDescription() %></td>
      <td class="mid-align"><%=new BrandDaoImp().getBrandNameById(p.getCategoryId()) %></td>
      <td class="mid-align"><%=c.getQuantity() %></td>
      <td class="mid-align"><%=c.getPrice() %></td>
      <td class="mid-align"><a href="CartServlet?cartId=<%=c.getCartId()%>&action=delete"><button type="button" class="btn btn-danger">Remove</button></a></td>
    </tr>
    <%
      }
    %>
  </tbody>
 
  
</table>
</div>
<hr>

<div class="text-right">
    <p style="font-size:25px;"><b>Total Price :&#36;<%=new CartDaoImp().totalPriceFromCart(user.getUserId()) %>/- </b></p> 
</div>
<hr>
<div class="row">
      <form action="authorize_payment" method="post">
          <input type="hidden" name="userId" value="<%=user.getUserId()%>">
          <input type="submit" class="btn custom-bg text-light ml-5" value="Order">
   </form>
   <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
</div>

       <%
            }
       %>
         
      </div>
  <%
           
      }
  %>
    </div>
  </div>
</div>

<!--  -->

<!-- show my order modal -->

<div class="modal fade" id="showmyordermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-size" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY ORDERS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <%
      if(user!=null)
      {
    	  List<Order> l=new OrderDaoImp().getOrderByUserId(user.getUserId());
    	 
     %>
      <div class="modal-body">
        
        <%
            if(l.isEmpty())
            {
        %>
        <div class="text-center">
        <h1>NO ORDERS MADE BY YOU !!</h1>
        <hr>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        <%
            }
        
            else
            {
            	
            	
        %>
        <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Product Image</th>
      <th scope="col">Product Title</th> 
      <th scope="col">Product Description</th>
      <th scope="col">Product Brand</th>   
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Ordered Date</th>
      <th scope="col">Delivery Date</th>
    </tr>
  </thead>
  
 
  
  <tbody>
   <%
      OrderDaoImp odao=new OrderDaoImp();
      
   %>
  
   <%
      for(Order o:l)
      {
    	  int productId=o.getProdctId();
    	  Product p=new ProductDaoImp().getProductById(productId);
   %>
    <tr class="text-center">
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="productImages/<%=p.getProductPhoto() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=p.getProductTitle() %></td>
      <td class="mid-align"><%=p.getProductDescription() %></td>
      <td class="mid-align"><%=new BrandDaoImp().getBrandNameById(p.getCategoryId()) %></td>
      <td class="mid-align"><%=o.getQuantity() %></td>
      <td class="mid-align"><%=o.getPrice() %></td>
      <td class="mid-align"><%=o.getOrderesDate() %></td>
      <td class="mid-align"><%if(o.getDeliveryDate().equals("0")){ %><span style="color:red;"> <%="processing.."%></span>    <%} else { %> <%=o.getDeliveryDate() %><%} %></td>
    </tr>
    <%
      }
    %>
  </tbody>
 
  
</table>
<hr>

<div class="text-right">
    <p style="font-size:25px;"><b>Total Price :&#36;<%=new OrderDaoImp().totalOrderPrice(user.getUserId()) %>/- </b></p> 
</div>
<hr>

      <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Close</button>

       <%
            }
       %>
         
      </div>
  <%
           
      }
  %>
    </div>
  </div>
</div>
</div>

<!--  -->

<!-- Logout modal -->

<div class="modal fade logout-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Log Out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body text-center">
            <h5>Do you want to logout?</h5>
          
          <div class="text-center">
            <a href="LoginServlet"><button type="button" class="btn custom-bg text-white">Yes</button></a>
            <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">No</button>
          </div> 
     </div>     
    </div>
  </div>
</div>

<!-- *********** -->

<!-- About us modal -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >About Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container" >
        <p style="font-size:20px;">
          <b><center><h1>About Us</h1></center>
          <h2>Introduction:</h2></b>
              Welcome to FarmEazy, where we bring the heart of the farm to your doorstep. Our journey began with a simple idea: to connect individuals and families with the goodness of fresh, high-quality farming products. As passionate farmers ourselves, we understand the value of wholesome, sustainably grown produce, and we're excited to share our harvest with you.<br><br><h2>Mission:</h2>Also to provide comprehensive information about different crops and their cultivation practices, and to demystify the world of government subsidies and assistance programs available to farmers. We understand that navigating bureaucracy can be overwhelming, and we're dedicated to simplifying this process for you.<br>
              At FarmEazy, our mission is simple yet profound: to bring the farm closer to you. We believe that everyone deserves access to farm-fresh products that are grown and harvested with care. By supporting local farmers and artisans, we strive to foster a stronger connection between urban and rural communities.
               <br><br><b></b><h2>Quality and Sustainability:</h2></b>   
               We take great pride in the quality of our products. From the moment a seed is planted to the instant a product arrives at your door, we adhere to the highest standards of quality and freshness. Our commitment to sustainable farming practices not only ensures the well-being of the environment but also contributes to the vitality of the communities we serve.
               <br><br><h2>Unlocking Opportunities: Government Subsidy Guidance:</h2>We recognize the vital role government subsidies play in sustaining agriculture. Our platform serves as a compass to navigate through the intricacies of subsidy programs, grants, and financial support available to farmers. We break down eligibility criteria, application processes, and deadlines, ensuring you never miss an opportunity to secure the assistance you deserve.
               <br><br><b><h2>Join Us in Cultivating Change:</h2></b>
               Embark on a journey of knowledge and growth with FarmEazy. Together, we're cultivating a future where every farmer has the tools to succeed, crops flourish, and communities thrive. Let's sow the seeds of change today.
               <br><br><br>
               <center>
               <h2>Founded By:</h2>
               <h2>Aman Sharma</h2><br><br>
               <img alt="Avatar" src="images/IMG_20230730_040331.jpg" style="border-radius: 50%;width:130px;">
               </center>
                   
                
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- Contact us modal -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Contact Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container text-center">
        <p style="font-size:23px;">
            <b>
                <img src="images/phonee.png" style="width:27px;" alt="img">+91 8817173005<br>
                <img src="images/emaill.png" style="width:29px;" alt="img"><a href="https://mail.google.com/mail/u/0/#inbox?compose=new">aman2002sharmaaaa@gmail.com</a>
            </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- change password modal -->

<div class="modal fade changepasswordmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" style="color:white" >Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="LoginServlet" method="post">
          <input type="hidden" name="action" value="changePassword">
         
  <div class="form">
 
    <div class="form-group ">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" value="<%if(user!=null){ %><%=user.getUserEmail() %><%} %>" readonly>
    </div>
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="pass" name="pass" >
    </div>
    <div class="form-group">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="cpass" name="cpass">
    </div>
  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn custom-bg text-light" value="Change">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>


<!--  -->

<!-- forget password modal -->

<div class="modal fade forgetpasswordmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" style="color:white" >Forget Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="LoginServlet" method="post">
          <input type="hidden" name="action" value="forgetPassword">
         
  <div class="form">
 
    <div class="form-group ">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="email" name="email">
    </div>
    <div class="form-group ">
      <label for="inputPassword4">Phone</label>
      <input type="text" class="form-control" id="phone" name="phone">
    </div>
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="pass" name="pass" >
    </div>
    <div class="form-group">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="cpass" name="cpass">
    </div>
  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn custom-bg text-light" value="Change">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>


<!--  -->

