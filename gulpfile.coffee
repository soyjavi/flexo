"use strict"

gulp    = require "gulp"
concat  = require "gulp-concat"
connect = require "gulp-connect"
header  = require "gulp-header"
gutil   = require "gulp-util"
stylus  = require "gulp-stylus"
pkg     = require "./package.json"

flexo   =
  source: [ "source/normalize.styl"
            "source/flexo.styl"
            "source/flexo.*.styl"]
  theme : []
  bower : "dist/"

banner = [
  "/**"
  " * <%= pkg.name %> - <%= pkg.description %>"
  " * @version v<%= pkg.version %>"
  " * @link    <%= pkg.homepage %>"
  " * @author  <%= pkg.author.name %> (<%= pkg.author.site %>)"
  " * @license <%= pkg.license %>"
  " */"
  ""
].join("\n")

gulp.task "webserver", ->
  connect.server
    port      : 8000
    livereload: true

gulp.task "stylus", ->
  gulp.src flexo.source
    .pipe concat "flexo.styl"
    .pipe stylus
      compress: true
      errors  : true
    .pipe header banner, pkg: pkg
    .pipe gulp.dest flexo.bower
    .pipe connect.reload()

gulp.task "init", ["stylus"]

gulp.task "default", ->
  gulp.run ["webserver"]
  gulp.watch flexo.source, ["stylus"]
