<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>
<script type="text/javascript">
    function validateForm(form)
    {
         var departmentname=form.departmentname.value;
         var x=form.employee_id.options[form.employee_id.selectedIndex].value;
        if (departmentname==null || departmentname=="")
        {
            alert("enter department name");
            return false;
        }
        
       if(x==0){
           alert("Please Select Department Head");
           return false;
       }
        
        
        
        
    }
    
</script>
<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <sql:query dataSource="jdbc/fmats" var="departments"
               sql="SELECT * FROM department"/>
    <table border="1">
        <tr>
            <th>Department ID</th>
            <th>Name</th>
        </tr>
        <c:forEach items="${departments.rowsByIndex}" var="department">
            <tr>
                <td>
                    ${department[0]}
                </td>
                <td>
                    ${department[1]}
                </td>
            </tr>
        </c:forEach>
    </table>
    <form action="addDepartment" method="post" onsubmit="return validateForm(this)">
        <table border="1">
            <tr>
                <th colspan="2">Department Details</th>
            </tr>
            <tr>
                <td>Department Name</td>
                <td><input type="text" name="departmentname" value="" /></td>
            </tr>
            <tr>
                <td>Department Head</td>
                <td>
                    <sql:query dataSource="jdbc/fmats" var="employees"
                                   sql="SELECT * FROM employee WHERE ROLEID=2"/>
                        <select name="employee_id" id="employee_id">
                            <option value="0">Select Head</option>
                            <c:forEach items="${employees.rowsByIndex}" var="employee">
                                <option value="${employee[0]}">${employee[1]}</option>
                            </c:forEach>
                        </select> 
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Add Department" /></td>
                <td><input type="reset" value="Clear" /></td>
            </tr>
        </table>
    </form>

                </div>
            </div>


            <div style="clear: both;">&nbsp;</div>
        </div>

<jsp:include page="WEB-INF/layouts/footer.jsp"/>

