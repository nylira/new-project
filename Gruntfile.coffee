module.exports = (grunt) ->

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')

    gorilla:
      lib:
        files:
          'lib/js/app.js': ['src/gs/*.gs']

    jshint:
      lib:
        'lib/js/app.js'

    uglify: 
      options: 
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      lib:
        files:
          'lib/js/app.min.js': ['lib/js/*.js']

    stylus:
      lib:
        files:
          'lib/css/screen.css': ['src/styl/screen.styl']

    watch:
      files: ['src/**']
      tasks: ['gorilla', 'jshint', 'uglify', 'stylus']
  )

  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-gorilla')

  grunt.registerTask('default', ['gorilla', 'jshint', 'uglify', 'stylus'])