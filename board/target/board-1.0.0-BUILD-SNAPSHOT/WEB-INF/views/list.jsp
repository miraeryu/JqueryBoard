<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="list-table">
		<table id="table-main">
			<colgroup>
				<col width="10%">
				<col width="45%">
				<col width="15%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</thead>
			<tbody>
				<c:forEach items="${ list }" var="Board">
					<tr>
						<td>${ Board.bbsId }</td>
						<td><a class="selectTitle" href="#" onclick="read('${ Board.bbsId }')">${ Board.title }</a></td>
						<td>${ Board.updtNm }</td>
						<td>${ Board.updtDt }</td>
						<td>${ Board.readCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5"><span><button type="button" onclick="goPostForm()">새글 쓰기</button></span></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<script>
	function read(id){
		url = "/readPost?bbsId=" + id ;
		location.href = url;
	}
	
	function goPostForm(){
		var url = "/insertForm";
		location.href = url;
	}
</script>
</html>