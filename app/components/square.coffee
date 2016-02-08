Shape = require './shape'

class Square extends Shape
    constructor: (props) ->
        super props
        @className += " square"

module.exports = Square
