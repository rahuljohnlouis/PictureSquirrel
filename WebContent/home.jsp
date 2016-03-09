<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="header.jsp">
<c:param name="title" value="Picture Squirrel Home"></c:param>
</c:import>
<!-- Set data source -->
<sql:setDataSource var="ds" dataSource="jdbc/webshop"/>

<sql:query dataSource="${ds}" sql="select * from images" var="results" />
<!--  Use for each loop and access rows from the var results above -->

<table class="images">
<c:set var="tablewidth" value="8" />
<c:forEach var="image" items="${results.rows}" varStatus="row">
	
	<c:if test="${row.index %tablewidth == 0 }">
	<tr>
	</c:if>
	<c:set scope="page" var="imagename" value="${image.stem}.${image.image_extension}"/>
	<td><img width="80"src="${pageContext.request.contextPath}/pics/${imagename}"/></td>
	<!--  <p>${image.stem}.${image.image_extension }</p>-->
	<c:if test="${row.index+1 %tablewidth == 0 }">
	<tr>
	</c:if>

</c:forEach>

</table>
<c:import url="footer.jsp"></c:import>