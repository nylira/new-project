module.exports = (grunt) ->

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')

    gorilla:
      lib:
        files:
          'lib/js/app.js': ['src/gs/*.gs']

    uglify: 
      options: 
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      lib:
        files:
          'lib/js/app.min.js': ['lib/js/app.js']

    stylus:
      lib:
        files:
          'lib/css/screen.css': ['src/styl/screen.styl']

    watch:
      files: ['src/gs/*.gs', 'src/styl/screen.styl']
      tasks: ['gorilla', 'uglify', 'stylus']
  )

  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-gorilla')

  grunt.registerTask('default', ['gorilla', 'uglify', 'stylus'])
