ReactDOM = require 'react-dom'
React = require 'react'
$ = require 'jquery'
Square = require '../components/square'

square = React.createFactory Square
outlet = document.getElementById 'react-outlet'

render = (props) ->
    props.onClick = handleClick
    ReactDOM.render square(props), outlet

$.get '/api/square'
    .then (res) -> render count: res.count

handleClick = (evt, count) ->
    $.post '/api/square', {}
        .then (res) -> render count: res.count
