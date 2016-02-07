React = require 'react'

{ div } = React.DOM

class Square extends React.Component
    render: ->
        div
            className: "square"
            onClick: @handleClick.bind(this)
            @props.count

    handleClick: (evt) ->
        @props.onClick evt, @props.count + 1

Square.propTypes =
    onClick: React.PropTypes.func
    count: React.PropTypes.number.isRequired

module.exports = Square
