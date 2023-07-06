<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function go(page){
		document.searchForm.action = "/board/list";
		document.searchForm.pageNo.value=page;
		document.searchForm.submit();
	}
</script>
</head>
<body>
<!-- 값이 넘어오는 지 확인 -->
<!-- ${totalCnt } -->
<!-- ${pageDto } -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item ${pageDto.prev ? '': 'disabled' }" >
      <a class="page-link" onclick="go(${pageDto.startNo - 1})">Previous</a>
    </li>
    
    <c:forEach var="i" begin="${pageDto.startNo }" end="${pageDto.endNo }">
	    <li class="page-item <c:if test="${pageDto.cri.pageNo eq i }">active</c:if>"><a class="page-link" onclick="go(${i} )">${i }</a></li>
    
    </c:forEach>
    <li class="page-item ${pageDto.next ? '': 'disabled' }">
      <a class="page-link" onclick="go(${pageDto.endNo + 1})">Next</a>
    </li>
  </ul>
</nav>

</body>
</html>