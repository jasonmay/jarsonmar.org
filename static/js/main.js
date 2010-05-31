$(function() {
    var navs = {
        home: 'index.html',
        about: 'about.html',
        projects: 'projects.html',
        links: 'links.html',
        contact: 'contact.html',
    }
        $('#nav_home').click(function() {
            window.location = 'index.html';
        });

        $('#nav_about').click(function() {
            window.location = 'about.html';
        });

        $('#nav_projects').click(function() {
            window.location = 'projects.html';
        });

        $('#nav_links').click(function() {
            window.location = 'links.html';
        });

        $('#nav_contact').click(function() {
            window.location = 'contact.html';
        });
});
