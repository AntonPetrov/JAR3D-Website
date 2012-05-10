#!/usr/bin/perl

use strict;
use warnings;
use FindBin qw($RealBin);

use DBI;

if ($#ARGV != 0 ) {
	print "Provide query_id\n";
	exit;
}

sleep(3);

my %config = do $RealBin . '/jar3d_queue_config.pl';
my $dsn = 'DBI:mysql:' . $config{db_database}. ':localhost';
my $dbh = DBI->connect($dsn, $config{db_user_name}, $config{db_password});

my $input = $ARGV[0];

my $statement = "update jar3d_query_info set status = 1 where query_id = '$input';";
$dbh->do($statement);

$dbh->disconnect;