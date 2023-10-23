<%-- 
    Document   : detail
    Created on : Sep 24, 2023, 12:30:36 AM
    Author     : Jackie's PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger">CHI TIẾT SẢN PHẨM</h1>

<div class="row">
    <div class="col-md-5">
        <img src="${products.img}" alt="${products.name}" class="img-fluid" />
    </div>
    <div class="col-md-7">
        <h1 class="text-info">${products.name}</h1>
        <h3>${products.price} VND</h3>
        <h2>Mô tả : ${products.description}</h2>
        
    </div>
</div>
<c:url value="/api/products/${products.cakeId}/comment" var="endpoint" />

<sec:authorize access="!isAuthenticated()">
    <strong>Vui lòng<a href="<c:url value="/login" />">đăng nhập</a> để bình luận!!!</strong>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <div class="form-group mt-2">
        <textarea class="form-control" placeholder="Nhap noi dung binh luan" id="contentId"></textarea>
    </div>
    <button class="btn btn-danger mt-1" onclick="addComment('${endpoint}', ${products.cakeId})">Thêm bình luận</button>
</sec:authorize>

<div class="comments">
    <c:forEach items="${comment}" var="c">
        <div class="comment row">
            <div class="col-md-1">
                <img src="<c:url value="https://toquoc.mediacdn.vn/thumb_w/640/280518851207290880/2022/12/15/p0dnxrcv-16710704848821827978943.jpg" />" class="rounded-circle img-fluid"/>
            </div>
            <div class="col-md-11">
                <p>${c.content} </p>
                <p class="commentDate">${c.createdDate}</p>
            </div>
        </div>
    </c:forEach>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/product.js" />"></script>
<script>
        window.onload = function () {
            loadComments('${endpoint}');
        }
</script>