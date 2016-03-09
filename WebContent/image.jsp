<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="header.jsp">
<c:param name="title" value="Picture Squirrel - View Image"></c:param>
</c:import>
<!-- Set data source -->
<sql:setDataSource var="ds" dataSource="jdbc/webshop"/>

<sql:query dataSource="${ds}" sql="select * from images where id=?" var="results" >
<sql:param>${param.image }</sql:param>
</sql:query>
<!--  Use for each loop and access rows from the var results above -->
	<c:set scope="page" var="image" value="${results.rows[0]}"/>
	<c:set scope="page" var="imagename" value="${image.stem}.${image.image_extension}"/>
	<img src="${pageContext.request.contextPath}/pics/${imagename}"/>


</table>
<c:import url="footer.jsp"></c:import>