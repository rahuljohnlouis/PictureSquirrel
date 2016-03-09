<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:import url="header.jsp">
<c:param name="title" value="Picture Squirrel Home"></c:param>
</c:import>
<!-- Set data source -->
<sql:setDataSource var="ds" dataSource="jdbc/webshop"/>

<sql:query dataSource="${ds}" sql="select * from images limit 10" var="results" />
<!--  Use for each loop and access rows from the var results above -->
<c:forEach var="image" items="${results.rows }">

<p>${image.stem}.${image.image_extension }</p>

</c:forEach>
<c:import url="footer.jsp"></c:import>