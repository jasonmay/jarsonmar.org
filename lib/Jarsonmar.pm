#!/usr/bin/env perl
package Jarsonmar;
use strict;
use warnings;
use Template::Declare::Tags;
use base qw/Template::Declare/;

use vars qw(@Sections %Sections);
@Sections = qw(home about projects links contact);

%Sections = (
    home       => ['jarsonmar.org', 'index.html'],
    about      => ['About Jason', 'about.html'],
    projects   => ['Projects', 'projects.html'],
    links      => ['Links', 'links.html'],
    contact    => ['Contact', 'contact.html'],
);


BEGIN {
    my $stylesheet = 'styles/main.css';
    create_wrapper wrap => sub {
        my $code = shift;
        html {
            head {
                title { 'jarsonmar.org' }
            }
            link {
                attr {
                    rel   => 'stylesheet',
                    media => 'screen',
                    type  => 'text/css',
                    href  => $stylesheet,
                }
            }
            body {
                $code->();
            }
        };
    };
}


foreach my $section (keys %Sections) {
    template $section => sub {
        wrap {
            div {
                attr { class => 'outer' }
                div {
                    attr { class => 'innerhead' }
                    $Sections{home}->[0]
                };

                for (@Sections) {
                    next if $_ eq 'home';
                    div {
                        attr { class => 'innerseg' };
                        if ($_ eq $section) {
                            $Sections{$_}->[0]
                        }
                        else {
                            a {
                                attr { href => $Sections{$_}->[1] }
                                $Sections{$_}->[0]
                            }
                        }
                    }
                }
            }
            div {
                attr { class => "container" }
                div {
                    attr { class => "${section}_container" }
                    show("${section}_content");
                }
            }
        }
    };
}

template links_content => sub {
    p { 'TODO' }
};

template projects_content => sub {
    p { 'TODO' }
};

template contact_content => sub {
    p { 'TODO' }
};

template home_content => sub {
    h1 { 'jarsonmar.org' }
    p { 'Hi!' }
};

template about_content => sub {
    h1 { 'About Me' }
    p {
        q[
            My name is Jason May.
            I work at Silverback Network as
            a Perl programmer.
        ]
    }
    h2 { 'Interests' }
    p {
        'Etc.'
    }
};

1;

