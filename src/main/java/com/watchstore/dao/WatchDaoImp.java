package com.watchstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.watchstore.dbUtility.DBUtility;
import com.watchstore.pojo.Watch;

public class WatchDaoImp implements WatchDao
{
	@Override
	public boolean addWatch(Watch watch)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="insert into Watch(watchTitle,watchDescription) values(?,?)";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,watch.getWatchTitle());
    	    stmt.setString(2,watch.getWatchDescription());
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
	public List<Watch> getAllWatch()
	{
		Connection con=DBUtility.getConnection();
		String query="select * from Watch";
		ResultSet rs;
		Statement stmt;
		Watch watch;
		List<Watch> li=new ArrayList<>();
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	    	watch=new Watch(rs.getString("watchTitle"), rs.getString("watchDescription"));
    	    	watch.setWatchId(rs.getInt("watchId"));
    	       li.add(watch);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
		
	}

	@Override
	public int getWatchIdByProductId(int productId)
	{
		Connection con=DBUtility.getConnection();
		String query="select watchId from product where productId="+productId;
		ResultSet rs;
		Statement stmt;
		int watchId=0;
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	    	watchId=rs.getInt("watchId");
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return watchId;
	}

	@Override
	public int getTotalWatch() {
		int totalWatch=0;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(watchId) from Watch";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  totalWatch=rs.getInt("count(watchId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return totalWatch;  
	}

	@Override
	public String getWatchNameById(int watchId)
	{
		   String watchName=null;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select watchTitle from Watch where watchId="+watchId;
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	watchName=rs.getString("watchTitle");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return watchName; 
	}

	@Override
	public boolean deleteWatchById(int watchId)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="delete from watch where watchId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setInt(1, watchId);
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
}
