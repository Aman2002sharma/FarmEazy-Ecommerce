package com.watchstore.dao;

import java.util.List;

import com.watchstore.pojo.Product;

public interface ProductDao
{
   boolean addProduct(Product product);
   boolean updateProduct(Product product);
   List<Product> getAllProduct();
   List<Product> getProductByCategory(int categoryId);
   List<Product> getProductByWatch(int watchId);
   List<Product> getSearchedProduct(String productName);
   List<Product> getSearchedProduct(int brandId,int watchId,int productRange);
   Product getProductById(int productId);
   int getTotalProduct();
   boolean deleteProductById(int productId);
   boolean deleteProductByCategoryId(int categoryId);
   boolean deleteProductByWatchId(int watchId);
   int getQuantityByProductId(int productId);
   void updateQuantityAfterOrder(int productId,int productQuantity);
   int getTotalProductOfCategoryById(int categoryId);
   int getTotalProductOfWatchById(int watchId);
   List<Product> getProductByBrandAndFor(int watchId); 
}




