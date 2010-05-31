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
            script {
                attr {
                    src => 'http://code.jquery.com/jquery-1.4.2.min.js',
                }
            }
            script {
                attr {
                    src => 'js/main.js',
                }
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
                    a {
                        attr { href => $Sections{home}->[1] }
                        $Sections{home}->[0]
                    }
                };

                ul {
                    attr { class => 'nav' };
                    for (@Sections) {
                        next if $_ eq 'home';
                        li {
                            attr { class => 'innerseg', id => "nav_$_" };
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
                div { attr { class => 'innerfoot' }; outs_raw q[&nbsp;]; }
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
    my $list_link = sub {
        my ($label, $link) = @_;
        li {
            a {
                attr {
                    href => $link
                }
                $label
            }
        }
    };

    h1 { "Links" }
    p { 'You can find me on many other sites:' }
    ul {
        $list_link->('My Blog', 'http://jarsonmar.blogspot.com/'),
        $list_link->('GitHub', 'http://github.com/jasonmay'),
        $list_link->('Twitter', 'http://twitter.com/jasonmay'),
        $list_link->('Flickr', 'http://flickr.com/photos/jasonmay'),
        $list_link->('Facebook', 'http://facebook.com/jarsonmar'),
        $list_link->('Last.FM', 'http://last.fm/user/Jarsonmar'),
    }
};

template projects_content => sub {
    h1 { "Projects" }
    h2 {
        'AberMUD'
    }
    p { 'Lorem Ipsum' }
    h2 {
        'Dataninja'
    }
    p { 'Lorem Ipsum' }
};

template contact_content => sub {
    h1 { "Contact Information" }
    p {
        outs 'You can contact me here: ';
        img {
            attr { src => 'img/email.png' }
        }
    }
    p {
        q[
            I have a cell phone by which you can
            contact me, as well. Drop me an e-mail
            and I can give you that information if
            you wish to have it.
        ]
    }
};

template home_content => sub {
    h1 { 'jarsonmar.org' }
    p { 'Hi!' }
};

template about_content => sub {
    h1 { 'About Jason' }
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

