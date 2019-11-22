<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">	
		<xsl:for-each select="/topicMap/topic/instanceOf/topicRef[@href = '#Elenco']">
			<xsl:variable name="this" select="./../../@id"></xsl:variable>
			<html>
				<head>
					<title><xsl:value-of select="../../baseName/baseNameString"/></title>
					<link rel="stylesheet" type="text/css" href="../style.css"/>
					<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-	ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
				</head>
				<body>
					<header>
						<nav class="navbar navbar-expand-lg">
							<a id="nav-brand" class="navbar-brand" href="index.html">GioMovies</a>
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item active">
										<a class="nav-link" href="../index.html">Filmes</a>
									</li>
									<li class="nav-item active">
										<a class="nav-link" href="../generos.html">Gêneros</a>
									</li>
									<li class="nav-item active">
										<a class="nav-link" href="../anos.html">Anos</a>
									</li>
									<li class="nav-item active">
										<a class="nav-link" href="../elenco.html">Elenco</a>
									</li>
									<li class="nav-item active">
										<a class="nav-link" href="../diretores.html">Diretores</a>
									</li>							
									<li class="nav-item active">
										<a class="nav-link" href="../duracao.html">Duração</a>
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
						<h1><xsl:value-of select="../../baseName/baseNameString"/></h1>						
						<ul>
							<xsl:for-each select="../../../association/member/topicRef[@href = concat('#', $this)]">
								<xsl:variable name="movie" select="../preceding-sibling::member/topicRef/@href"></xsl:variable>
								<br/>
								<li>
									<a href="{concat('../Filmes/',concat(translate($movie,'#','') ,'.html'))}">
										<xsl:value-of select="//topic[concat('#', @id) = $movie]/baseName/baseNameString"></xsl:value-of>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</section>
					<footer>
						<p id="disciplina">LINGUAGENS DE MARCAÇÃO EXTENSÍVEL - 2019/2</p>
						<p id="autores">Mariano Dorneles de Freitas e Talles Siqueira Ceolin</p>
					</footer>
				</body>
			</html>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
