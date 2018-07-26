<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>

<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <sql:query dataSource="jdbc/fmats" var="employees"
               sql="SELECT E.EMPLOYEEID, E.FIRST_NAME, E.ADDRESS,
               E.MOBILE_NO, E.EMAIL_ID, E.DATE_OF_BIRTH, E.DATE_OF_JOINING,
               E.GENDER, D.NAME, R.NAME FROM employee E, role R, department D
               WHERE D.DEPARTMENTID=E.DEPARTMENTID AND R.ROLEID=E.ROLEID
               AND E.EMPLOYEEID=?">
        <sql:param value="${sessionScope.employee_id}"/>
    </sql:query>

    <c:forEach items="${employees.rowsByIndex}" var="employee">
        <table border="1">
            <tr>
                <th colspan="2">My Profile</th>
            </tr>
            <tr>
                <td>Employee ID</td>
                <td>${employee[0]}</td>
            </tr>
            <tr>
                <td>Name</td>
                <td>${employee[1]}</td>
            </tr>
            <tr>
                <td>Address</td>
                <td>${employee[2]}</td>
            </tr>
            <tr>
                <td>Mobile No.</td>
                <td>${employee[3]}</td>
            </tr>
            <tr>
                <td>EMail ID</td>
                <td>${employee[4]}</td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td>${employee[5]}</td>
            </tr>
            <tr>
                <td>Date of Joining</td>
                <td>${employee[6]}</td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <c:choose>
                        <c:when test="${employee[7]=='M'}">Male</c:when>
                        <c:otherwise>Female</c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td>Department</td>
                <td>${employee[8]}</td>
            </tr>
            <tr>
                <td>Role</td>
                <td>${employee[9]}</td>
            </tr>
        </table>
    </c:forEach>

                </div>
            </div>


            <div style="clear: both;">&nbsp;</div>
        </div>

<jsp:include page="WEB-INF/layouts/footer.jsp"/>

