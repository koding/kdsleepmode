module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        htmlmin: {
            dist: {
                options: {
                    collapseWhitespace: true,
                    minifyJS: true,
                    removeComments: true
                },
                files: {
                    'build/index.html': 'core/template/main.html'
                }
            }
        },
        sass: {
            dist: {
                options: {
                    style: 'compressed',
                    sourcemap: 'none'
                },
                files: {
                    'build/assets/css/screen.min.css' : 'core/sass/screen.scss'
                }
            }
        },
        coffee: {
            compileJoined: {
                options: {
                    join: true
                },
                files: {
                    'build/assets/js/app.min.js': ['core/coffee/*.coffee']
                }
            }  
        },
        uglify: {
            js: {
                files: {
                    'build/assets/js/app.min.js': ['build/assets/js/app.min.js']
                }
            }
        },
        copy: {
            main: {
                expand: true,
                cwd: 'core/assets/',
                src: '**',
                dest: 'build/assets/'
            },
        },
        watch: {
            files: ['core/template/*', 'core/sass/*', 'core/coffee/*'],
            tasks: ['htmlmin', 'sass', 'coffee', 'uglify', 'copy']
        }
    });
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('default', ['htmlmin', 'sass', 'coffee', 'uglify', 'copy']);
};