ReactDOM = require 'react-dom'
React = require 'react'
$ = require 'jquery'
Circle = require '../../components/circle'

circle = React.createFactory Circle
outlet = document.getElementById 'outlet'

handleClick = (evt, count) ->
    $.post '/api/circle', {}
        .then (res) -> render count: res.count

render = (props) ->
    props.onClick = handleClick
    ReactDOM.render circle(props), outlet

data = $(outlet).data 'outlet'
render data
