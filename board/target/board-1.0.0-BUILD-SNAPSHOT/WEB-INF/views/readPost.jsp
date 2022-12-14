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
	<h1>readPost</h1>
	<div id="read-post-div">
		<table id="read-table">
			<tbody>
				<tr>
					<td>글 번호</td>
					<td colspan="5">${ post.bbsId }</td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="5">${ post.title }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${ post.updtNm }</td>
					<td>작성 날짜</td>
					<td>${ post.updtDt }</td>
					<td>조회 수</td>
					<td>${ post.readCnt + 1 }</td>
				</tr>
				<tr>
					<td colspan="6">${ post.content }</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<button type="button" onclick="goModify('${ post.bbsId }')">수정하기</button>
						<button type="button" onclick="goList()">목록으로</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<script>
	function goList(){
		location.href="/" ;
	}
	function goModify(id){
		url = "/editForm?bbsId=" + id ;
		location.href= url ;
	}
</script>
</html>