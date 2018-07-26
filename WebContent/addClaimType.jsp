<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>
<script type="text/javascript">
    function validateForm(form)
    {
         var claim_type=form.claim_type.value;
        
        if (claim_type==null || claim_type=="")
        {
            alert("enter claim_type");
            return false;
        }  
    }
    
</script>
<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <sql:query dataSource="jdbc/fmats" var="claims"
               sql="SELECT * FROM claim_type"/>
    <table border="1">
        <tr>
            <th>Claim Type ID</th>
            <th>Name</th>
        </tr>
        <c:forEach items="${claims.rowsByIndex}" var="claim">
            <tr>
                <td>
                    ${claim[0]}
                </td>
                <td>
                    ${claim[1]}
                </td>
            </tr>
        </c:forEach>
    </table>
    <form action="addClaimType" method="post" onsubmit="return validateForm(this)">
        <table border="1">
            <tr>
                <th colspan="2">Claim Type Details</th>
            </tr>
            <tr>
                <td>Claim Type Name</td>
                <td><input type="text" name="claim_type" value="" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Add Claim Type" /></td>
                <td><input type="reset" value="Clear" /></td>
            </tr>
        </table>
    </form>

                </div>
            </div>


            <div style="clear: both;">&nbsp;</div>
        </div>

<jsp:include page="WEB-INF/layouts/footer.jsp"/>

