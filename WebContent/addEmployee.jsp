<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>
<script type="text/javascript">
    function validateForm(form)
    {
        var x=form.role_id.options[form.role_id.selectedIndex].value;        
        var name=form.name.value; 
        var email=form.email.value;
        var atpos=email.indexOf("@");
        var dotpos=email.lastIndexOf(".");
        var contact=form.contact.value;
        
        var IsoDateRe = new RegExp("^([0-9]{4})-([0-9]{2})-([0-9]{2})$");
        var dob=form.dob.value;
        if (dob==null || dob=="")
        {
            alert("enter date of birht");
            return false;
        }
        if (IsoDateRe.test(dob)) {
          
            
        } else{
            alert("enter valid date format");
            return false;
        }
        var doj=form.doj.value;
        if (doj==null || doj=="")
        {
            alert("enter date of joining");
            return false;
        }
        if (IsoDateRe.test(doj)) {
          
            
        } else{
            alert("enter valid date format");
            return false;
        }
        
        if (name==null || name=="")
        {
            alert("Please Enter Name");
            return false;
        }
        var address=form.address.value; 
        if (address==null || address=="")
        {
            alert("Please Enter Address");
            return false;
        }
        
        if (email==null || email=="")
        {
            alert("Please Enter Email");
            return false;
        }
       
       
        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
        {
            alert("Not a valid e-mail address");
            return false;
        }
          
        if(x==0){
            alert("Please Check Your Role");
            return false;
        }   
        
        
        if (contact==null || contact=="")
        {
            alert("Please Enter Mobile No");
            return false;
        }
        var pattern = /^\d{10}$/;
        if (pattern.test(contact)) {
          
            
        } 
        else{
            alert("enter valid mobile no");
            return false;
        }  
          if(!document.getElementById("role").checked && !document.getElementById("role1").checked)
                {alert("select Gender");  
                    return false;
                }    
    }
</script>
<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <form action="addEmployee" method="post" onsubmit="return validateForm(this)">
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
                    <td><input type="text" name="name" value="" /></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="address" rows="4" cols="36"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>EMail</td>
                    <td><input type="text" name="email" value="" /></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="contact" value="" /></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="text" name="dob" value="" />YYYY-MM-DD</td>
                </tr>
                <tr>
                    <td>Date of Joining</td>
                    <td><input type="text" name="doj" value="" />YYYY-MM-DD</td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <sql:query dataSource="jdbc/fmats" var="departments"
                                   sql="SELECT * FROM department"/>
                        <select name="department_id" id="department_id">
                            <option value="0">Select Department</option>
                            <c:forEach items="${departments.rowsByIndex}" var="department">
                                <option value="${department[0]}">${department[1]}</option>
                            </c:forEach>
                        </select>
                        Note: For Manager or Admin do not select any department
                    </td>
                </tr>
                <tr>
                    <td>Role</td>
                    <td>
                        <sql:query dataSource="jdbc/fmats" var="roles"
                                   sql="SELECT * FROM role"/>
                        <select name="role_id" id="role_id">
                            <option value="0">Select Role</option>
                            <c:forEach items="${roles.rowsByIndex}" var="role">
                                <option value="${role[0]}">${role[1]}</option>
                            </c:forEach>
                        </select>                        
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="gender" value="M" id="role"/>Male
                        <input type="radio" name="gender" value="F"  id="role1"/>Female
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add Employee" /></td>
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

