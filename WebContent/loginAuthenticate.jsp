<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login </title>
</head>
<body>
  <c:if test="${ empty param.uname or empty param.pass}">
      <c:redirect url="login.jsp" >
              <c:param name="errMsg" value="Vui lòng Nhập Tên Đăng Nhập, Mật Khẩu hoặc Quyền truy cập" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.uname and not empty param.pass}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/websitesecurity"
                       user="root" password="trongtri96"/>
 
      <sql:query dataSource="${ds}" var="selectQ">
        SELECT count(*) as kount FROM user WHERE username='${param.uname}'AND password='${param.pass}' AND role='1'
      </sql:query>
  <c:forEach items="${selectQ.rows}" var="r">
        <c:choose>
          <c:when test="${r.kount gt 0}">
            <c:set scope="session"
                   var="loginUser"
                   value="${param.uname}"
                  />
                     <c:set scope="session"
                   var="role"
                   value="1"
                  />
            <c:redirect url="index.jsp">
             <c:param name="errMsg" value="Đăng nhập thành công" />
            </c:redirect>
          </c:when>
          <c:otherwise>
           <c:set scope="session"
                   var="loginUser"
                   value="${param.uname}"/>
            <c:redirect url="false.jsp" >
              <c:param name="errMsg" value="Vui lòng kiểm tra lại mật khẩu hoặc tên đăng nhập" />
            </c:redirect>
          </c:otherwise>
        </c:choose>
 
      </c:forEach>
 
 
    </c:if>
</body>
</html>