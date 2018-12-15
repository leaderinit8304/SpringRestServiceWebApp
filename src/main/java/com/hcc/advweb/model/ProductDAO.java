package com.hcc.advweb.model;

import java.io.IOException;
import java.util.ArrayList;

import com.hcc.advweb.entities.Product;

public interface ProductDAO {
	public ArrayList<Product> select(int productStatus)throws IOException;
	public Product getProduct(int productId) throws IOException;
	public ArrayList<Product> pagination(int pageNmb)throws IOException;
	public int totalPage() throws IOException;
}