use strict;
use Test::More tests => 3;

use CGI;
use CGI::Untaint;

my $ok  = 'miyagawa@cpan.org';
my $not = 'miyagawa at cpan dot org';

my $q = CGI->new({
    ok => $ok,
    not => $not,
});

ok my $handler = CGI::Untaint->new($q->Vars), 'create the handler';

is $handler->extract(-as_email => 'ok'), $ok, 'Valid';
is $handler->extract(-as_email => 'not'), undef, 'Invalid';
