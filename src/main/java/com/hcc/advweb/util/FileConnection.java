package com.hcc.advweb.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import com.hcc.advweb.entities.Product;

public class FileConnection {

	/**
	 * 
	 * @return
	 * @throws IOException 
	 */
	public ArrayList<Product> readingAllProduct() throws IOException{
		ArrayList<String> arrLstProduct = new ArrayList<String>(); // array list use to store full transaction string 

		String strCurrentLine;
		BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream(Constant.PRODUCT_DB)));

		// get transaction from database and store in array list
		while ((strCurrentLine = br.readLine()) != null) {

			arrLstProduct.add(strCurrentLine);
		}
		return splitProductInfomation(arrLstProduct);
	}

	/**
	 * 
	 * @param arrLstProduct
	 * @return
	 */
	public static ArrayList<Product> splitProductInfomation(ArrayList<String> arrLstProduct){
		ArrayList<Product> productLst = new ArrayList<Product>();
		Product productObj;
		String[] productTmp;
		for(int i = 0; i < arrLstProduct.size(); i++){
			productTmp = arrLstProduct.get(i).trim().split("\"=\"");

			productObj = new Product();
			productObj.setId(Integer.parseInt(productTmp[0]));
			productObj.setShortname(productTmp[1]);
			productObj.setPrice(productTmp[2]);
			productObj.setStatus(Integer.parseInt(productTmp[3]));
			productObj.setImage(productTmp[4]);
			productLst.add(productObj);
		}

		return productLst;

	}
}
