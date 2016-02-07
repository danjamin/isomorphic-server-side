express = require 'express'
exphbs = require 'express-handlebars'
path = require 'path'
bodyParser = require 'body-parser'

serve_path = (app, relative_path) ->
    dir = path.join __dirname, relative_path
    app.use express.static dir

setup_handlebars = (app, extension) ->
    config = exphbs
        defaultLayout: 'main'
        extname: extension
    app.engine extension, config
    app.set 'view engine', extension

bind_routes = (app) ->
    require('./routes/home_route') app
    require('./api/square_resource') app

setup_body_parser = (app) ->
    app.use bodyParser.urlencoded extended: false

listen = (app, port = 8000) -> app.listen port

app = express()
serve_path app, '../public'
setup_handlebars app, '.hbs'
setup_body_parser app # must be BEFORE routes!
bind_routes app
listen app, process.env.WEB_PORT
