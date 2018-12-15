package com.hcc.advweb.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hcc.advweb.entities.Product;
import com.hcc.advweb.model.ProductService;
import com.hcc.advweb.util.Constant;

@RestController
@RequestMapping
public class ImplementControler {

	@Autowired
	private ProductService productService;
	
	/**
	 * 
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public ModelAndView redirectHome() throws IOException {
		
		ModelAndView modelView = new ModelAndView();
		ArrayList<Product> productsList = productService.select(Constant.NEW_PRODUCT);
		modelView.addObject("productsList",productsList);
		modelView.setViewName("home");
		return modelView;
	}
	
	/**
	 * 
	 * @param idParam
	 * @return
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	@RequestMapping(value="/products", method = RequestMethod.GET)
	public ModelAndView selectProductList(@RequestParam int idParam) throws IOException, NumberFormatException, SQLException {
		
		int totalPage = productService.totalPage();
		
		int curpage = idParam;
		
		if(curpage > totalPage ){
			curpage = totalPage;
		}
		else if(curpage < 1 ){
			curpage = 1;
		}
		
		ModelAndView modelView = new ModelAndView();
		ArrayList<Product> productsList = productService.pagination(curpage);
		modelView.addObject("pagetotal",totalPage);
		modelView.addObject("currpage",curpage);
		modelView.addObject("productsList",productsList);
		
		return modelView;
	}
	
	/**
	 * 
	 * @param productid
	 * @return
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	@RequestMapping(value="/productdetail", method = RequestMethod.GET)
	public ModelAndView getProduct(@RequestParam int productid) throws IOException, NumberFormatException, SQLException {

		ModelAndView modelView = new ModelAndView();
		Product product = productService.getProduct(productid);
		modelView.addObject("productdetail",product);
		
		return modelView;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	@RequestMapping(value="/description", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView productDescription(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws IOException, NumberFormatException, SQLException {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("description");
		return modelAndView;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView productDetail(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws IOException, NumberFormatException, SQLException {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("detail");
		return modelAndView;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	@RequestMapping(value="/returnpolicy", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView returnpolicy(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws IOException, NumberFormatException, SQLException {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("returnpolicy");
		return modelAndView;
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param locale
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	@RequestMapping(value="/othersInfo", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView othersInfo(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws IOException, NumberFormatException, SQLException {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("othersInfo");
		return modelAndView;
	}

}
