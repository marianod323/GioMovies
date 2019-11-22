#!/usr/bin/perl
use v5.18;
use strict;
use XML::LibXML;

our $xmlFile = $ARGV[0];
our $output = $ARGV[1];
our $xPathQuery = $ARGV[2];

my $source = XML::LibXML->load_xml(location => $xmlFile);
my $xPath = XML::LibXML::XPathContext->new($source);
my $subStr = substr($xPathQuery, 0, 5);
our $count = 0;
our $isCount = 0;
if ($subStr eq 'count'){
    $xPathQuery = substr($xPathQuery, 6, -1);
    $isCount = 1;
}
our @nodes = $xPath->findnodes($xPathQuery);
open (File, '>:encoding(UTF-8)', $output) or die "Couldn't open output file.";

foreach (@nodes){
    if (not $isCount){
        print File $_ . "\n";
    }
    else{
        $count = $count + 1;
    }
}

if ($isCount){
    print File $count;
}