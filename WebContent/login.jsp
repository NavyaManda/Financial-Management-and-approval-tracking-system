<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<jsp:include page="WEB-INF/layouts/banner.jsp" />
<jsp:include page="WEB-INF/layouts/links.jsp" />

<div id="page">
	<div id="page-bgtop">
		<div id="page-bgbtm">
			<div id="content">
				<div class="post">
					<form action="login" method="post">
						<table border="1">
							<tr>
								<th colspan="2">Login Details</th>
							</tr>
							<tr>
								<td>Username</td>
								<td><input type="text" name="username" /></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<td><input type="submit" value="Login" /></td>
								<td><input type="reset" value="Clear" /></td>
								
							</tr>
						</table>
					</form>

				</div>
			</div>


			<div style="clear: both;">&nbsp;</div>
		</div>

		<jsp:include page="WEB-INF/layouts/footer.jsp" />