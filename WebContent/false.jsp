<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>>
<%@include file="header.jsp"%>
	<div class="container">
<center>
  <font color="red" size="10px"><c:if test="${not empty param.errMsg}">
            <%=session.getAttribute("loginUser") %> <c:out  value="${param.errMsg}" />
            </c:if></font>
</center> 
</div>
<%@include file="footer.jsp"%>