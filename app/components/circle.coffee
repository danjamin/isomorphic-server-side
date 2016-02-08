Shape = require './shape'

class Circle extends Shape
    constructor: (props) ->
        super props
        @className += " circle"

module.exports = Circle
