{modules} = require './app/config'

module.exports = (grunt) ->

    # generate files from modules array
    browserify_files = {}
    for module in modules
        do (module) ->
            browserify_files["public/modules/#{module}.js"] =
                ["app/modules/#{module}/client.coffee"]

    # Project configuration
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        browserify:
            dev:
                files: browserify_files
                options:
                    transform: ['coffeeify']
                    plugin: ['coffeeify']
                    watch: true
                    keepAlive: true
                    browserifyOptions:
                        debug: true
                        extensions: '.coffee'
                    watchifyOptions:
                        poll: 100
                        debug: true

    # Load the plugin that provides the "browserify" task.
    grunt.loadNpmTasks 'grunt-browserify'

    # Default task(s)
    grunt.registerTask 'default', ['browserify:dev']
