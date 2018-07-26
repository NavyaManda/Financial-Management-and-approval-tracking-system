<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>

<script type="text/javascript">
    function validateForm(form)
    {

        var x=form.employee_id.options[form.employee_id.selectedIndex].value; 
        if(x==0)
        {
            alert("Select Employee");
            return false;
        }
         
         
    }
    function validateForm1(form)
    {

        
        var amount=form.amount.value;
        if (amount==null || amount=="")
        {
            alert("enter amount");
            return false;
        }
        var x=form.approval_status.options[form.approval_status.selectedIndex].value; 
        if(x==0)
        {
            alert("Select approval_status");
            return false;
        }
         
    }



</script>




<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <c:choose>
        <c:when test="${empty param.employee_id}">
            <sql:query dataSource="jdbc/fmats" var="departments"
                       sql="SELECT DEPARTMENTID FROM employee WHERE EMPLOYEEID=?">
                <sql:param value="${sessionScope.employee_id}"/>
            </sql:query>
            <c:forEach items="${departments.rowsByIndex}" var="department">
                <c:set var="mydepartment" scope="page" value="${department[0]}"/>
            </c:forEach>
            <sql:query dataSource="jdbc/fmats" var="employees"
                       sql="SELECT EMPLOYEEID, FIRST_NAME FROM employee WHERE 
                       DEPARTMENTID=?">
                <sql:param value="${mydepartment}"/>
            </sql:query>
            <form method="post" onsubmit="return validateForm(this)">
                Select Employee:
                <select name="employee_id">
                    <option value="0">Select Employee</option>
                    <c:forEach items="${employees.rowsByIndex}" var="employee">
                        <option value="${employee[0]}">${employee[1]}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Get Employee Claims"/>
            </form>
        </c:when>
        <c:otherwise>
            <sql:query dataSource="jdbc/fmats" var="claims"
                       sql="SELECT EC.CLAIM_ID, CT.NAME, EC.DATE_OF_CLAIMING,
                       EC.CLAIMED_AMOUNT, EC.DATE_OF_APPROVAL, EC.APPROVED_AMOUNT,
                       APS.NAME FROM employee_claim EC, claim_type CT,
                       approval_status APS WHERE EC.EMPLOYEE_ID=? AND
                       CT.CLAIMTYPEID=EC.CLAIMTYPEID AND APS.ASID=EC.APPROVAL_STATUS">
                <sql:param value="${param.employee_id}"/>
            </sql:query>
            <table border="1">
                <tr>
                    <th colspan="8" align="center">Claims Status of an Employee</th>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>Claim Type</th>
                    <th>Claim Date</th>
                    <th>Amount</th>
                    <th>Approval Date</th>
                    <th>Approved Amt</th>
                    <th>Status</th>
                    <th>Change Status<br/>Amount ---- Status</th>
                </tr>
                <c:forEach items="${claims.rowsByIndex}" var="claim">
                    <tr>
                        <td>${claim[0]}</td>
                        <td>${claim[1]}</td>
                        <td>${claim[2]}</td>
                        <td>${claim[3]}</td>
                        <td>${claim[4]}</td>
                        <td>${claim[5]}</td>
                        <td>${claim[6]}</td>
                        <td>
                            <c:choose>
                                <c:when test="${!empty claim[4]}">
                                    --------
                                </c:when>
                                <c:otherwise>
                                    <form action="updateClaim" method="post" onsubmit="return validateForm1(this)">
                                        <input type="hidden" name="claim_id" value="${claim[0]}"/>
                                        <input type="text" name="amount" size="5"/>

                                        <sql:query dataSource="jdbc/fmats" var="apss"
                                                   sql="SELECT ASID, NAME FROM
                                                   approval_status"/>
                                        <select name="approval_status">
                                            <option value="0">Select Status</option>
                                            <c:forEach items="${apss.rowsByIndex}"
                                                       var="aps">
                                                <option value="${aps[0]}">${aps[1]}</option>
                                            </c:forEach>
                                        </select>
                                        <input type="submit" value="Go"/>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>

                </div>
            </div>


            <div style="clear: both;">&nbsp;</div>
        </div>

<jsp:include page="WEB-INF/layouts/footer.jsp"/>

