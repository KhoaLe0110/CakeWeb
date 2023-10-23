/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.controllers;

import com.lnk.pojo.Cart;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Jackie's PC
 */
@Controller
public class CartController {

    @GetMapping("/cart")
    public String cart(Model model, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("carts", cart.values());
        } else {
            model.addAttribute("carts", null);
        }

        return "cart";
    }
    @RequestMapping("/deleteCart/{cakeId}")
    public String delCart(Model model, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("carts", cart.values());
        } else {
            model.addAttribute("carts", null);
        }
        

        return "cart";
    }
    @RequestMapping("/pay1")
    public String pay(){
    return "pay";
    }
}
