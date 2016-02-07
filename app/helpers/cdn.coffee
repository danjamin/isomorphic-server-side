module.exports = (path) ->
    root = process.env?.CDN_ROOT
    root = "" if !root
    return "#{root}#{path}"
