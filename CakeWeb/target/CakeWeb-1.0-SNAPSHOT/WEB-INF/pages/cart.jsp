<%-- 
    Document   : cart
    Created on : Oct 3, 2023, 12:58:31 AM
    Author     : Jackie's PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1 class="text-center text-info">Giỏ Hàng</h1>
<table class="table">
    <tr>
        <th>Mã sản phẩm</th>
        <th>Tên sản phẩm</th>
        <th>Đơn giá</th>
        <th>Số lượng</th>
    </tr>
    <c:forEach var="c" items="${carts}">
        <tr>
            <td>${c.id}</td>
             <td>${c.name}</td>
              <td>${c.unitPrice} VNĐ</td>
              <td> ${c.quantity}</td>
              <td> 
                  <a onclick="deletePro (${c.id})" class="btn btn-danger" >X
                  </a>
              </td>
        </tr>
    </c:forEach>
</table>
<a class="btn btn-success" href="<c:url value="/pay1"/>"> Thanh Toán</a>
  <script src="<c:url value="/js/main.js" />"></script>