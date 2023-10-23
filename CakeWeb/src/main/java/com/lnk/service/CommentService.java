/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.lnk.service;


import com.lnk.pojo.Comment;
import java.util.List;

/**
 *
 * @author huu-thanhduong
 */
public interface CommentService {
    List<Comment> getComments(int cakeId ,int page);
    Comment addComment(Comment c);
}
