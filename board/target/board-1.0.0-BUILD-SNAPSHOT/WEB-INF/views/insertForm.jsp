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
						<td><input type="text" name="writer" id="writer" placeholder="작성자를 입력하세요."></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" placeholder="내용을 입력하세요."></textarea></td>
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
	function goList(){
		location.href="/"
	}
</script>
</html>