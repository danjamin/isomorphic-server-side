{client} = require '../services/redis'

module.exports = (app) ->
    app.post '/api/square', (req, res) ->
        client.incr 'square:click_count', (err, reply) ->
            reply = if reply? then parseInt reply, 10 else 0
            res.send count: reply

    app.get '/api/square', (req, res) ->
        client.get 'square:click_count', (err, reply) ->
            reply = if reply? then parseInt reply, 10 else 0
            res.send count: reply
