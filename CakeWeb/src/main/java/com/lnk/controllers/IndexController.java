/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.controllers;

import com.lnk.pojo.Cart;
import com.lnk.service.CategoryService;
import com.lnk.service.CommentService;
import com.lnk.service.ProductService;
import com.lnk.utils.Utils;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:configs.properties")
public class IndexController {
    @Autowired
    private ProductService prodService;
    @Autowired
    private CategoryService cateService;
    @Autowired
    private Environment env;
    @Autowired
    private CommentService commentService;
    
    @ModelAttribute
    public void commonAttr(Model model, HttpSession session) {
        model.addAttribute("categories", this.cateService.getCategories());
        model.addAttribute("cartCounter", Utils.countCart((Map<Integer, Cart>) session.getAttribute("cart")));
    }
    
    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("products", this.prodService.getProducts(params));
        
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        long count = this.prodService.countProduct();
        model.addAttribute("counter", Math.ceil(count*1.0/pageSize));
        
        return "index";
    }
      @GetMapping("/detail/{cakeId}")
    public String detail(Model model, @PathVariable(value ="cakeId") int id){
        model.addAttribute("products", this.prodService.getProductById(id));
        model.addAttribute("comment", this.commentService.getComments(id,1));
        
        return "detail";
    }
    @RequestMapping("/address")
    public String address(){
    return "address";
    }
   
}
