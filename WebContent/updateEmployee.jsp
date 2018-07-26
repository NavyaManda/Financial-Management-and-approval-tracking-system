<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>

<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <c:choose>
        <c:when test="${empty param.employee_id}">
            Select Employee:
            <sql:query dataSource="jdbc/fmats" var="employees"
                       sql="SELECT * FROM employee"/>
            <form method="post">
                <select name="employee_id">
                    <option value="">Select Employee</option>
                    <c:forEach items="${employees.rowsByIndex}" var="employee">
                        <option value="${employee[0]}">${employee[1]}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Get"/>
            </form>
        </c:when>
        <c:otherwise>
            <sql:query dataSource="jdbc/fmats" var="employees"
                       sql="SELECT * FROM employee WHERE employeeid=?">
                <sql:param value="${param.employee_id}"/>
            </sql:query>
            <c:forEach items="${employees.rowsByIndex}" var="employee">
                <form action="updateEmployee" method="post">
                    <table border="1" cellspacing="3" cellpadding="3">
                        <thead>
                            <tr>
                                <th colspan="2">
                                    Employee Details
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Name</td>
                                <td>
                                    <input type="hidden" name="employee_id" value="${param.employee_id}"/>
                                    <input type="text" name="name" value="${employee[1]}" />
                                </td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <textarea name="address" rows="4" cols="36">${employee[5]}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>EMail</td>
                                <td><input type="text" name="email" value="${employee[7]}" /></td>
                            </tr>
                            <tr>
                                <td>Contact</td>
                                <td><input type="text" name="contact" value="${employee[6]}" /></td>
                            </tr>
                            <tr>
                                <td>Date of Birth</td>
                                <td><input type="text" name="dob" value="${employee[9]}" />YYYY-MM-DD</td>
                            </tr>
                            <tr>
                                <td>Date of Joining</td>
                                <td><input type="text" name="doj" value="${employee[10]}" />YYYY-MM-DD</td>
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td>
                                    <sql:query dataSource="jdbc/fmats" var="departments"
                                               sql="SELECT * FROM department"/>
                                    <select name="department_id">
                                        <option value="0">Select Department</option>
                                        <c:forEach items="${departments.rowsByIndex}" var="department">
                                            <c:choose>
                                                <c:when test="${employee[12] == department[0]}">
                                                    <option value="${department[0]}" selected>${department[1]}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${department[0]}">${department[1]}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Role</td>
                                <td>
                                    <sql:query dataSource="jdbc/fmats" var="roles"
                                               sql="SELECT * FROM role"/>
                                    <select name="role_id">
                                        <option value="0">Select Role</option>
                                        <c:forEach items="${roles.rowsByIndex}" var="role">
                                            <c:choose>
                                                <c:when test="${employee[2] == role[0]}">
                                                    <option value="${role[0]}" selected>${role[1]}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${role[0]}">${role[1]}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Update Employee" /></td>
                                <td><input type="reset" value="Clear" /></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </c:forEach>
        </c:otherwise>
    </c:choose>

                </div>
            </div>


            <div style="clear: both;">&nbsp;</div>
        </div>

<jsp:include page="WEB-INF/layouts/footer.jsp"/>