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
	<div id="page-info">
		<input type="hidden" id="nowPage" value="${ vo.nowPage }">
		<input type="hidden" id="hiddenCategory" value="${ vo.category }">
		<input type="hidden" id="keyword" value="${ vo.keyword }">
	</div>
	<div id="read-post-div">
		<table id="read-table">
			<tbody>
				<tr>
					<td>글 번호</td>
					<td colspan="5" id="bbsId">${ post.bbsId }</td>
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
						<button type="button" onclick="delConfirm()">삭제하기</button>
						<button type="button" onclick="goList()">목록으로</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<script>
	function goModify(id){
		var category = $("#hiddenCategory").val();
		var keyword = $("#keyword").val();
		var nowPage = $("#nowPage").val();
		url = "/editForm?category=" + category 
				+ "&keyword=" + keyword + "&nowPage=" 
				+ nowPage + "&bbsId=" + id ;
		location.href= url ;
	}
	
	function delConfirm(){
		var result = confirm("정말 삭제하시겠습니까?");
		if(result){
			deletePost();
		}else{
			alert("삭제를 취소하였습니다.")
		}
	}
	
	function deletePost(){
		var bbsId = $("#bbsId").text();
		url = "deletePost?bbsId=" + bbsId;
		
		$.ajax({
			url : url,
			method : "GET",
			error : function(error, status, msg){
				alert("데이터 전송 실패");
			},
			success : function(result){
				if(result = 1){
					alert("삭제 성공");
					location.href="/";
				} else{
					alert("삭제 실패");
				}
			}
		})
	}
</script>
</html>