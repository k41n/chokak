gulp        = require('gulp')
coffee      = require('gulp-coffee')
gutil       = require('gulp-util')
express     = require('express')
app         = require('./app')
livereload  = require('gulp-livereload')
path        = require('path')
mongoose    = require('mongoose')

gulp.task 'coffee', ->
  gulp.src('./src/**/*.coffee')
    .pipe( coffee({bare: true}).on('error', gutil.log) )
    .pipe( gulp.dest('./public/') )
    .pipe( livereload() )

gulp.task 'jade', ->
  livereload.reload()

gulp.task 'express', ->
  app.use express.static(path.resolve('./public'))

  mongoose.connect('mongodb://localhost/chokak')

  app.listen 1337
  gutil.log 'Listening on port: 1337'

gulp.task 'compile', ['coffee']

gulp.task 'watch', ->
  livereload.listen()
  gulp.watch('src/javascripts/**/*.coffee',['coffee'])
  gulp.watch('routes/**/*.coffee',['express'])
  gulp.watch('views/**/*.jade',['jade'])

gulp.task 'default', ['coffee', 'express', 'watch']