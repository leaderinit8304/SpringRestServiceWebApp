package com.hcc.advweb.model;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hcc.advweb.entities.Product;
import com.hcc.advweb.util.Constant;
import com.hcc.advweb.util.FileConnection;

@Repository
public class ProductDAOImpl implements ProductDAO{

	private static FileConnection fileConnection = new FileConnection();

	@Override
	public ArrayList<Product> select(int productStatus) throws IOException {
		// TODO Auto-generated method stub
		ArrayList<Product> arrLstNewProduct = new ArrayList<Product>();
		Product productObj;

		ArrayList<Product> arrLstProduct = fileConnection.readingAllProduct();

		for(int i = 0; i < arrLstProduct.size(); i++){

			productObj = arrLstProduct.get(i);

			if(productObj.getStatus() == productStatus){
				arrLstNewProduct.add(productObj);
			}
		}

		return arrLstNewProduct;
	}

	@Override
	public Product getProduct(int productId) throws IOException {
		// TODO Auto-generated method stub
		Product product;

		ArrayList<Product> arrLstProduct = fileConnection.readingAllProduct();

		for(int i = 0 ; i < arrLstProduct.size(); i++){
			product = arrLstProduct.get(i);
			if(product.getId() == productId){
				return product;
			}
		}

		return null;
	}

	@Override
	public ArrayList<Product> pagination(int pageNmb) throws IOException {
		// TODO Auto-generated method stub

		ArrayList<Product> arrLstProductRtn = new ArrayList<Product>();
		int cnt = (pageNmb - 1)*Constant.PAGE_SIZE;

		ArrayList<Product> arrLstProduct = fileConnection.readingAllProduct();

		while(cnt < pageNmb*Constant.PAGE_SIZE && cnt < arrLstProduct.size()){
			arrLstProductRtn.add(arrLstProduct.get(cnt));
			cnt++;
		}

		return arrLstProductRtn;
	}

	@Override
	public int totalPage() throws IOException {
		// TODO Auto-generated method stub
		int totalPage = 0;

		ArrayList<Product> arrLstProduct = fileConnection.readingAllProduct();

		totalPage = arrLstProduct.size() / Constant.PAGE_SIZE;

		if(arrLstProduct.size() % Constant.PAGE_SIZE > 0){
			totalPage ++;
		}

		return totalPage;
	}

}
