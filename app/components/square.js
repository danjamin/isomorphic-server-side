var React = require('react');

module.exports = React.createClass({
    propTypes: {
      onClick: React.PropTypes.func.isRequired,
      count: React.PropTypes.number.isRequired
    },

    render: function () {
      return (
        <div className="square" onClick={this.handleClick}>
            {this.props.count}
        </div>
      );
    },

    handleClick: function (evt) {
        this.props.onClick(evt, this.props.count + 1);
    }
});
