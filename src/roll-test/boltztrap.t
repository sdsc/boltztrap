#!/usr/bin/perl -w
# boltztrap roll installation test.  Usage:
# boltztrap.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/boltztrap';
my $output;


if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'boltztrap installed');
} else {
  ok(! $isInstalled, 'boltztrap not installed');
}
SKIP: {

  skip 'boltztrap not installed', 4 if ! $isInstalled;

  $output = `module load boltztrap; BoltzTraP 2>&1`;
  like($output, qr/BoltzTraP vs 1.2.5/, 'boltztrap runs');
  `/bin/ls /opt/modulefiles/applications/boltztrap/[0-9]* 2>&1`;
  ok($? == 0, 'boltztrap module installed');
  `/bin/ls /opt/modulefiles/applications/boltztrap/.version.[0-9]* 2>&1`;
  ok($? == 0, 'boltztrap version module installed');
  ok(-l '/opt/modulefiles/applications/boltztrap/.version',
     'boltztrap version module link created');

}
