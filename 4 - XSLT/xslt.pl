#!/usr/bin/perl
use v5.18;
use strict;
use XML::LibXSLT::Easy;
use XML::LibXML;

our $xmlFile = $ARGV[0];
our $xslFile = $ARGV[1];
our $output = $ARGV[2];

my $xslt = XML::LibXSLT::Easy->new();

my $source = $xslt->process(xml=> $xmlFile, xsl=> $xslFile, out=>$output);