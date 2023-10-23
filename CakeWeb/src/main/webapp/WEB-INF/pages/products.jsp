<%-- 
    Document   : products
    Created on : Sep 20, 2023, 2:39:18 AM
    Author     : Jackie's PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-info mt-1">QUẢN LÝ SẢN PHẨM</h1>

<c:url value="/staff/products" var="action" />
<form:form method="post" action="${action}" modelAttribute="product" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="cakeId" />
    <form:hidden path="img" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" 
                    path="name" id="name" placeholder="Tên bánh..." />
        <label for="name">Tên bánh</label>
        <form:errors path="name" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating">
        <form:textarea class="form-control" id="des" name="text" 
                       path="description" placeholder="Mô tả"></form:textarea>
            <label for="des">Mô tả</label>
        <form:errors path="description" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" 
                    path="price" id="price" placeholder="Nhập giá..." />
        <label for="price">Giá bánh</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:select class="form-select" id="category" name="category" path="categoryId">
            <c:forEach items="${categories}" var="c">
                <c:choose>
                    <c:when test="${c.cateId == product.categoryId.cateId}">
                        <option value="${c.cateId}" selected>${c.name}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${c.cateId}">${c.name}</option>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </form:select>

        <label for="category" class="form-label">Danh mục sản phẩm:</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" 
                    path="file" id="file"  />
        <label for="file">Ảnh bánh</label>
        <c:if test="${product.img != null}">
            <img src="${product.img}" width="120" />
        </c:if>
    </div>

    <div class="form-floating mb-3 mt-3">
        <button class="btn btn-info" type="submit">
            <c:choose>
                <c:when test="${product.cakeId == null}">Thêm sản phẩm</c:when>
                <c:otherwise>Cập nhật sản phẩm</c:otherwise>
            </c:choose>
        </button>
    </div>

</form:form>
