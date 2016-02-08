express = require 'express'
exphbs = require 'express-handlebars'
path = require 'path'
bodyParser = require 'body-parser'
{modules, apis, helpers} = require './config'

serve_path = (app, relative_path) ->
    dir = path.join __dirname, relative_path
    app.use express.static dir

setup_views = (app, extension) ->
    helper_config = {}
    for helper in helpers
        do (helper) ->
            helper_config[helper] = require "./helpers/#{helper}"
    cwd = process.cwd()
    config = exphbs
        defaultLayout: 'main'
        layoutsDir: "#{cwd}/layouts"
        partialsDir: "#{cwd}/partials"
        helpers: helper_config
        extname: extension
    app.engine extension, config
    app.set 'view engine', extension
    app.set 'views', "#{cwd}/modules"

bind_routes = (app) ->
    # generate from config
    for module in modules
        do (module) ->
            require("./modules/#{module}/server") app
    for api in apis
        do (api) ->
            require("./api/#{api}") app

setup_body_parser = (app) ->
    app.use bodyParser.urlencoded extended: false

listen = (app, port = 8000) -> app.listen port

app = express()
serve_path app, '../public'
setup_views app, '.hbs'
setup_body_parser app # must be BEFORE routes!
bind_routes app
listen app, process.env.WEB_PORT
