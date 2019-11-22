#!/usr/bin/perl
use v5.18;
use strict;
use XML::LibXML;
use Try::Tiny qw(try catch);

our $xmlFile = $ARGV[0];
our $dtdFile = $ARGV[1];

my $doc = XML::LibXML->load_xml(location => $xmlFile);
my $dtd = XML::LibXML::Dtd->new('', $dtdFile);

my $is_xml_valid = try {
    $doc->validate($dtd)
}
catch {
    say '==> ' . $_;
    return 0;
};
say $is_xml_valid ? 'Valid' : 'Invalid';