<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EditForm</h1>
	<div class="edit-form">
		<form>
			<input type="hidden" name="bbsId" id="bbsId" value="${ post.bbsId }">
			<table id="edit-form-table">
				<tbody>
					<tr>
						<td>글제목</td>
						<td><input type="text" name="title" id="title" placeholder="제목을 입력하세요." value="${ post.title }"></td>
					</tr>
					<tr>
						<td>수정자</td>
						<td><input type="text" name="writer" id="writer" placeholder="작성자를 입력하세요." value="${ post.updtNm }"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" placeholder="내용을 입력하세요.">${ post.content }</textarea></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<button type="submit">확인</button>
							<button type="button" onclick="goList()">취소</button>			
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
<script>
	
	/*function submitMod(){
		var bbsId = $("#bbsId").val();
		var title = $("#title").val();
		var updtNm = $("#updtNm").val();
		var content = $("#content").val();
		let vo = {
				bbsId : bbsId
				, title : title
				, updtNm : updtNm
				, content : content
		}
		
			$.ajax({
				url : "editPost",
				method : "POST",
				data : vo,
				dataType : "json",
				error : function(error, status, msg){
					alert("데이터 전송 실패");
				},
				success : function(result){
					if(result = 1){
						alert("수정 성공");
					} else{
						alert("수정 실패");
					}
				}
			})
		}*/
</script>
</html>