<%-- 
    Document   : register
    Created on : Sep 23, 2023, 2:18:43 PM
    Author     : Jackie's PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="text-center text-danger">ĐĂNG KÝ</h1>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>
<c:url value="/register" var="action" />
<form:form action="${action}" method="post" modelAttribute="user" enctype="multipart/form-data">
     <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="avatar" />
 
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" 
                    path="file" id="file" name ="file"  />
        <label for="file">Ảnh đại diện</label>
    </div>

    <div class="mb-3">
        <label for="firstName" class="form-label">First Name:</label>
        <form:input type="text" class="form-control" id="firstName" path="firstName"/>
    </div>
      <form:errors path="firstName" element="div" cssClass="text-danger" />

    <div class="mb-3">
        <label for="lastName" class="form-label">Last Name:</label>
        <form:input type="text" class="form-control" id="lastName" path="lastName"/>
    </div>
      <form:errors path="lastName" element="div" cssClass="text-danger" />
    <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <form:input type="email" class="form-control" id="email" path="email"/>
    </div>
    <div class="mb-3">
        <label for="username" class="form-label">Username:</label>
        <form:input type="text" class="form-control" id="username" path="username"/>
    </div>
        <form:errors path="username" element="div" cssClass="text-danger"/>
    <div class="mb-3">
        <label for="password" class="form-label">Password:</label>
        <form:input type="password" class="form-control" id="password" path="password"/>
    </div>
    <div class="mb-3">
        <label for="confirm-password" class="form-label">Confirm Password:</label>
        <form:input type="password" class="form-control" id="confirm-password" path="confirmPassword"/>
    </div>
    <div class="mb-3">
        <label for="Phone" class="form-label">Phone</label>
        <form:input type="phone" class="form-control" id="phone" path="phone"/>
    </div>
          <form:errors path="phone" element="div" cssClass="text-danger"/>
    <button type="submit" class="btn btn-primary">Đăng ký</button>
</form:form>
