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
	<div id="page-info">
		<input type="hidden" id="nowPage" value="${ vo.nowPage }">
		<input type="hidden" id="hiddenCategory" value="${ vo.category }">
		<input type="hidden" id="keyword" value="${ vo.keyword }">
	</div>
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
						<td><input type="text" name="updtNm" id="updtNm" placeholder="작성자를 입력하세요." value="${ post.updtNm }"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" placeholder="내용을 입력하세요.">${ post.content }</textarea></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<button type="button" onclick="editConfirm()">확인</button>
							<button type="button" onclick="listConfirm()">취소</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
<script>

	function listConfirm(){
		var result = confirm("수정사항이 모두 사라집니다. \n목록으로 돌아가시겠습니까?");
		if(result){
			goList();
		}else{
			alert("요청을 취소하였습니다.")
		}
	}
	
	function editConfirm(){
		var result = confirm("이대로 수정하시겠습니까?");
		if(result){
			editPost();
		}else{
			alert("수정을 취소하였습니다.")
		}
	}
	
	function editPost() {
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
		
		if(!title || !updtNm || !content){
			alert("입력되지 않은 데이터가 있습니다.")
		}else{
			$.ajax({
				url : "editPost",
				method : "POST",
				data : JSON.stringify(vo),
				dataTape : "text",
				contentType: "application/json; charset=UTF-8",
				error : function(error, status, msg){
					alert("데이터 전송 실패");
				},
				success : function(result){
					if(result = 1){
						alert("수정 성공");
						location.href="/";
					} else{
						alert("수정 실패");
					}
				}
			})
			
			
		}
		
		}
	
</script>
</html>