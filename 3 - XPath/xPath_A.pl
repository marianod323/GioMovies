#!/usr/bin/perl
use v5.18;
use strict;
use XML::LibXML;

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

our $xmlFile = $ARGV[0];
our $output = $ARGV[1];
our $xPathQuery = $ARGV[2];

my $doc = XML::LibXML->load_xml(location => $xmlFile);
my $xPath = XML::LibXML::XPathContext->new($doc);
our @nodes = $xPath->findnodes($xPathQuery);
open (File, '>:encoding(UTF-8)', $output) or die "Couldn't open output file.";

foreach (@nodes){
    $_ =~ s/\s+//g;
}

our @uniqueNodes = uniq(@nodes);

foreach (@uniqueNodes){
    print File $_ . "\n";
}