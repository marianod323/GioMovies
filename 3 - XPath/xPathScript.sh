#!/bin/bash

perl xPath_A.pl GioMovies.xml saida_A.txt "//topic[descendant::instanceOf/topicRef/@href='#Genero']/baseName/baseNameString"

perl xPath_B.pl GioMovies.xml saida_B.txt "//topic[descendant::instanceOf/topicRef/@href='#Filme' and concat('#', @id)=//association[descendant::instanceOf/topicRef/@href='#filme-ano' and descendant::member/topicRef/@href='#id_2000']/member[1]/topicRef/@href]/baseName/baseNameString"

perl xPath.pl GioMovies.xml saida_C.txt "//topicRef[@href = '#sinopse']/../following-sibling::resourceData[contains(text(), 'especial ') or contains(text(), 'especial,') or contains(text(), 'especial.')]/../..//scope/topicRef[@href = '#ingles']/../following-sibling::resourceData"

perl xPath.pl GioMovies.xml saida_D.txt "//topic[instanceOf/topicRef/@href='#Filme' and concat('#', @id)=//association[descendant::instanceOf/topicRef/@href='#filme-genero' and descendant::member[2]/topicRef/@href='#thriller']/member[1]/topicRef/@href]/occurrence[instanceOf/topicRef/@href='#site']/resourceRef/@href"

perl xPath.pl GioMovies.xml saida_E.txt "count(//topic/occurrence/scope/topicRef[@href = '#elencoApoio']/../../following-sibling::occurrence/scope/topicRef[@href = '#elencoApoio']/../../following-sibling::occurrence/scope/topicRef[@href = '#elencoApoio']/../../following-sibling::occurrence/scope/topicRef[@href = '#elencoApoio']/../../..)"

perl xPath.pl GioMovies.xml saida_F.txt "//scope/topicRef[@href='#sinopse']//../following-sibling::resourceData[contains(., '(')]//../preceding-sibling::occurrence[2]/resourceData/../../@id"