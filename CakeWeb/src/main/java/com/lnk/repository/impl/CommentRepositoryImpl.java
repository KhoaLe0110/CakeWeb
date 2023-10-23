/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.repository.impl;


import com.lnk.pojo.Comment;
import com.lnk.repository.CommentRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.boot.spi.SessionFactoryBuilderFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author huu-thanhduong
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")

public class CommentRepositoryImpl implements CommentRepository {
    @Autowired
    private LocalSessionFactoryBean factory;
        @Autowired
    private Environment env;

    @Override
    public List<Comment> getComments(int cakeId ,int page) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Comment> query= b.createQuery(Comment.class);
        Root root=query.from(Comment.class);
        
        query=query.where(b.equal(root.get("cakeId"),cakeId));
        query=query.orderBy(b.desc(root.get("commentId")));
    
        Query q=session.createQuery(query);
        
        int max=3;
        q.setMaxResults(max);
        q.setFirstResult((page-1)*max);
        return q.getResultList();
    }

    @Override
    public Comment addComment(Comment c) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(c);
            return c;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
}
