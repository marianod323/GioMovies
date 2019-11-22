#!/usr/bin/perl
use v5.18;
use strict;
use XML::LibXML;
use XML::LibXSLT::Easy;
use File::Copy;
use File::Copy::Recursive qw(dircopy);

# Directories creation

mkdir "Site";
mkdir "Site/Filmes";
mkdir "Site/Generos";
mkdir "Site/Elenco";
mkdir "Site/Duracao";
mkdir "Site/Diretores";
mkdir "Site/Anos";
mkdir "Site/img";

my ($xmlFile, $resourcesPath) = @ARGV;

# Fetch resources

dircopy("$resourcesPath/img", "Site/img");
dircopy("$resourcesPath/Filmes", "Site/Filmes");
copy("$resourcesPath/style.css", "Site");

# Libs variables

my $xsltEasy = XML::LibXSLT::Easy->new();
my $xml = XML::LibXML->load_xml(location => $xmlFile);
my $xPath = XML::LibXML::XPathContext->new($xml);

# Putting XSL into a perl string

my $index = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/index.xsl", out=>"Site/index.html");
my $years = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/anos.xsl", out=>"Site/anos.html");
my $directors = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/diretores.xsl", out=>"Site/diretores.html");
my $duration = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/duracao.xsl", out=>"Site/duracao.html");
my $cast = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/elenco.xsl", out=>"Site/elenco.html");
my $genres = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/generos.xsl", out=>"Site/generos.html");

# Taking the ID's from a xPath consult on the XML file

my @moviesID = $xPath->findnodes("/topicMap/topic/instanceOf/topicRef[\@href = '#Filme']/../../\@id");
my @yearsID = $xPath->findnodes("/topicMap/topic/instanceOf/topicRef[\@href = '#Ano']/../../\@id");
my @directorsID = $xPath->findnodes("/topicMap/topic/instanceOf/topicRef[\@href = '#Direcao']/../../\@id");
my @durationID = $xPath->findnodes("/topicMap/topic/instanceOf/topicRef[\@href = '#Duracao']/../../\@id");
my @castID = $xPath->findnodes("/topicMap/topic/instanceOf/topicRef[\@href = '#Elenco']/../../\@id");
my @genresID = $xPath->findnodes("/topicMap/topic/instanceOf/topicRef[\@href = '#Genero']/../../\@id");

# Pages generation
# For perfomance purpose, the movies pages generation are commented

#my $moviesContent = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/contentFilmes.xsl");
#my @contents = split("<html>", $moviesContent);
#my $count = @moviesID;

#for(my $i = 0; $i < $count; $i++){
#    @contents[$i+1] = "<html>@contents[$i+1]";
#    @moviesID[$i] = substr(@moviesID[$i], 5, -1);
#    open(my $filehandle, '>', "Site/Filmes/@moviesID[$i].html");
#    print $filehandle @contents[$i+1];
#    close($filehandle);
#}

my $yearsContent = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/contentAno.xsl");
my @contents = split("<html>", $yearsContent);
my $count = @yearsID;

for(my $i = 0; $i < $count; $i++){
    @contents[$i+1] = "<html>@contents[$i+1]";
    @yearsID[$i] = substr(@yearsID[$i], 5, -1);
    open(my $filehandle, '>', "Site/Anos/@yearsID[$i].html");
    print $filehandle @contents[$i+1];
    close($filehandle);
}

my $directorsContent = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/contentDiretores.xsl");
my @contents = split("<html>", $directorsContent);
my $count = @directorsID;

for(my $i = 0; $i < $count; $i++){
    @contents[$i+1] = "<html>@contents[$i+1]";
    @directorsID[$i] = substr(@directorsID[$i], 5, -1);
    open(my $filehandle, '>', "Site/Diretores/@directorsID[$i].html");
    print $filehandle @contents[$i+1];
    close($filehandle);
}

my $durationContent = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/contentDuracao.xsl");
my @contents = split("<html>", $durationContent);
my $count = @durationID;

for(my $i = 0; $i < $count; $i++){
    @contents[$i+1] = "<html>@contents[$i+1]";
    @durationID[$i] = substr(@durationID[$i], 5, -1);
    open(my $filehandle, '>', "Site/Duracao/@durationID[$i].html");
    print $filehandle @contents[$i+1];
    close($filehandle);
}

my $castContent = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/contentElenco.xsl");
my @contents = split("<html>", $castContent);
my $count = @castID;

for(my $i = 0; $i < $count; $i++){
    @contents[$i+1] = "<html>@contents[$i+1]";
    @castID[$i] = substr(@castID[$i], 5, -1);
    open(my $filehandle, '>', "Site/Elenco/@castID[$i].html");
    print $filehandle @contents[$i+1];
    close($filehandle);
}

my $genresContent = $xsltEasy->process(xml=> $xmlFile, xsl=> "$resourcesPath/contentGeneros.xsl");
my @contents = split("<html>", $genresContent);
my $count = @genresID;

for(my $i = 0; $i < $count; $i++){
    @contents[$i+1] = "<html>@contents[$i+1]";
    @genresID[$i] = substr(@genresID[$i], 5, -1);
    open(my $filehandle, '>', "Site/Generos/@genresID[$i].html");
    print $filehandle @contents[$i+1];
    close($filehandle);
}