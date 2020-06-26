<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		</div>
	</div>
	</nav>
	<div class="container">
		<h1>Casa do Código</h1>
		<c:url value="/produtos" var="url" />

		<form:form commandName="produto" cssClass="w-50" action="${url }" method="POST"
			enctype="multipart/form-data">
			<div class="mb-3">
				<label class="form-label">Título</label>
				<form:input cssClass="form-control" path="titulo" />
				<form:errors path="titulo" />
			</div>
			<div class="mb-3">
				<label class="form-label">Descrição</label>
				<form:textarea cssClass="form-control" rows="10" cols="20"
					path="descricao"></form:textarea>
				<form:errors path="descricao" />
			</div>
			<div class="mb-3">
				<label class="form-label">Páginas</label>
				<form:input cssClass="form-control" path="paginas" />
				<form:errors path="paginas" />
			</div>
			<div class="mb-3">
				<label class="form-label">Data de Lançamento</label>
				<form:input cssClass="form-control" path="dataLancamento" />
				<form:errors path="dataLancamento" />
			</div>

			<c:forEach items="${tipos }" var="tipoPreco" varStatus="status">
				<div class="mb-3">
					<label class="form-label">${tipoPreco }</label>
					<form:input cssClass="form-control"
						path="precos[${status.index}].valor" />
					<form:hidden path="precos[${status.index}].tipo"
						value="${tipoPreco}" />
				</div>
			</c:forEach>
			<div class="mb-3">
				<label class="form-label">Sumário</label> <input
					cssClass="form-control" name="sumario" type="file" />
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
</body>
</html>