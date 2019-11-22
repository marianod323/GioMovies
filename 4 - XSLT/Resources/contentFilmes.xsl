<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">	
		<xsl:for-each select="/topicMap/topic/instanceOf/topicRef[@href = '#Filme']">
			<xsl:variable name="this" select="./../../@id"></xsl:variable>
			<xsl:variable name="genero" select="//topic/instanceOf/topicRef[@href = '#Genero']/../../@id[/topicMap/topic/instanceOf/topicRef[@href = '#Filme']/../../..//association//topicRef[@href = '#filme-genero']/../..//topicRef[@href = concat('#', $this)]/../following-sibling::member/topicRef/@href = concat('#', .)]"></xsl:variable>
			<xsl:variable name="duracao" select="//topic/instanceOf/topicRef[@href = '#Duracao']/../../@id[/topicMap/topic/instanceOf/topicRef[@href = '#Filme']/../../..//association//topicRef[@href = '#filme-duracao']/../..//topicRef[@href = concat('#', $this)]/../following-sibling::member/topicRef/@href = concat('#', .)]"></xsl:variable>
			<xsl:variable name="ano" select="//topic/instanceOf/topicRef[@href = '#Ano']/../../@id[/topicMap/topic/instanceOf/topicRef[@href = '#Filme']/../../..//association//topicRef[@href = '#filme-ano']/../..//topicRef[@href = concat('#', $this)]/../following-sibling::member/topicRef/@href = concat('#', .)]"></xsl:variable>
			<xsl:variable name="direcao" select="//topic/instanceOf/topicRef[@href = '#Direcao']/../../@id[/topicMap/topic/instanceOf/topicRef[@href = '#Filme']/../../..//association//topicRef[@href = '#filme-direcao']/../..//topicRef[@href = concat('#', $this)]/../following-sibling::member/topicRef/@href = concat('#', .)]"></xsl:variable>
			<xsl:variable name="elenco" select="//topic/instanceOf/topicRef[@href = '#Elenco']/../../@id[/topicMap/topic/instanceOf/topicRef[@href = '#Filme']/../../..//association//topicRef[@href = '#filme-elenco']/../..//topicRef[@href = concat('#', $this)]/../following-sibling::member/topicRef/@href = concat('#', .)]"></xsl:variable>
			<html>
				<head>
					<title><xsl:value-of select="../../baseName/baseNameString"/></title>
					<link rel="stylesheet" type="text/css" href="../style.css"/>
					<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-	ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
				</head>
				<body>
					<header>
						<nav class="navbar navbar-expand-lg">
							<a id="nav-brand" class="navbar-brand" href="../index.html">GioMovies</a>
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
					<section id="movieDescription">
						<h1><xsl:value-of select="../../baseName/baseNameString"/></h1>
						<h2 id="engTitle"><xsl:value-of select="../../occurrence/scope/topicRef[@href = '#ingles']/../../resourceData"/></h2>
						<h3>GÊNERO</h3>
						<a href="{concat('../Generos/' , concat( $genero , '.html'))}"><xsl:value-of select="$genero/..//baseNameString"/></a>
						<h3>ANO</h3>
						<a href="{concat('../Anos/' , concat( $ano , '.html'))}"><xsl:value-of select="$ano/..//baseNameString"/></a>
						<h3>SINOPSE</h3>
						<p><xsl:value-of select="../../occurrence/scope/topicRef[@href = '#sinopse']/../../resourceData"/></p>
						<h3>DURAÇÃO</h3>
						<a href="{concat('../Duracao/' , concat( $duracao , '.html'))}"><xsl:value-of select="$duracao/..//baseNameString"/></a>
						<h3>DISTRIBUIÇÃO</h3>
						<h5><xsl:value-of select="../../occurrence/scope/topicRef[@href = '#distribuicao']/../../resourceData"/></h5>
						<h3>DIREÇÃO</h3>
						<a href="{concat('../Direcao/' , concat( $direcao , '.html'))}"><xsl:value-of select="$direcao/..//baseNameString"/></a>
						<h3>ELENCO</h3>
						<xsl:for-each select="$elenco">
							<a href="{concat('../Elenco/' , concat( current() , '.html'))}"><xsl:value-of select="current()/..//baseNameString"/></a>
							<br/>
						</xsl:for-each>
						<h3>ELENCO DE APOIO</h3>
						<xsl:for-each select="../../occurrence/scope/topicRef[@href='#elencoApoio']">
							<xsl:variable name="apoio" select="../../../../topic//topicRef[@href='#Elenco']/../..//baseNameString[. = current()/../../resourceData]/../../@id"></xsl:variable>
							<a href="{concat('../Elenco/', concat( $apoio,  '.html'))}"><xsl:value-of select="current()/../../resourceData"></xsl:value-of></a>
							<br/>
						</xsl:for-each>
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
