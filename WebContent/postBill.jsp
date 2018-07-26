<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<jsp:include page="WEB-INF/layouts/banner.jsp" />
<jsp:include page="WEB-INF/layouts/links.jsp" />
<script type="text/javascript">
	function validateForm(form) {

		var x = form.claim_type.options[form.claim_type.selectedIndex].value;
		if (x == 0) {
			alert("Select Claim Type");
			return false;
		}
		var amount = form.amount.value;
		if (amount == null || amount == "") {
			alert("enter amount");
			return false;
		}

	}
</script>
<div id="page">
	<div id="page-bgtop">
		<div id="page-bgbtm">
			<div id="content">
				<div class="post">
					<form action="postBill" method="post"
						onsubmit="return validateForm(this)">
						<table border="1">
							<tr>
								<th colspan="2">Post Bill Details</th>
							</tr>
							<tr>
								<td>Claim Type</td>
								<td><sql:query dataSource="jdbc/fmats" var="claims"
										sql="SELECT * FROM claim_type" /> <select name="claim_type">
										<option value="0">Select Claim Type</option>
										<c:forEach items="${claims.rowsByIndex}" var="claim">
											<option value="${claim[0]}">${claim[1]}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>Claim Amount</td>
								<td><input type="text" name="amount" value="" /></td>
							</tr>
							<tr>
								<td><input type="submit" value="Post Claim" /></td>
								<td><input type="reset" value="Clear" /></td>
							</tr>
						</table>
					</form>

				</div>
			</div>


			<div style="clear: both;">&nbsp;</div>
		</div>

		<jsp:include page="WEB-INF/layouts/footer.jsp" />