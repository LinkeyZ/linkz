package com.meatball.linkz.project.goods.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meatball.linkz.project.goods.model.Goods;
import com.meatball.linkz.project.goods.model.GoodsType;
import com.meatball.linkz.project.goods.mybatis.domain.SysGoods;
import com.meatball.linkz.project.goods.mybatis.service.GoodsMybatisService;
import com.meatball.linkz.project.goods.param.GoodsParam;
import com.meatball.linkz.project.goods.service.GoodsService;
import com.meatball.linkz.project.goods.service.GoodsTypeService;

/**
 * @author zhxd
 *
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsController {
	private static final Logger logger = Logger.getLogger(GoodsController.class);
	
	@Resource
	GoodsService goodsService;
	
	@Resource 
	GoodsTypeService goodsTypeService;
	
	
	@Resource 
	GoodsMybatisService goodsMybatisService;
	/**
	 * 商品列表
	 */
	
	@RequestMapping("/goodsList")
	public String goodsList(HttpServletRequest request,HttpServletResponse response,Model model){
		
		List<Goods> goodsList = goodsService.listAll();
		model.addAttribute("goodsList", goodsList);
		
//		@SuppressWarnings("resource")
//		ApplicationContext context = new FileSystemXmlApplicationContext("classpath:applicationContext-service.xml");
//		Object object = context.getBean("txManager");
//		System.out.println(object.toString());
		
		
		return "/goods/manage";
	}
	
	
//	@ExceptionHandler(value= RuntimeException.class)
//	public String toErrorPage(){
//		
//		return "/error/403";
//	}
	
	@RequestMapping(value = "/addGoods",method = {RequestMethod.GET,RequestMethod.POST})
	public String insertGoods(Model model,HttpServletRequest request,GoodsParam param){
			if(request.getMethod().equals("GET")){
				List<GoodsType> typeList = goodsTypeService.listAll();
				model.addAttribute("typeList", typeList);
				
				return "/goods/add";
			}else{
				Goods goodsModel = new Goods();
				int valid;
				if(param.getIsValid().equals("on")){
					valid = 200;
				}else{
					valid = 300;
				}
				
				goodsModel.setCreateMan("admin");
				goodsModel.setCreateTime(new Date());
				goodsModel.setGoodsName(param.getGoodsName());
				goodsModel.setGoodsType(goodsTypeService.get(param.getGoodsTypeId()));
				goodsModel.setIsValid(valid);
				
				goodsService.save(goodsModel);
				
				return "redirect:/goods/goodsList";
			}
	}
	
	@RequestMapping(value="/updateGoods",method={RequestMethod.GET,RequestMethod.POST})
	public String updateGoods(Model model,HttpServletRequest request,HttpServletResponse response
			,@RequestParam("id") int id,GoodsParam param){
		if("GET".equals(request.getMethod())){
			Goods goods = goodsService.get(id);
			model.addAttribute(goods);
			List<GoodsType> typeList = goodsTypeService.listAll();
			model.addAttribute("typeList", typeList);
			
			return "/goods/updateGoods";
		}else{
			Goods goods = goodsService.get(id);
			goods.setGoodsName(param.getGoodsName());
			goods.setGoodsType(goodsTypeService.get(param.getGoodsTypeId()));
			int valid;
			if(param.getIsValid().equals("on")){
				valid = 200;
			}else{
				valid = 300;
			}
			goods.setIsValid(valid);
		//	goodsService.update(goods);
			
			goodsService.updateGoods(goods);
			
			return "redirect:/goods/goodsList";
		}
		
	}
	
	@RequestMapping(value="/testMybatis",method={RequestMethod.GET,RequestMethod.POST})
	public void testMybatis(Integer goodsId,HttpServletResponse response){
		
		
		SysGoods goods = goodsMybatisService.selectByPrimaryKey(goodsId);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print("goodsId : "+ goods.getGoodsId() +"\ngoodsName : " + goods.getGoodsName());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(goods.getCreateman());
		System.out.println(goods.getGoodsId());
		System.out.println(goods.getGoodsName());
		
	}
	
	
	
}
