ReactDOMServer = require 'react-dom/server'
React = require 'react'
redis = require 'redis'
Square = require '../../components/square'

square = React.createFactory Square
client = redis.createClient 'redis://redis:6379'

module.exports = (app) ->
    app.get '/', (req, res) ->
        client.get "square:click_count", (err, reply) ->
            reply = if reply? then parseInt reply, 10 else 0
            html = ReactDOMServer.renderToString square(count: reply)
            res.render 'home/index', outlet: html
