var ReactDOMServer = require('react-dom/server');
var React = require('react');
var square = React.createFactory(require('../components/square'));
var redis = require('redis'),
    client = redis.createClient('redis://redis:6379');

module.exports = function (app) {
    app.get('/', function (req, res) {
        client.get("square:click_count", function (err, reply) {
            var html = ReactDOMServer.renderToString(square({
              onClick: function() {},
              count: parseInt(reply, 10)
            }));
            res.render('home', {outlet: html});
        });
    });
};
