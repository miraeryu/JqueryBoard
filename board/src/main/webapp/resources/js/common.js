
// 리스트로 이동
function goList() {
	var category = $("#hiddenCategory").val();
	var keyword = $("#keyword").val();
	var nowPage = $("#nowPage").val();
	url = "/?category=" + category 
			+ "&keyword=" + keyword + "&nowPage=" 
			+ nowPage
	location.href = url;
}

function list() {
	location.href = "/";
}

