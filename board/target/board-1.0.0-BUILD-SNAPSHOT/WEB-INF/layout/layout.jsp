<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/css/board.css">
</head>
<body>
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="content" ignore="true"/>
		<tiles:insertAttribute name="footer"/>
</body>
</html>