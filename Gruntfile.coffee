module.exports = (grunt) ->

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')

    livescript:
      lib:
        files:
          'lib/js/livescript.js': ['src/ls/*.ls']

    jshint:
      files: ['lib/js/livescript.js']
      options:
        globals:
          jQuery: true
          console: true
          browser: true
          node: true
          undef: true
          eqeqeq: true
          noarg: true

    uglify: 
      options: 
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      lib:
        files:
          'lib/js/vendor.min.js': ['vendor/js/**/*.js']

    stylus:
      lib:
        files:
          'lib/css/screen.css': ['src/styl/screen.styl']

    watch:
      files: ['src/gs/*.gs', 'src/ls/*.ls','src/styl/screen.styl']
      tasks: ['livescript', 'jshint', 'uglify', 'stylus']
  )

  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-livescript')

  grunt.registerTask('default', ['livescript', 'jshint', 'uglify', 'stylus'])
