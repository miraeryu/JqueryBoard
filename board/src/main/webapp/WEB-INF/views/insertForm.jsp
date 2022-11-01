<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertForm</h1>
	<div class="insert-form">
		<form>
			<table id="insert-form-table">
				<tbody>
					<tr>
						<td>글제목</td>
						<td><input type="text" name="title" id="title" placeholder="제목을 입력하세요."></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="registNm" id="registNm" placeholder="작성자를 입력하세요."></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<button type="button" id="insertPost" onclick="insertConf()">확인</button>
							<button type="button" onclick="list()">취소</button>			
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
<script>

	function insertConf(){
		var result = confirm("이대로 등록하시겠습니까?");
		if(result){
			insertPost();
		}else{
			alert("등록 취소하였습니다.")
		}
	}
	
	function insertPost(){
		var title = $("#title").val();
		var registNm = $("#registNm").val();
		var content = $("#content").val();
		let vo = {
				title : title
				, registNm : registNm
				, content : content
			}
		
		if(!title || !registNm || !content){
			alert("입력되지 않은 데이터가 있습니다.")
		}else{
		
			$.ajax({
				url : "insertPost",
				method : "POST",
				data : JSON.stringify(vo),
				dataTape : "text",
				contentType: "application/json; charset=UTF-8",
				error : function(error, status, msg){
					alert("데이터 전송 실패");
				},
				success : function(result){
					if(result = 1){
						alert("등록 성공");
						location.href="/";
					} else{
						alert("등록 실패");
					}
				}
			})
			
			
		}
	}	
</script>
</html>