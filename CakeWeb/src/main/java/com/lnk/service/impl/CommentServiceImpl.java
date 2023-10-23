/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.service.impl;


import com.lnk.pojo.Comment;
import com.lnk.pojo.User;
import com.lnk.repository.CommentRepository;
import com.lnk.repository.UserReppository;
import com.lnk.service.CommentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;


/**
 *
 * @author huu-thanhduong
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentRepository commentRepo;
    @Autowired
    private UserReppository userRepo;

    @Override
    public List<Comment> getComments(int cakeId ,int page) {
        return this.commentRepo.getComments(cakeId,page);
    }

    @Override
    public Comment addComment(Comment c) {
        c.setCreatedDate(new Date());
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = this.userRepo.getUserByUsername(authentication.getName());
        c.setUserId(u);
        
        return this.commentRepo.addComment(c);
    }
    
}
