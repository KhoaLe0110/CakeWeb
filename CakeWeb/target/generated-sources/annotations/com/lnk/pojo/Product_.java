package com.lnk.pojo;

import com.lnk.pojo.Category;
import com.lnk.pojo.Comment;
import com.lnk.pojo.OrderDetail;
import com.lnk.pojo.ProdTag;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-10-20T12:49:12")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, String> img;
    public static volatile SingularAttribute<Product, Date> createdDate;
    public static volatile SetAttribute<Product, Comment> commentSet;
    public static volatile SetAttribute<Product, ProdTag> prodTagSet;
    public static volatile SingularAttribute<Product, Long> price;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Boolean> active;
    public static volatile SingularAttribute<Product, Integer> cakeId;
    public static volatile SetAttribute<Product, OrderDetail> orderDetailSet;
    public static volatile SingularAttribute<Product, Category> categoryId;

}