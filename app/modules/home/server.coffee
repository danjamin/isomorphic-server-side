ReactDOMServer = require 'react-dom/server'
React = require 'react'

Square = require '../../components/square'
{client} = require '../../services/redis'

square = React.createFactory Square

module.exports = (app) ->
    app.get '/', (req, res) ->
        client.get "square:click_count", (err, reply) ->
            reply = if reply? then parseInt reply, 10 else 0
            html = ReactDOMServer.renderToString square(count: reply)
            res.render 'home/index', outlet: html
