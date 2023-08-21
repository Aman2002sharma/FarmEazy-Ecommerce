package com.watchstore.dao;

import java.util.List;

import com.watchstore.pojo.Watch;

public interface WatchDao
{
	boolean addWatch(Watch watch);
    List<Watch> getAllWatch(); 
    int getWatchIdByProductId(int productId);
    int getTotalWatch();
    String getWatchNameById(int watchId);
    boolean deleteWatchById(int watchId);
}
