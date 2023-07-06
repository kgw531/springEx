<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ${pageDto.cri } -->
<form method="get" class="row g-3" action="/board/list" name="searchForm">
	<input type="text" name="bno" value="">
	<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo }">
		<div class="row g-3 justify-content-center">
		  <div class="col-auto">
		  <!-- 검색조건 -->
			<select name = "searchField" class="form-select" aria-label="Default select example">
			  <option value="title" <c:if test="${pageDto.cri.searchField == 'title'}">selected</c:if> >제목</option>
			  <option value="content" <c:if test="${pageDto.cri.searchField == 'content'}">selected</c:if>>내용</option>
			  <option value="writer" <c:if test="${pageDto.cri.searchField == 'writer'}">selected</c:if>>작성자</option>
			</select>
		  </div>
		  
		  <div class="col-auto">
		    <label for="inputPassword2" class="visually-hidden"></label>
		    <!-- 검색 내용 -->
		    <input name="searchWord" type="text" class="form-control" id="inputPassword2" value="${pageDto.cri.searchWord }">
		  </div>
		  <div class="col-auto">
		    <button type="submit" class="btn btn-primary mb-3" onclick="go(1)">검색</button>
		  </div>
		</div>
</form>
</body>
</html>