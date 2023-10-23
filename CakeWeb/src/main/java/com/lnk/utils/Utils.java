/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.utils;

import com.lnk.pojo.Cart;
import java.util.Map;

/**
 *
 * @author Jackie's PC
 */
public class Utils {
    public static int countCart(Map<Integer,Cart> cart){
        int count=0;
        if(cart != null){
           for (Cart c:cart.values())
               count +=c.getQuantity();
        }
        return count;
    }
}
