<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Livros de Java, Android, iPhone, PHP, Ruby e muito mais -
	Casa do Código</title>

<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light  mb-2">
	<div class="container-fluid">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="${s:mvcUrl('PC#show').build()}">Listagem de produtos</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${s:mvcUrl('PC#create').build()}">Cadastro de produtos</a></li>
			</ul>
			 <li class="nav-item">
     <a href="<c:url value="/logout" />">Sair</a></span>
 </li>
		</div>
	</div>
	</nav>
	<div class="container">
		<div>${message }</div>
		<table class=" table  table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Descrição</th>

					<th>Páginas</th>
				</tr>
			</thead>

			<tbody>

				<c:forEach items="${produtos }" var="produto">
					<tr>
						<td><a
							href="${s:mvcUrl('PC#show').arg(0,produto.id).build()}">
								${produto.titulo }</a></td>
						<td>${produto.descricao }</td>
						<td>${produto.paginas }</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</body>
</html>