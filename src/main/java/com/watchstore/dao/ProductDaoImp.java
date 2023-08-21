package com.watchstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.watchstore.dbUtility.DBUtility;
import com.watchstore.pojo.Product;

public class ProductDaoImp implements ProductDao
{

	@Override
	public boolean addProduct(Product product)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="insert into Product(productTitle,productDescription,productPhoto,productPrice,productDiscount,productQuantity,watchId,brandId) values(?,?,?,?,?,?,?,?)";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,product.getProductTitle());
    	    stmt.setString(2,product.getProductDescription());
    	    stmt.setString(3,product.getProductPhoto());
    	    stmt.setInt(4,product.getProductPrice());
    	    stmt.setInt(5,product.getProductDiscount());
    	    stmt.setInt(6,product.getProductQuantity());
    	    
    	    stmt.setInt(7,product.getWatchId());
    	    stmt.setInt(8,product.getCategoryId());
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}
	
	@Override
	public List<Product> getAllProduct()
	{
		Connection con=DBUtility.getConnection();
		String query="select * from product";
		ResultSet rs;
		Statement stmt;
		Product product;
		List<Product> li=new ArrayList<>();
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        product=new Product(rs.getInt("productId"), rs.getInt("productPrice") , rs.getInt("productDiscount") ,rs.getInt("productQuantity") , rs.getInt("brandId") ,
    	    			rs.getString("productTitle"), rs.getString("productDescription") , rs.getString("productPhoto") ); 
    	        product.setWatchId(rs.getInt("watchId"));
    	        
    	        li.add(product);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
	}

	@Override
	public List<Product> getProductByCategory(int brandId)
	{
		Connection con=DBUtility.getConnection();
		String query="select * from product where brandId="+brandId;
		ResultSet rs;
		Statement stmt;
		Product product;
		List<Product> li=new ArrayList<>();
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        product=new Product(rs.getInt("productId"), rs.getInt("productPrice") , rs.getInt("productDiscount") ,rs.getInt("productQuantity") , rs.getInt("brandId") ,
    	    			rs.getString("productTitle"), rs.getString("productDescription") , rs.getString("productPhoto") ); 
    	        product.setWatchId(rs.getInt("watchId"));
    	        
    	        li.add(product);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
	}
	
	@Override
	public List<Product> getProductByWatch(int watchId)
	{
		Connection con=DBUtility.getConnection();
		String query="select * from product where watchId="+watchId;
		ResultSet rs;
		Statement stmt;
		Product product;
		List<Product> li=new ArrayList<>();
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        product=new Product(rs.getInt("productId"), rs.getInt("productPrice") , rs.getInt("productDiscount") ,rs.getInt("productQuantity") , rs.getInt("brandId") ,
    	    			rs.getString("productTitle"), rs.getString("productDescription") , rs.getString("productPhoto") ); 
    	        product.setWatchId(rs.getInt("watchId"));
    	       
    	        li.add(product);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
	}

	@Override
	public List<Product> getSearchedProduct(String productName)
	{
		Connection con=DBUtility.getConnection();
		ResultSet rs;
		Statement stmt;
		Product product;
		List<Product> li=new ArrayList<>();
		String query="select * from product where productTitle LIKE '%"+productName+"%' ";
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        product=new Product(rs.getInt("productId"), rs.getInt("productPrice") , rs.getInt("productDiscount") ,rs.getInt("productQuantity") , rs.getInt("brandId"),
    	                         rs.getString("productTitle"), rs.getString("productDescription") , rs.getString("productPhoto") ); 
    	        product.setWatchId(rs.getInt("watchId"));
    	        
    	        li.add(product);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
		
	}

	@Override
	public Product getProductById(int productId) 
	{
		Connection con=DBUtility.getConnection();
		ResultSet rs;
		Statement stmt;
		Product product = null;
		
		String query="select * from product where productId="+productId;
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        product=new Product(rs.getInt("productId"), rs.getInt("productPrice") , rs.getInt("productDiscount") ,rs.getInt("productQuantity") , rs.getInt("brandId"),
    	                         rs.getString("productTitle"), rs.getString("productDescription") , rs.getString("productPhoto") ); 
    	        product.setWatchId(rs.getInt("watchId"));
    	        
    	        
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return product;
	}

	@Override
	public int getTotalProduct()
	{
		   int totalProduct=0;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(productId) from product";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  totalProduct=rs.getInt("count(productId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		   return totalProduct;  
	}

	@Override
	public boolean deleteProductById(int productId)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="delete from product where productId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setInt(1,productId);
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}

	@Override
	public boolean updateProduct(Product product)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="update product set productTitle=?,productDescription=?,productPhoto=?,productPrice=?, productDiscount=?,productQuantity=? where productId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,product.getProductTitle());
    	    stmt.setString(2,product.getProductDescription());
    	    stmt.setString(3,product.getProductPhoto());
    	    stmt.setInt(4,product.getProductPrice());
    	    stmt.setInt(5,product.getProductDiscount());
    	    stmt.setInt(6,product.getProductQuantity());
    	    stmt.setInt(7,product.getProductId());
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}

	@Override
	public int getQuantityByProductId(int productId)
	{
		   int quantity=0;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select quantity from product where productId="+productId;
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  quantity=rs.getInt("quantity");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		   return quantity;  
	}

	@Override
	public void updateQuantityAfterOrder(int productId,int productQuantity)
	{
		
    	Connection con=DBUtility.getConnection();
    	String query="update product set productQuantity=? where productId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setInt(1,productQuantity);
    	    stmt.setInt(2, productId);
    	    stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
	}

	@Override
	public boolean deleteProductByCategoryId(int categoryId)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="delete from product where brandId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setInt(1,categoryId);
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}
	
	@Override
	public boolean deleteProductByWatchId(int watchId)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="delete from product where watchId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setInt(1,watchId);
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}

	@Override
	public int getTotalProductOfCategoryById(int categoryId)  // Category=brand
	{	
		   int totalProduct=0;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(productId) from product where brandId="+categoryId;
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  totalProduct=rs.getInt("count(productId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		   return totalProduct;  	
	}
	
	@Override
	public int getTotalProductOfWatchById(int watchId)
	{	
		   int totalProduct=0;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(productId) from product where watchId="+watchId;
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  totalProduct=rs.getInt("count(productId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		   return totalProduct;  	
	}

	@Override
	public List<Product> getSearchedProduct( int brandId, int watchId, int productRange)
	{
		Connection con=DBUtility.getConnection();
		ResultSet rs;
		Statement stmt;
		Product product;
		List<Product> li=new ArrayList<>();
		String query=null;
		
		if(productRange==500)
		{
		    query="select * from product where brandId="+brandId+" and watchId="+watchId+" and productPrice<="+500;
		}
		
		else if(productRange==1000)
		{
		   query="select * from product where brandId="+brandId+" and watchId="+watchId+" and productPrice<="+1000;
		}
		
		else if(productRange==2000)
		{
		  query="select * from product where brandId="+brandId+" and watchId="+watchId+" and productPrice<="+2000;
		}
		
		else if(productRange==2001)
		{
		  query="select * from product where brandId="+brandId+" and watchId="+watchId+" and productPrice>="+2000;
		}
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        product=new Product(rs.getInt("productId"), rs.getInt("productPrice") , rs.getInt("productDiscount") ,rs.getInt("productQuantity") , rs.getInt("brandId"),
    	                         rs.getString("productTitle"), rs.getString("productDescription") , rs.getString("productPhoto") ); 
    	        product.setWatchId(rs.getInt("watchId"));
    	        
    	        li.add(product);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
	}

	@Override
	public List<Product> getProductByBrandAndFor(int watchId)
	{
		Connection con=DBUtility.getConnection();
		ResultSet rs;
		Statement stmt;
		Product product = null;
		List<Product> li=new ArrayList<>();
		
		String query="select * from product where watchId="+watchId;
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        product=new Product(rs.getInt("productId"), rs.getInt("productPrice") , rs.getInt("productDiscount") ,rs.getInt("productQuantity") , rs.getInt("brandId"),
    	                         rs.getString("productTitle"), rs.getString("productDescription") , rs.getString("productPhoto") ); 
    	        product.setWatchId(rs.getInt("watchId"));
    	        
    	        li.add(product);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
	}



}
