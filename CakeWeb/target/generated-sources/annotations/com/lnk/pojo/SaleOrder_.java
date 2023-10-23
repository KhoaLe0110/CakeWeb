package com.lnk.pojo;

import com.lnk.pojo.OrderDetail;
import com.lnk.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-10-20T12:49:12")
@StaticMetamodel(SaleOrder.class)
public class SaleOrder_ { 

    public static volatile SingularAttribute<SaleOrder, Date> createdDate;
    public static volatile SingularAttribute<SaleOrder, Integer> orderId;
    public static volatile SingularAttribute<SaleOrder, Long> ammount;
    public static volatile SingularAttribute<SaleOrder, User> userId;
    public static volatile SetAttribute<SaleOrder, OrderDetail> orderDetailSet;

}