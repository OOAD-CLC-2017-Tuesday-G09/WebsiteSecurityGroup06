<%@ page import="java.io.*,java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
            <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:if test="${ empty param.email}">
      <c:redirect url="register.jsp" >
              <c:param name="errMsg"  value="Vui lòng Nhập Email" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.email}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/websitesecurity"
                       user="root" password="0123"/>
 
      <sql:query dataSource="${ds}" var="selectQ">
        SELECT count(*) as kount FROM customer WHERE customerEmail='${param.email}'
      </sql:query>
  <c:forEach items="${selectQ.rows}" var="r">
        <c:choose>
          <c:when test="${r.kount gt 0}">
            <c:redirect url="register.jsp">
             <c:param name="errMsg" value="Emai hợp lệ" />
             </c:redirect>

          </c:when>
          <c:otherwise>
            <c:redirect url="register.jsp" >
              <c:param name="errMsg" value="Email đã tồn tại" />
            </c:redirect>
          </c:otherwise>
        </c:choose>
 
      </c:forEach>
 
 
    </c:if>