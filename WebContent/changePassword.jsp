<jsp:include page="WEB-INF/layouts/banner.jsp"/>
<jsp:include page="WEB-INF/layouts/links.jsp"/>

<div id="page">
    <div id="page-bgtop">
        <div id="page-bgbtm">
            <div id="content">
                <div class="post">
    <form action="changePassword" method="post">
        <table border="1">
            <tr>
                <td>Old Password</td>
                <td><input type="password" name="old"></td>
            </tr>
            <tr>
                <td>New Password</td>
                <td><input type="password" name="new"></td>
            </tr>
            <tr>
                <td>Retype</td>
                <td><input type="password" name="retype"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Change"></td>
                <td><input type="reset" value="Clear"></td>
            </tr>
        </table>
    </form>

                </div>
            </div>


            <div style="clear: both;">&nbsp;</div>
        </div>
<jsp:include page="WEB-INF/layouts/footer.jsp"/>
