/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.controllers;

import com.lnk.pojo.Cart;
import com.lnk.pojo.Product;
import com.lnk.service.ProductService;
import com.lnk.utils.Utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Jackie's PC
 */
@RestController
@RequestMapping("/api")
public class ApiCartController {
    @Autowired
    private ProductService prodService;
     
    @GetMapping("/products")
   @CrossOrigin
    public ResponseEntity<List<Product>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.prodService.getProducts(params), HttpStatus.OK);
    }
   @GetMapping("/cart/{cakeId}")
   public ResponseEntity<Integer> cart(@PathVariable(value="cakeId")Integer id, HttpSession session){
       Map<Integer,Cart> cart=(Map<Integer,Cart>) session.getAttribute("cart");
       if (cart==null)
           cart=new HashMap<>();
   
       if (cart.containsKey(id)==true){
           Cart c=cart.get(id);
           c.setQuantity(c.getQuantity()+1);
       }else{
            Product p= this.prodService.getProductById(id);
           Cart c= new Cart();
           c.setId(p.getCakeId());
           c.setName(p.getName());
           c.setUnitPrice(p.getPrice());
           c.setQuantity(1);
           cart.put(id,c);
           }
       session.setAttribute("cart", cart);
               return new ResponseEntity<>(Utils.countCart(cart),HttpStatus.OK);
//       System.out.println("===CART="+ Utils.countCart(cart));
   }
} 
