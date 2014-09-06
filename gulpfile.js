var gulp        = require('gulp');
var browserSync = require('browser-sync');
var reload      = browserSync.reload;
var sass        = require('gulp-sass');
var filter      = require('gulp-filter');
var coffee      = require('gulp-coffee');
var compass     = require('gulp-compass');
var uglify      = require('gulp-uglify');
var concat      = require('gulp-concat');
var ngTemplates = require('gulp-angular-templates');
// var imagemin    = require('gulp-imagemin');
var sourcemaps  = require('gulp-sourcemaps');
var bowerFiles  = require('gulp-bower-files');
var del         = require('del');
var express     = require('express');
var lrserver    = require('tiny-lr');
var refresh    = require('gulp-livereload');
var livereload  = require('connect-livereload');

var lrport = 35729;
var serverport = 9000;

var server = express()

server.use(livereload({
  port: lrport
}));
server.use(express.static('/dist'));
// var minifyCSS   = require('gulp-minify-css');
// Static server

var paths = {
  bower: 'client/bower_components',
  scripts: './client/scripts/**/*.coffee',
  styles: './client/styles/**/*.css',
  index: './client/index.html',
  views: './client/views/**/*.html',
  images: './client/images/**/*.jpg'
}
var dest = {
  bower: 'dist/bower_components',
  scripts: './dist/scripts',
  styles: './dist/styles',
  index: './dist',
  views: './dist/views',
  images: './dist/images'
}

// gulp.task('browser-sync', function() {
//     browserSync({
//         // server: {
//         //     baseDir: "./",
//         // },
//         proxy: 'localhost:9000'
//     });
// });

gulp.task('clean', function(cb){
  del(['dist'], cb);
});

gulp.task('styles',['clean'], function () {
  return gulp.src(paths.styles)
    // .pipe(compass({
    //   sass: app/assets
    // }))
    .pipe(gulp.dest(dest.styles))
    // .pipe(reload({stream:true}));
});
gulp.task('scripts',['clean'], function () {
  return gulp.src(paths.scripts)
    .pipe(coffee())
    .pipe(uglify())
    .pipe(concat('app.min.js'))
    .pipe(sourcemaps.write())
    // .pipe(browserify())
    .pipe(gulp.dest(dest.scripts));
});

gulp.task('views', ['clean'], function(){
  return gulp.src(paths.views)
    .pipe(ngTemplates())
    .pipe(gulp.dest(dest.views));
});
gulp.task('index', ['clean'], function(){
  return gulp.src(paths.index)
    .pipe(ngTemplates())
    .pipe(gulp.dest(dest.index));
});

gulp.task('images', ['clean'], function(){
  return gulp.src(paths.images)
    // .pipe(imagemin({optimizationLevel: 5}))
    .pipe(gulp.dest(dest.images))
});

gulp.task('bower-files', ['clean'], function(){
  return bowerFiles({
    bowerDirectory: paths.bower,
    bowerrc: './.bowerrc',
    bowerJson: './bower.json',
  }).pipe(gulp.dest(dest.bower));
});

gulp.task('serve', function(){
  server.listen(serverport);

  lrserver.listen(lrport)
});

gulp.task('build', ['clean'], function(){
  gulp.run('styles', 'scripts', 'images', 'index', 'views', 'bower-files');
})

// Default task to be run with `gulp`
gulp.task('default', ['build', 'serve'], function () {
    gulp.watch(paths.index, ['index']);
    gulp.watch(paths.views, ['views']);
    gulp.watch(paths.styles, ['styles']);
    gulp.watch(paths.scripts, ['scripts']);
});
// or...

// gulp.task('browser-sync', function() {
//     browserSync({
//         proxy: "yourlocal.dev"
//     });
// });