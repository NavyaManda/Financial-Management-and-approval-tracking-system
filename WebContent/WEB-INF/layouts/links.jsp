<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--<div class="links"> --%>
<div id="sidebar">
    <ul>
        <li><ul>
  <br />  

    <c:choose>
        <c:when test="${empty sessionScope.employee_id}">
            <li>  <a href="login.jsp" class="linklink">Login</a></li>
        </c:when>
        <c:when test="${!empty sessionScope.employee_id and
                        sessionScope.role_id==1}">
            <li> <a href="addEmployee.jsp" class="linklink">Add Employee</a></li>
            <li>  <a href="updateEmployee.jsp" class="linklink">
                    Update Employee
                </a></li>
                <li>     <a href="addDepartment.jsp" class="linklink">Add Department</a></li>
                <li>  <a href="addRole.jsp" class="linklink">Add Role</a></li>
                <li><a href="addClaimType.jsp" class="linklink">Add Claim Type</a><li>
                <li>  <a href="viewBills.jsp" class="linklink">View Bills</a></li>
                <li> <a href="postBill.jsp" class="linklink">Post Bill</a></li>
                <li> <a href="viewProfile.jsp" class="linklink">View Profile</a></li>
                <li> <a href="changePassword.jsp" class="linklink">
                    Change Password
                </a></li>
                <li>  <a href="logout.jsp" class="linklink">Logout</a></li>
        </c:when>
        <c:when test="${!empty sessionScope.employee_id and
                        sessionScope.role_id==2}">
                <li> <a href="viewEmployeeBills.jsp" class="linklink">
                    Employee Bills
                </a></li>
                <li> <a href="viewBills.jsp" class="linklink">View Bills</a></li>
                <li> <a href="postBill.jsp" class="linklink">Post Bill</a></li>
                <li> <a href="viewProfile.jsp" class="linklink">View Profile</a></li>
                 <li><a href="changePassword.jsp" class="linklink">
                    Change Password
                </a>
               <li>  <a href="logout.jsp" class="linklink">Logout</a></li>
        </c:when>
        <c:when test="${!empty sessionScope.employee_id and
                        sessionScope.role_id==3}">
                 <li><a href="viewEmployeeBills.jsp" class="linklink">
                    Employee Bills
                </a>
                <li> <a href="viewBills.jsp" class="linklink">View Bills</a></li>
                <li> <a href="postBill.jsp" class="linklink">Post Bill</a></li>
                <li> <a href="viewProfile.jsp" class="linklink">View Profile</a></li>
                <li> <a href="changePassword.jsp" class="linklink">
                    Change Password
                </a> </li>
                <li> <a href="logout.jsp" class="linklink">Logout</a> </li>
        </c:when>
        <c:when test="${!empty sessionScope.employee_id and
                        sessionScope.role_id==4}">
                <li> <a href="viewBills.jsp" class="linklink">View Bills</a> </li>
                <li> <a href="postBill.jsp" class="linklink">Post Bill</a> </li>
                <li> <a href="viewProfile.jsp" class="linklink">View Profile</a> </li>
                <li> <a href="changePassword.jsp" class="linklink">
                    Change Password
                </a> </li>
                <li> <a href="logout.jsp" class="linklink">Logout</a> </li>
        </c:when>
        <c:when test="${!empty sessionScope.employee_id}">
            <li> <a href="viewBills.jsp" class="linklink">View Bills</a> </li>
             <li><a href="postBill.jsp" class="linklink">Post Bill</a> </li>
            <li> <a href="changePassword.jsp" class="linklink">
                Change Password
            </a> </li>
            <li> <a href="logout.jsp" class="linklink">Logout</a> </li>
        </c:when>
    </c:choose>
            </ul>
             </li>
    </ul>
</div>