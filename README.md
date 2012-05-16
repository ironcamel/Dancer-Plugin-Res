# DESCRIPTION

Syntax sugar for setting the status and returning a response.

# INSTALLATION

    cpan Dancer::Plugin::Res

# EXAMPLE

    use Dancer;
    use Dancer::Plugin::Res;
    post '/widgets' => sub {
        return res 400 => 'Sorry, name param is required'
            unless param 'name';
    };
    dance;

# DOCUMENTATION

See [Dancer::Plugin::Res](https://metacpan.org/module/Dancer::Plugin::Res).
Also, after installation, you can view the documentation via `man` or `perldoc`:

    man Dancer::Plugin::Res
