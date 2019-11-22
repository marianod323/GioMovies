#!/usr/bin/perl
use v5.18;
use strict;
use XML::LibXML;
use Try::Tiny qw(try catch);

our $xmlFile = $ARGV[0];
our $schemaFile = $ARGV[1];

my $doc = XML::LibXML->load_xml(location => $xmlFile);
my $schema = XML::LibXML::Schema->new(location => $schemaFile);

my $is_xml_valid = try {
    not $schema->validate( $doc );
}
catch {
    say '==> ' . $_;
    return 0;
};
say $is_xml_valid ? 'Valid' : 'Invalid';