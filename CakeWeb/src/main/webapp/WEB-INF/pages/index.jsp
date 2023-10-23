<%-- 
    Document   : index
    Created on : Jul 7, 2023, 1:08:19 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="container">
    <h1 class="text-center text-info mt-1">TRANG CHỦ</h1>
    <sec:authorize access="hasRole('ROLE_STAFF')" >
        <a href="<c:url value="/staff/products" />" class="btn btn-info">Thêm sản phẩm</a>
    </sec:authorize>
    <c:if test="${counter > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="<c:url value="/" />">Tất cả</a></li>
                <c:forEach begin="1" end="${counter}" var="i">
                    <c:url value="/" var="pageUrl">
                        <c:param name="page" value="${i}"></c:param>
                    </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                </c:forEach>
        </ul>
    </c:if>
    <section class="container mt-2">
        <div class="row">
            <c:forEach items="${products}" var="p" >
                <div class="col-md-4 mt-4">
                    <div class="card">
                        <img src="${p.img}" alt="${p.name}" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">${p.name}</h5>
                            <p class="card-text">${p.price} VND</p>
                        </div>
                        <p>
                            <a href="<c:url value="/detail/${p.cakeId}" />" class="btn btn-success">Xem chi tiết</a>
                            <a href="javascript:;" class="btn btn-danger ms-2" onclick="addToCart(${p.cakeId})">Thêm vào giỏ</a>
                        </p>
                        <sec:authorize access="hasRole('ROLE_STAFF')or hasRole('ROLE_ADMIN')">
                            <p>
                                <c:url value="/api/products/${p.cakeId}" var="apiDel" />
                                <a href="<c:url value="/staff/products/${p.cakeId}" />" class="btn btn-success mt-1 ">Cập nhật</a>
                                <button class="btn btn-danger mt-1 " onclick="delPro('${apiDel}', ${p.cakeId})">Xóa</button>
                            </p>
                        </sec:authorize>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</section>

    <script src="<c:url value="/js/main.js" />"></script>