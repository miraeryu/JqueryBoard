<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	list-style : none;
	margin : 0 auto;
	padding : 0;
	display : table;
}

li {
	margin : 2px;
	padding : 0;
	float : left;
}

#searchKey {
	text-align : center;
	margin-top : 10px;
	margin-bottom : 10px;
}

#paging {
	text-align : center;
}
</style>
</head>
<body>
	<div id="searchKey">
		<form action="/" method="GET">
			<select id="category" name="category" class="category">
				<option value="all">제목/내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="updtNm">작성자</option>
			</select>
			<input type="text" id="keyword" name="keyword" class="keyword" value="${ vo.keyword }">
			<button type="submit" id="searchBtn" name="searchBtn">검색</button>
		</form>
	</div>
	<div id="page-info">
		<input type="hidden" id="nowPage" value="${ vo.nowPage }">
		<input type="hidden" id="hiddenCategory" value="${ vo.category }">
	</div>
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
				<c:if test="${ fn:length(list) > 0}">
					<c:forEach items="${ list }" var="Board">
						<tr>
							<td>${ Board.bbsId }</td>
							<td><a class="selectTitle" href="#" onclick="read('${ Board.bbsId }')">${ Board.title }</a></td>
							<td>${ Board.updtNm }</td>
							<td>${ Board.updtDt }</td>
							<td>${ Board.readCnt }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${ fn:length(list) == 0 }">
					<td colspan="5"><h4>검색 결과가 없습니다.</h4></td>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" id="paging">
						<c:if test="${ fn:length(list) > 0}">
							<ul>
								<c:if test="${ vo.nowPage != 1 }">
									<li>
										<a href="#" onclick="goPage('${ vo.nowPage - 1 }')">
											<c:out value="prev"></c:out>
										</a>
									</li>
								</c:if>
								<c:forEach var="page" begin="${ vo.startPage }" end="${ vo.endPage }">
									<li><a href="#" onclick="goPage('${ page }')"><c:out value="${ page }"></c:out></a></li>							
								</c:forEach>
								<c:if test="${ vo.nowPage != vo.maxPageCnt }">
									<li>
										<a href="#" onclick="goPage('${ vo.nowPage + 1 }')">
											<c:out value="next"></c:out>
										</a>
									</li>
								</c:if>
							</ul>
						</c:if> 
					</td>
				</tr>
				<tr>
					<td>${ boardVO.nowPage } 페이지</td>
					<td colspan="4"><span><button type="button" onclick="goPostForm()">새글 쓰기</button></span></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<script>
$("document").ready(function(){
	var category = $("#hiddenCategory").val();
	if(category){
		$("#category").val(category).prop("selected", true);
	}
})

	function read(id){
		var category = $("#hiddenCategory").val();
		var keyword = $("#keyword").val();
		var nowPage = $("#nowPage").val();
		url = "/readPost?category=" + category 
				+ "&keyword=" + keyword + "&nowPage=" 
				+ nowPage + "&bbsId=" + id ;
		location.href = url;
	}
	
	function goPostForm(){
		var url = "/insertForm";
		location.href = url;
	}	
	
	function goPage(page){
		var category = $("#hiddenCategory").val();
		var keyword = $("#keyword").val();
		var url = "/?category=" + category 
				+ "&keyword=" + keyword + "&nowPage=" + page;
		location.href= url;
	}
	
</script>
</html>