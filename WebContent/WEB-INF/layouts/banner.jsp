<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Financial management</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div id="logo">
				<h1>
					<a>Financial Management & Approval Tracking System</a>
				</h1>

			</div>
			<div
				style="position: absolute; top: 2px; right: 10px; background-color: #a0b0c0;">
				<c:if test="${!empty sessionScope.custid}">
					<a href="logout.jsp" class="bannerlink1">Logout</a>
				</c:if>
			</div>
			<c:if test="${!empty sessionScope.cb_id}">
				<div
					style="min-width: 20px; position: absolute; bottom: -4px; left: 1px; color: green; font-weight: bold">
					Welcome to <span
						style="color: #990066; font-style: italic; font-size: 22px;">
						${sessionScope.custname} </span>
				</div>
			</c:if>
		</div>
	</div>
</body>	