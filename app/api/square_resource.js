var redis = require('redis'),
    client = redis.createClient('redis://redis:6379');

module.exports = function (app) {
    app.post('/api/square', function (req, res) {
        var count = req.body.count;

        client.incr("square:click_count", function (err, reply) {
            res.send({ count: parseInt(reply, 10) });
        });
    });

    app.get('/api/square', function (req, res) {
        client.get("square:click_count", function (err, reply) {
            res.send({ count: parseInt(reply, 10) });
        });
    });
};
