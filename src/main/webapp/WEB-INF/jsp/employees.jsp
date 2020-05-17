<%@ include file="header.jsp" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<table class="table">
  <thead class="thead-dark">
  <tr>
    <th>Number</th><th>Details</th>
  </tr>
  <tr>
    <th colspan="2">
      <c:set var="dotSign" value="..."/>

      <c:set var="initialPage" value="1"/>

      <c:if test = "${employees.currentPage - 5 > 2}">
         <c:set var="initialPage" value="${employees.currentPage - 5}"/>
         <a href="?showPage=1">${1}</a>
         <a href="?showPage=${employees.currentPage - 6}">${dotSign}</a>
      </c:if>
         <c:forEach var = "i" begin = "${initialPage}" end = "${employees.currentPage - 1}">
         <a href="?showPage=${i}">${i}</a>
      </c:forEach>

       Page ${employees.currentPage}


<c:choose>
      <c:when test = "${employees.maxPage - employees.currentPage > 6}">
         <c:forEach var = "i" begin = "${employees.currentPage + 1}" end = "${employees.currentPage + 5}">
           <a href="?showPage=${i}">${i}</a>
         </c:forEach>
         <a href="?showPage=${employees.currentPage + 6}">${dotSign}</a>
         <a href="?showPage=${employees.maxPage}">${employees.maxPage}</a>
         <br />
      </c:when>

     <c:otherwise>
         <c:forEach var = "i" begin = "${employees.currentPage + 1}" end = "${employees.maxPage}">
           <a href="?showPage=${i}">${i}</a>
         </c:forEach>
        <br />
    </c:otherwise>
</c:choose>

    </th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${employees.records}" var = "employee">
    <tr>
      <td><c:out value = "${employee.empNo}"/></td>
      <td><c:out value = "${employee.titles[0].title} ${employee.firstName} ${employee.lastName} ${employee.departmentEmployee[0].department.deptName}"/></td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<%@ include file="footer.jsp" %>