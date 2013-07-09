module.exports = (grunt) ->

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')

    gorilla:
      lib:
        files:
          'lib/js/gorilla.js': ['src/gs/*.gs']

    livescript:
      lib:
        files:
          'lib/js/livescript.js': ['src/ls/*.ls']

    uglify: 
      options: 
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      lib:
        files:
          'lib/js/app.min.js': ['lib/js/gorilla.js', 'lib/js/livescript.js']
          'lib/js/vendor.min.js': ['vendor/js/**/*.js']

    stylus:
      lib:
        files:
          'lib/css/screen.css': ['src/styl/screen.styl']

    watch:
      files: ['src/gs/*.gs', 'src/ls/*.ls','src/styl/screen.styl']
      tasks: ['gorilla', 'livescript', 'uglify', 'stylus']
  )

  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-gorilla')
  grunt.loadNpmTasks('grunt-livescript')

  grunt.registerTask('default', ['gorilla', 'livescript', 'uglify', 'stylus'])
