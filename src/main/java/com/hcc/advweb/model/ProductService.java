package com.hcc.advweb.model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hcc.advweb.entities.Product;

public interface ProductService {
	public ArrayList<Product> select(int productStatus)throws IOException;
	public Product getProduct(int productId) throws SQLException, IOException;
	public ArrayList<Product> pagination(int pageNmb)throws SQLException, IOException;
	public int totalPage() throws SQLException, IOException;
}
