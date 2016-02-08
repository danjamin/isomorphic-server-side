{client} = require '../services/redis'

module.exports = (app) ->
    app.post '/api/circle', (req, res) ->
        client.incr 'circle:click_count', (err, reply) ->
            reply = if reply? then parseInt reply, 10 else 0
            res.send count: reply
