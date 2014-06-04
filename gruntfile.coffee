module.exports = (grunt) ->
  grunt.initConfig
    pkg : grunt.file.readJSON('package.json')
    uglify :
      options :
        banner: '/*! <%= pkg.name %> <%= pkg.version %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
    
      build : 
        src : 'dist/<%= pkg.name %>.js',
        dest: 'dist/<%= pkg.name %>.min.js'

    coffee: 
      build:
        options:
          bare : true
        expand: true,
        cwd: './src',
        src: ['**/*.coffee'],
        dest: './',
        ext: '.js'
        extDot : 'last'
      
    copy:
      js:
        files:
          './dist/t2c.js' : ['./main/t2c.js']

    mochaTest:
      test:
        options:
          reporter: 'dot'
        src: ['test/**/*.js']

 
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-mocha-test')

  
  grunt.registerTask('build',['coffee','copy','uglify'])
  grunt.registerTask('test', ['build','mochaTest'])
  grunt.registerTask('default', ['test'])





