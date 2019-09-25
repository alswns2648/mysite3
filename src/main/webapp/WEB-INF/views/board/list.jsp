<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>\


<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link
	href="${pageContext.servletContext.contextPath }/assets/css/board.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="board">
				<form id="search_form" action="" method="post">
					<input type="text" id="kwd" name="kwd" value=""> <input
						type="submit" value="찾기">
				</form>
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>

					<c:set var="count" value='${fn:length(board) }' />
					<c:forEach items='${board }' var='vo' varStatus='status'>
						<tr>
							<td>${count - status.index }</td>
							<td><img style='padding-left:${25*vo.depth }px'
								src='${pageContext.servletContext.contextPath }/assets/images/reply.png' />
								<a
								href="${pageContext.servletContext.contextPath }/board?a=view&no=${vo.no }">
									${vo.title } </a></td>
							<td>${vo.user_name }</td>
							<td>${vo.hit }</td>
							<td>${vo.reg_date }</td>
								<td><a href="${pageContext.servletContext.contextPath }/board?a=delete&no=${vo.no }" class="del">삭제</a></td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${!empty authUser }">
					<div class="bottom">
						<a
							href="${pageContext.servletContext.contextPath }/board?a=writeform"
							id="new-book">글쓰기</a>
					</div>
				</c:if>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="board" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>