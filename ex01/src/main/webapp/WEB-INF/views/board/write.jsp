<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><script src="../assets/js/color-modes.js"></script>
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
<script>
	function requestAction(url){
		//document.querySelector('#viewform').action = 'http://localhost:8080' + url;
		//document.querySelector('#viewform').submit();
		
		viewform.action = url;
		viewform.submit();
	}
</script>
</head>
<body>

<%@include file="../common/header.jsp" %>


<main class="container">
	
	  <div class="bg-body-tertiary p-5 rounded">
	    <h1>게시판</h1>
	    <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
	    <a class="btn btn-lg btn-primary" href="/board/list" role="button">리스트 &raquo;</a>
	  </div>
	  <p></p>
	  <!--글쓰기 -->
	 
	  <div class="list-group">
		<form method="post" action="/board/write" name="viewform">
			<div class="mb-3">
				 <label  for="title" class="form-label">제목</label>
				 <input name = "title" id = "title" type="text" class="form-control" value="${board.title }">
			</div>
			<div class="mb-3">
				 <label for="content" class="form-label">내용</label>
				 <textarea class="form-control" id="content" name="content" rows="3">${board.content }</textarea>
			</div>
			<div class="mb-3">
				 <label for="writer" class="form-label">작성자</label>
				 <input type="text" class="form-control" id="writer" name="writer" rows="3" value="${board.writer }">
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
			<!-- bno값이 있으면 수정하기 -->
				<c:if test="${not empty board.bno }" var="res">
				 <input type="hidden" name="bno" value="${board.bno }">
				 <button class="btn btn-primary me-md-2" id= "edit"onclick="requestAction('/board/editAction')">수정하기</button>
					
				</c:if>
				<c:if test="${not res }">
  					<button class="btn btn-primary me-md-2" type="submit">글쓰기</button>
				</c:if>
  				<button class="btn btn-primary" type="reset">초기화</button>
			</div>
		</form>
	   
	 </div>

	 
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>