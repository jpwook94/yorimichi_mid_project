<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<h1>destination jsp</h1>
<c:forEach items="${destinationList}" var="destination">
    name : ${destination.destination_name}
    location : ${destination.location}
    tags : ${destination.tags}
</c:forEach>
<%--<form action="destination-add">--%>
<%--    destination_name<input name="destination_name">--%>
<%--    location<input name="location">--%>
<%--    tags<input name="tags">--%>
<%--    <button>add</button>--%>
<%--</form>--%>


</body>
</html>