
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:choose>
			<c:when test="${!empty sessionScope.role }">
				<c:redirect url="http://localhost:8181/pfe/notificationDirecteur"/>
			</c:when>
			<c:when test="${!empty sessionScope.grade }">
				<c:redirect url="http://localhost:8181/pfe/notification"/>
			</c:when>
			<c:when test="${!empty sessionScope.cne }">
				<c:redirect url="http://localhost:8181/pfe/notification"/>
			</c:when>
		</c:choose>

</body>
</html>