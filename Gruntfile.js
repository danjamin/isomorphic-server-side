module.exports = function (grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    
    browserify: {
      dev: {
        files: {
          'public/home.js': ['app/views_client/home.js']
        },
        options: {
          transform: ['reactify'],
          plugin: ['reactify'],
          watch: true,
          keepAlive: true,
          browserifyOptions: {
            debug: true
          },
          watchifyOptions: {
            poll: 100,
            debug: true
          }
        }
      }
    }
  });

  // Load the plugin that provides the "browserify" task.
  grunt.loadNpmTasks('grunt-browserify');

  // Default task(s).
  grunt.registerTask('default', ['browserify:dev']);

};
