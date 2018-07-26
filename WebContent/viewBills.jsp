<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>

<script type="text/javascript">
    function validateForm(form)
    {

var x=form.approval_status.options[form.approval_status.selectedIndex].value; 
if(x==0)
    {
        alert("Select Approval Status");
        return false;
    }
    }</script>
<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <c:choose>
        <c:when test="${empty param.approval_status}">
            <sql:query dataSource="jdbc/fmats" var="statuses"
                       sql="SELECT * FROM approval_status"/>
            Select Approval Status Type:
            <form method="post" onsubmit="return validateForm(this)">
                <select name="approval_status" id="approval_status">
                    <option value="0">Select Approval Status</option>
                    <c:forEach items="${statuses.rowsByIndex}" var="status">
                        <option value="${status[0]}">${status[1]}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Get"/>
            </form>
        </c:when>
        <c:otherwise>
            <sql:query dataSource="jdbc/fmats" var="claims"
                       sql="SELECT EC.CLAIM_ID, CT.NAME, EC.DATE_OF_CLAIMING,
                       EC.CLAIMED_AMOUNT, EC.DATE_OF_APPROVAL, EC.APPROVED_AMOUNT,
                       APS.NAME FROM employee_claim EC, claim_type CT,
                       approval_status APS WHERE CT.CLAIMTYPEID=EC.CLAIMTYPEID AND
                       APS.ASID=EC.APPROVAL_STATUS AND EC.EMPLOYEE_ID=? AND
                       EC.APPROVAL_STATUS=? ORDER BY EC.DATE_OF_CLAIMING">
                <sql:param value="${sessionScope.employee_id}"/>
                <sql:param value="${param.approval_status}"/>
            </sql:query>
            <table border="1">
                <tr>
                    <td>Claim ID</td>
                    <td>Claim Type</td>
                    <td>Date of Claim</td>
                    <td>Claim Amount</td>
                    <td>Approval Date</td>
                    <td>Approved Amount</td>
                    <td>Approval Status</td>
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

