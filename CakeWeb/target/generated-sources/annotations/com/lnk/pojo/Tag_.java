package com.lnk.pojo;

import com.lnk.pojo.ProdTag;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2023-10-20T12:49:12")
@StaticMetamodel(Tag.class)
public class Tag_ { 

    public static volatile SingularAttribute<Tag, Integer> tagId;
    public static volatile SetAttribute<Tag, ProdTag> prodTagSet;
    public static volatile SingularAttribute<Tag, String> name;

}