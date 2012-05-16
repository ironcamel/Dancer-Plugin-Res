package Dancer::Plugin::Res;

# VERSION

use strict;
use warnings;
use Dancer::Plugin;

register res => sub {
    my ($status, $body) = @_;
    status $status;
    return $body;
};

register_plugin;

# ABSTRACT: Syntax sugar for setting the status and returning a response

=head1 SYNOPSIS

    use Dancer;
    use Dancer::Plugin::Res;
    post '/widgets' => sub {
        return res 400 => 'Sorry, name param is required'
            unless param 'name';
    };
    dance;

=head1 DESCRIPTION

This L<Dancer> plugin provides the keyword C<res()>, which stand for response.
Calling C<return res 400, 'reason'> in a route is equivalent to:

    status 400;
    return 'reason';

=cut

1;
