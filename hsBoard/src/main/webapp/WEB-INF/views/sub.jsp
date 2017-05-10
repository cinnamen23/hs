<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jsp"%>

<body>
	<h1>View</h1>

	<table class="table table-condensed">
		<tr>
			<td>넘버</td>
			<td>타이틀</td>
			<td>내용</td>
			<td>글쓴이</td>
			<td>작성날짜</td>
			<td>최근수정날짜</td>
		</tr>
		<tr>
			<td>${vo.bno}</td>
			<td>${vo.title}</td>
			<td>${vo.content}</td>
			<td>${vo.writer}</td>
			<td>${vo.regdate}</td>
			<td>${vo.updatedate}</td>
		</tr>
	</table>

	<button id='turn'>
		<a>전체 리스트 보기</a>
	</button>

	<form id="f1">
		<input type="hidden" value="${vo.bno}" name="bno">
		<input type="hidden" value="${cri.page}" name="page">
		<input type="hidden" value="${cri.type}" name="type">
		<input type="hidden" value="${cri.keyword}" name="keyword">
		
	</form>
	<input type="button" value="삭제" id="deleteBtn">
	<input type="button" value="수정" id="modifyBtn">

	<script>
		$(document).ready(function() {

			$('#deleteBtn').on("click", function(e) {

				e.preventDefault();
				
				var result = confirm('진짜 지울래??'); 
				if(result) { 
					var formObj = $('#f1');

					formObj.attr('action', '/delete');
					formObj.attr('method', 'get');
					formObj.submit(); 
					
					alert("삭제 완료");
					} else {
						
				}



				

			});

			$('#modifyBtn').on("click", function(e) {

				e.preventDefault();

				var formObj = $('#f1');

				formObj.attr('action', '/modify');
				formObj.attr('method', 'get');
				formObj.submit();

			});

			
			$('#turn').on("click", function(e) {

				e.preventDefault();

				var formObj = $('#f1');

				formObj.attr('action', '/board/main');
				formObj.attr('method', 'get');
				formObj.submit();

			});
			
			
			
		});
	</script>


</body>
</html>