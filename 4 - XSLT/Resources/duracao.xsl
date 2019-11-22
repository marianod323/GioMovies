<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>GioMovies - Duração</title>
				<link rel="stylesheet" type="text/css" href="style.css"/>
				<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-	ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
			</head>
			<body>
				<header>
					<nav class="navbar navbar-expand-lg">
	  				    <a id="nav-brand" class="navbar-brand" href="index.html">GioMovies</a>
					    <div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item active">
									<a class="nav-link" href="index.html">Filmes</a>
								</li>
								<li class="nav-item active">
									<a class="nav-link" href="generos.html">Gêneros</a>
								</li>
								<li class="nav-item active">
									<a class="nav-link" href="anos.html">Anos</a>
								</li>
								<li class="nav-item active">
									<a class="nav-link" href="elenco.html">Elenco</a>
								</li>
								<li class="nav-item active">
									<a class="nav-link" href="diretores.html">Diretores</a>
								</li>							
								<li class="nav-item active">
									<a class="nav-link" href="duracao.html">Duração</a>
								</li>						  
							</ul>
						</div>
					</nav>
					<div id="filmsHeader">
						<h1>GioMovies</h1>
					</div>
					<div id="headerDivider"></div>
				</header>
				<section class="list">
					<h2>Duração</h2>
					<ul>
						<xsl:for-each select="/topicMap/topic">
							<xsl:if test="./instanceOf/topicRef/@href = '#Duracao'">
								<br/>
								<li>
									<a href="{concat('Duracao/' , concat(@id , '.html'))}">
										<xsl:value-of select=".//baseNameString"/> min
									</a>
								</li>
							</xsl:if>
						</xsl:for-each>
					</ul>
				</section>
				<footer>
					<p id="disciplina">LINGUAGENS DE MARCAÇÃO EXTENSÍVEL - 2019/2</p>
					<p id="autores">Mariano Dorneles de Freitas e Talles Siqueira Ceolin</p>
				</footer>			
			</body>
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		</html>
	</xsl:template>
</xsl:stylesheet>
