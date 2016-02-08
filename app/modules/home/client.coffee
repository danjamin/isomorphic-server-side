ReactDOM = require 'react-dom'
React = require 'react'
$ = require 'jquery'
Square = require '../../components/square'

square = React.createFactory Square
outlet = document.getElementById 'react-outlet'

handleClick = (evt, count) ->
    $.post '/api/square', {}
        .then (res) -> render count: res.count

render = (props) ->
    props.onClick = handleClick
    ReactDOM.render square(props), outlet

data = $(outlet).data 'top'
render data
