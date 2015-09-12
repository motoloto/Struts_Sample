<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    EmpService empSvc = new EmpService();
    List<EmpVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有員工資料 - ListAllEmp.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<%-- 錯誤表列 --%>
<%-- 資料格式與完整性檢查的錯誤 --%>
<html:errors />

<%-- 其它錯誤(或者企業邏輯處理)的錯誤 --%>
<html:messages id="messages" message="true">
	<bean:write name="messages" />
</html:messages>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>職位</th>
		<th>雇用日期</th>
		<th>薪水</th>
		<th>獎金</th>
		<th>部門</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${empVO.empno}</td>
			<td>${empVO.ename}</td>
			<td>${empVO.job}</td>
			<td>${empVO.hiredate}</td>
			<td>${empVO.sal}</td>
			<td>${empVO.comm}</td>
			<td>${empVO.deptno}</td>
			<td>
			  <html:form action="/emp/getOne_For_Update.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="empno" value="${empVO.empno}"></html:form>
			</td>
			<td>
			  <html:form action="/emp/delete.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="empno" value="${empVO.empno}"></html:form>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>
