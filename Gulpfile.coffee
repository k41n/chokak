gulp        = require('gulp')
coffee      = require('gulp-coffee')
gutil       = require('gulp-util')
express     = require('express')
app         = require('./app')
livereload  = require('gulp-livereload')
path        = require('path')
mongoose    = require('mongoose')
usemin      = require('gulp-jade-usemin')
uglify      = require('gulp-uglify')
minifyHtml  = require('gulp-minify-html')
minifyCss   = require('gulp-minify-css')
rev         = require('gulp-rev')
clean       = require('gulp-clean')

gulp.task 'coffee', ['clean'],  ->
  gulp.src('./src/**/*.coffee')
    .pipe( coffee({bare: true}).on('error', gutil.log) )
    .pipe( gulp.dest('./public/') )
    .pipe( livereload() )

gulp.task 'jade', ->
  livereload.reload()

gulp.task 'usemin', ['coffee'], ->
  gulp.src('./views/*.jade')
    .pipe(usemin({
      css: [minifyCss(), 'concat'],
      html: [minifyHtml({empty: true})],
      js: [uglify(), rev()]
    }))
    .pipe(gulp.dest('build/'))

gulp.task 'clean', ->
  gulp.src('build', {read: false})
    .pipe(clean({force: true}))

gulp.task 'express', ['usemin'], ->
  app.use express.static(path.resolve('./public'))

  mongoose.connect('mongodb://localhost/chokak')
  mongoose.set('debug', true)

  app.listen 1337
  gutil.log 'Listening on port: 1337'

gulp.task 'compile', ['clean', 'coffee', 'usemin']

gulp.task 'watch', ->
  livereload.listen()
  gulp.watch('src/javascripts/**/*.coffee',['coffee'])
  gulp.watch('routes/**/*.coffee',['express', 'usemin'])
  gulp.watch('views/**/*.jade',['jade', 'usemin'])

gulp.task 'default', ['clean', 'coffee', 'usemin', 'express', 'watch']