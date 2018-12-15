package com.hcc.advweb.model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcc.advweb.entities.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	@Transactional
	public ArrayList<Product> select(int productStatus) throws IOException {
		// TODO Auto-generated method stub
		return productDAO.select(productStatus);
	}

	@Override
	@Transactional
	public Product getProduct(int productId) throws SQLException, IOException {
		// TODO Auto-generated method stub
		return productDAO.getProduct(productId);
	}

	@Override
	@Transactional
	public ArrayList<Product> pagination(int pageNmb) throws SQLException,
			IOException {
		// TODO Auto-generated method stub
		return productDAO.pagination(pageNmb);
	}

	@Override
	@Transactional
	public int totalPage() throws SQLException, IOException {
		// TODO Auto-generated method stub
		return productDAO.totalPage();
	}

}
