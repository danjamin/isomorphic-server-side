React = require 'react'

{ div } = React.DOM

class Shape extends React.Component
    constructor: (props) ->
        super props
        @className = "shape"

    render: ->
        div
            className: @className
            onClick: @handleClick.bind(this)
            @props.count

    handleClick: (evt) ->
        @props.onClick evt, @props.count + 1

Shape.propTypes =
    onClick: React.PropTypes.func
    count: React.PropTypes.number.isRequired

module.exports = Shape
