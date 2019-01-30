var gulp = require('gulp');
var replace = require('gulp-ex-replace');
var rename = require('gulp-rename');
var concat = require('gulp-concat');

gulp.task('default',function(){
  return gulp.src('src/*.sas')
             //Remove new lines and multiple spaces
             .pipe(replace(/\r\n|\n/g,''))
             .pipe(replace(/\s{2,}/g,' '))
             // Remove comments
             .pipe(replace(/\/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+\//g,''))
             .pipe(rename(function(path){ path.extname = ".min.sas"; }))
             .pipe(gulp.dest('dist/'));
});

gulp.task('append', function(){
  return gulp.src(['dist/*.min.sas', '!dist/main.min.sas'])
             .pipe(concat('main.min.sas'))
             .pipe(gulp.dest('dist'));
});
