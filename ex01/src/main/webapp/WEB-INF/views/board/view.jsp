<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../assets/js/color-modes.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/navbar-fixed/">
	


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="../common/header.jsp" %>
<script>
	function requestAction(url){
		viewForm.action=url;
		viewForm.submit();
	}
</script>


<main class="container">
	
	  <div class="bg-body-tertiary p-5 rounded">
	    <h1>게시판</h1>
	    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
	    <a class="btn btn-lg btn-primary" href="/board/list?pageNo=${param.pageNo}&searchField=${param.searchField }&searchWord=${param.searchWord }" role="button">목록 &raquo;</a>
	  </div>
	  <p></p>
	  <!--글쓰기 -->
	  <div class="list-group">
	<form method="get" action="/board/write" name="viewForm"> 
		<input type="hidden" name="bno" value="${board.bno }">
			<div class="mb-3">
				 <label  for="title" class="form-label">제목</label>
				 <input name = "title" id = "title" type="text" class="form-control" value="${board.title }" readonly>
			</div>
			<div class="mb-3">
				 <label for="content" class="form-label">내용</label>
				 <textarea class="form-control" id="content" name="content" rows="3" readonly>${board.content }</textarea>
			</div>
			<div class="mb-3">
				 <label for="writer" class="form-label">작성자</label>
				 <input type="text" class="form-control" id="writer" name="writer" rows="3" value="${board.writer }" readonly>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
  				<button class="btn btn-primary" onclick="requestAction('/board/edit')" >수정</button>
  				<button class="btn btn-primary"  onclick="location.href='/board/delete?bno=${board.bno}'">삭제</button>
			</div>
		</form> 
	   
	 </div>

	 
</main>



</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</html>