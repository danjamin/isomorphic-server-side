var express = require('express');
var exphbs = require('express-handlebars');
var path = require('path');
var bodyParser = require('body-parser');
var app;

function install_jsx(app) {
    require('node-jsx').install();
}

function serve_path(app, relative_path) {
    app.use(express.static(path.join(__dirname, relative_path)));
}

function setup_handlebars(app, extension) {
    app.engine(extension, exphbs({
        defaultLayout: 'main',
        extname: extension
    }));
    app.set('view engine', extension);
}

function bind_routes(app) {
    require('./routes/home_route')(app);
    require('./api/square_resource')(app);
}

function setup_body_parser(app) {
    app.use(bodyParser.urlencoded({ extended: false }));
}

function listen(app, port) {
    app.listen(port);
}

app = express();

install_jsx(app);
serve_path(app, '../public');
setup_handlebars(app, '.hbs');
setup_body_parser(app); // must be BEFORE routes!
bind_routes(app);
listen(app, process.env.WEB_PORT ? process.env.WEB_PORT : 8000);
