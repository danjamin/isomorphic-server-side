ReactDOMServer = require 'react-dom/server'
React = require 'react'

Circle = require '../../components/circle'
{client} = require '../../services/redis'

circle = React.createFactory Circle

module.exports = (app) ->
    app.get '/circle', (req, res) ->
        client.get "circle:click_count", (err, reply) ->
            reply = if reply? then parseInt reply, 10 else 0
            data = count: reply
            html = ReactDOMServer.renderToString circle(data)
            res.render 'circle/index',
                outlet:
                    html: html
                    data: data
                title: 'Circle'
                scripts: ['/modules/circle.js']
