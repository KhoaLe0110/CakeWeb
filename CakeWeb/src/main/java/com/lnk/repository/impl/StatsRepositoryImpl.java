/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lnk.repository.impl;


import com.lnk.pojo.Category;
import com.lnk.pojo.SaleOrder;
import com.lnk.pojo.OrderDetail;
import com.lnk.pojo.Product;
import com.lnk.repository.StatsRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
//@Repository
//@Transactional
//public class StatsRepositoryImpl implements StatsRepository {
//
//    @Autowired
//    private LocalSessionFactoryBean factory;
//    @Autowired
//    private SimpleDateFormat f;
//
//    @Override
//    public List<Object[]> countProductByCate() {
//        Session session = this.factory.getObject().getCurrentSession();
//        CriteriaBuilder b = session.getCriteriaBuilder();
//        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
//        Root rP = q.from(Product.class);
//        Root rC = q.from(Category.class);
//
//        q.multiselect(rC.get("cateId"), rC.get("name"), b.count(rP.get("cakeId")));
//
//        q.where(b.equal(rP.get("categoryId"), rC.get("cateId")));
//        q.groupBy(rC.get("cateId"));
//
//        Query query = session.createQuery(q);
//        return query.getResultList();
//    }
//
//    @Override
//    public List<Object[]> statsRevenue(Map<String, String> params) {
//        Session session = this.factory.getObject().getCurrentSession();
//        CriteriaBuilder b = session.getCriteriaBuilder();
//        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
//        Root rP = q.from(Product.class);
//        Root rD = q.from(OrderDetail.class);
//        Root rO = q.from(Order1.class);
//
//        q.multiselect(rP.get("cakeId"), rP.get("name"), b.sum(b.prod(rD.get("unitPrice"), rD.get("num"))));
//
//        List<Predicate> predicates = new ArrayList<>();
//        predicates.add(b.equal(rD.get("cakeId"), rP.get("cakeId")));
//        predicates.add(b.equal(rD.get("orderId"), rO.get("orderId")));
//
//        String fd = params.get("fromDate");
//        if (fd != null && !fd.isEmpty()) {
//            try {
//                predicates.add(b.greaterThanOrEqualTo(rO.get("createdDate"), f.parse(fd)));
//            } catch (ParseException ex) {
//                Logger.getLogger(StatsRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//
//        String td = params.get("toDate");
//        if (td != null && !td.isEmpty()) {
//            try {
//                predicates.add(b.lessThanOrEqualTo(rO.get("createdDate"), f.parse(td)));
//            } catch (ParseException ex) {
//                Logger.getLogger(StatsRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//
//        String quarter = params.get("quarter");
//        if (quarter != null && !quarter.isEmpty()) {
//            String year = params.get("year");
//            if (year != null && !year.isEmpty()) {
//                predicates.addAll(Arrays.asList(
//                        b.equal(b.function("YEAR", Integer.class, rO.get("createdDate")), Integer.parseInt(year)),
//                        b.equal(b.function("QUARTER", Integer.class, rO.get("createdDate")), Integer.parseInt(quarter))
//                ));
//            }
//        }
//
//        q.where(predicates.toArray(Predicate[]::new));
//
//        q.groupBy(rP.get("cakeId"));
//
//        Query query = session.createQuery(q);
//        return query.getResultList();
//
//    }
//
//}
