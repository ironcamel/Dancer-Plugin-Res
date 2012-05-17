package Dancer::Plugin::Res;

# VERSION

use Dancer ':syntax';
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
        return res 400 => to_json { err => 'name is required' }
            unless param 'name';
        # ...
        return res 201 => to_json { widget => $widget };
    };
    dance;

=head1 DESCRIPTION

This L<Dancer> plugin provides the keyword C<res()>, which stands for response.
It allows you to set the response and return a body in one shot.

    return res 400, { msg => reason };

is equivalent to:

    status 400;
    return { msg => reason };

I made this plugin because I wanted a function like L<send_error()>
for ReST applications that return things like json instead of html.
C<send_error "reason ...", 500> will not always render the first argument
you give it in the response.
When your app is running in production mode, it will attempt to render
a generic 500.html page.
Which is great for front-end things,
but not for back-end code where you always want your application to render the
thing that you told it to render.

=cut

1;
