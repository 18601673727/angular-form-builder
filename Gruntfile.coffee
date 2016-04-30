module.exports = (grunt) ->
    grunt.config.init
        sass:
            example:
                options:
                    sassDir: 'example'
                    cssDir: 'example'
                    outputStyle: 'compressed'
            src:
                options:
                    sassDir: 'src'
                    cssDir: 'dist'
                    outputStyle: 'compressed'

        coffee:
            source:
                files:
                    'dist/angular-form-builder.js': ['src/*.coffee']
            components:
                files:
                    'dist/angular-form-builder-components.js': ['components/*.coffee']
            demo:
                files:
                    'example/demo.js': 'example/demo.coffee'

        uglify:
            build:
                files:
                    'dist/angular-form-builder.min.js': 'dist/angular-form-builder.js'
                    'dist/angular-form-builder-components.min.js': 'dist/angular-form-builder-components.js'

        watch:
            sass:
                files: ['example/*.scss', 'src/*.scss']
                tasks: ['sass']
                options:
                    spawn: no
            coffee:
                files: ['src/*.coffee', 'components/*.coffee', 'example/*.coffee']
                tasks: ['coffee']
                options:
                    spawn: no

        connect:
            server:
                options:
                    protocol: 'http'
                    hostname: '*'
                    port: 8000
                    base: '.'

        karma:
            min:
                configFile: 'test/karma-min.config.coffee'
            source:
                configFile: 'test/karma.config.coffee'

    # -----------------------------------
    # register task
    # -----------------------------------
    grunt.registerTask 'dev', [
        'sass'
        'coffee'
        'connect'
        'watch'
    ]
    grunt.registerTask 'build', [
        'sass'
        'coffee'
        'uglify'
    ]
    grunt.registerTask 'test', ['karma']

    # -----------------------------------
    # Plugins
    # -----------------------------------
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-karma'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
