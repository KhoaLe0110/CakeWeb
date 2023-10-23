/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.service.impl;


import com.lnk.pojo.Category;
import com.lnk.repository.CategoryRepository;
import com.lnk.service.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository cateRepo;
    
    @Override
    public List<Category> getCategories() {
        return this.cateRepo.getCategories();
    }

    @Override
    public Category getCateById(int id) {
        return this.cateRepo.getCateById(id);
    }
    
}
