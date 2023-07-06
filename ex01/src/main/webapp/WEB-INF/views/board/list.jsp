<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko" data-bs-theme="auto">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thorn   ton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>Fixed top navbar example · Bootstrap v5.3</title>

   <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/navbar-fixed/">
   
   
   <link href="/resources/css/style.css" rel="stylesheet">
   
   <!-- 알림창 -->
	<script type="text/javascript">
	let msg = "${msg}";
		
	window.onload=function(){
		if(msg != ''){
			// 메세지 출력
			document.querySelector(".modal-body").innerHTML = msg;
			
			//
			document.querySelector("#btnModalSave").style.display='none';
			
			let myModal = new bootstrap.Modal(document.getElementById('myModal'),{
			  keyboard: false
			});
			
			myModal.show();
		}
		
	}
	
	function requestAction(url,bno){
		searchForm.action = url;
		searchForm.bno.value= bno;
		searchForm.submit();
	}
</script>
   

    <!-- Custom styles for this template -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
  <body>0
<%@include file="../common/header.jsp" %>

   <main class="container">
   
     <div class="bg-body-tertiary p-5 rounded">
       <h1>게시판</h1>
       <p class="lead">부트스트랩을 이용한 게시판 만들기</p>
       <a class="btn btn-lg btn-primary" href="/board/write" role="button">글쓰기 &raquo;</a>
     </div>
     
     <%@include  file="../common/searchForm.jsp"%>
     <c:forEach items="${list }" var="vo">
       <div class="list-group">
        
         <a onclick="requestAction('/board/view',${vo.bno})" href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
           <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
           <div class="d-flex gap-2 w-100 justify-content-between">
             <div>
               <h6 class="mb-0">${vo.title }</h6>
               <p class="mb-0 opacity-75">${vo.writer }</p>
             </div>
             <small class="opacity-50 text-nowrap">${vo.regdate }</small>
           </div>
         </a>
         
           </div>
   
    </c:forEach>
    <%@ include file="../common/pageNavi.jsp" %>
   </main>
   
   <!-- Modal -->
<div id="myModal" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="">저장</button>
        <button type="button" class="btn btn-primary" id="btnModalSave">Save changes</button>
      </div>
    </div>
  </div>
</div>
   
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>