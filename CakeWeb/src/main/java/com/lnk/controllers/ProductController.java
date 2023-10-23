/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.controllers;


import com.lnk.pojo.Product;
import com.lnk.service.CommentService;
import com.lnk.service.ProductService;
import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 *
 * @author admin
 */
@Controller
@RequestMapping("/staff")
public class ProductController {
    @Autowired
    private ProductService proService;
    @Autowired
    private CommentService commentService;
    
    @GetMapping("/products")
    public String list(Model model, Principal p) {
        model.addAttribute("product", new Product());
        return "products";
    }
    
    @GetMapping("/products/{cakeId}")
    public String update(Model model, @PathVariable(value = "cakeId") int id)  {
        model.addAttribute("product", this.proService.getProductById(id));
        return "products";
    }
    
    @PostMapping("/products")
    public String add(@ModelAttribute(value = "product") @Valid Product p, 
            BindingResult rs) {
        if (!rs.hasErrors())
            if (proService.addOrUpdateProduct(p) == true)
                return "redirect:/";
        
        return "products";
    }
//       @GetMapping("/stats")
//    public String stats(Model model,
//            @RequestParam(value = "quarter", required = false) int quarter,
//            @RequestParam(value = "year", defaultValue = "2022") int year) {
//        model.addAttribute("catStats", this.proService.countProdsByCate());
//        model.addAttribute("revenuStats", this.proService.revenueStats(quarter, year));
//        return "stats";
//    }
}
