var ReactDOM = require('react-dom');
var React = require('react');
var $ = require('jquery');

var Square = React.createFactory(require('../components/square'));
var outlet = document.getElementById('react-outlet');

function render(props) {
  props.onClick = handleClick;
  ReactDOM.render(Square(props), outlet);
}

$.get('/api/square').then(function (res) {
  render({ count: res.count });
});

function handleClick(evt, count) {
  $.post('/api/square', {count: count}).then(function (res) {
    render({ count: res.count });
  });
}
