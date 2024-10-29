<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<title>도서 목록</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서 목록</h1>
				<p class="col-md-8 fs-4">BookList</p>
			</div>
		</div>	
		<%
			BookRepository dao=BookRepository.getInstance();
			ArrayList<Book> listOfBooks=dao.getAllBooks();
		%>
		
		<div class="row align-items-md-stretch text-center">
			<%
				for (int i = 0; i < listOfBooks.size(); i++) {
					Book book = listOfBooks.get(i);
			%>
			<div class="col-md-4">
				<div class="h-100 p-2">
					<img src="./resources/images/<%= book.getFilename() %>" style="width : 250; height : 350" />
					<h5><strong><%= book.getName() %></strong></h5>
					<p><%= book.getAuthor() %></p>
					<p><%= book.getPublisher() %> | <%= book.getUnitPrice() %>원</p>
					<p><%= book.getDescription().substring(0, 60) %>...</p>
					<p><%= book.getUnitPrice() %>원</p>
					<p> <a href="./book.jsp?id=<%=book.getBookId() %>"
						class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
				</div>
			</div>
			<%	
				}
			%>
			
		</div>
	
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>