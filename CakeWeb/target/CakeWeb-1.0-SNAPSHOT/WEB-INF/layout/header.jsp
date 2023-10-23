<%-- 
    Document   : header
    Created on : Jul 21, 2023, 1:12:19 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="action" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <img src="https://changibakery.com/wp-content/uploads/2021/05/LOGO-RGB-01-1-1024x1024.jpg" class="rounded-circle" alt="Cinque Terre" width="75">
        <a class="navbar-brand ms-2" <c:url value="/"/>">WEB CAKE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${action}">Trang chủ</a>
                </li>
                <nav class="navbar navbar-expand-lg">
                    <div class="navbar-collapse">
                        <ul class="navbar-nav ">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Menu
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink>
                                    <!-- Thêm các mục con của menu "Bánh lớn" ở đây -->
                                    <c:forEach items="${categories}" var="c">
                                        <c:url value="/" var="searchUrl">
                                            <c:param name="cateId" value="${c.cateId}"></c:param>
                                        </c:url>
                                        <a class="dropdown-item" href="${searchUrl}">${c.name}</a>
                                    </c:forEach>                    
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a class="nav-link text-info" href="<c:url value="/" />">Hello, ${pageContext.request.userPrincipal.name}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/logout" />">Đăng xuất</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link text-success" href="<c:url value="/login" />">Đăng nhập</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link " href="<c:url value="/register"/>">Đăng ký</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="<c:url value="/cart" />">&#128722<span class="badge badge-danger" id="cart-counter">${cartCounter}</span></a>
                </li>
            </ul>

            <form class="d-flex" action="${action}">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa...">
                <button class="btn btn-primary" type="submit">Tìm</button>
            </form>
        </div>
    </div>-->
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
