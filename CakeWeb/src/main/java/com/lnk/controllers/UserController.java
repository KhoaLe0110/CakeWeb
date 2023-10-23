/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.controllers;

import com.lnk.pojo.User;
import com.lnk.service.UserService;
import java.util.HashMap;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author admin
 */
@Controller
public class UserController {
    
    @Autowired
    private UserService userDetailsService;
    @GetMapping("/login")
    public String login() {
        return "login";
    }
     @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult rs) {
        String errMsg = "";

        // Trích xuất các thông tin cần thiết từ đối tượng User
        Map<String, String> params = new HashMap<>();
        params.put("firstName", user.getFirstName());
        params.put("lastName", user.getLastName());
        params.put("phone", user.getPhone());
        params.put("email", user.getEmail());
        params.put("username", user.getUsername());
        params.put("password", user.getPassword());

        // Kiểm tra confirmPassword và thêm giá trị vào params
        String confirmPassword = user.getConfirmPassword();
        if (confirmPassword != null) {
            params.put("confirmPassword", confirmPassword);
        } else {
            errMsg = "Vui lòng xác nhận mật khẩu";
            model.addAttribute("errMsg", errMsg);
            return "register"; // Trả về trang đăng ký với thông báo lỗi
        }

        MultipartFile avatar = user.getFile();

        User addUser = this.userDetailsService.addUser(params, avatar);

        if (addUser != null && addUser.getPassword().equals(confirmPassword)) {
            return "redirect:/login";
        } else {
            errMsg = "Đã có lỗi xảy ra hoặc mật khẩu không khớp";
        }

        model.addAttribute("errMsg", errMsg);
        
        return "login";
    }
}
