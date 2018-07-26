<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>

<script type="text/javascript">
    function validateForm(form)
    {
         var rolename=form.rolename.value;
        
        if (rolename==null || rolename=="")
        {
            alert("enter role name");
            return false;
        }
    }
    
</script>





<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <sql:query dataSource="jdbc/fmats" var="roles"
               sql="SELECT * FROM role"/>
    <table border="1">
        <tr>
            <td>Role ID</td>
            <td>Name</td>
        </tr>
        <c:forEach items="${roles.rowsByIndex}" var="role">
            <tr>
                <td>${role[0]}</td>
                <td>${role[1]}</td>
            </tr>
        </c:forEach>
    </table>
    <form action="addRole" method="post" onsubmit="return validateForm(this)">
        <table border="1" cellspacing="3" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2">
                        Role Details
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="rolename" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add Role" /></td>
                    <td><input type="reset" value="Clear" /></td>
                </tr>
            </tbody>
        </table>
    </form>

                </div>
            </div>


            <div style="clear: both;">&nbsp;</div>
        </div>

<jsp:include page="WEB-INF/layouts/footer.jsp"/>

