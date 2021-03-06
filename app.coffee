express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
mongoose = require 'mongoose'

require('./models/people')

routesPeople = require './routes/people'
routesMe     = require './routes/ME'
index        = require './routes/index'
require('coffee-script/register')

app = express()

# view engine setup
app.set 'views', path.join __dirname, 'build'
app.set 'view engine', 'jade'

# uncomment after placing your favicon in /public
# app.use favicon "#{__dirname}/public/favicon.ico"
app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded
  extended: false
app.use cookieParser()
app.use express.static path.join __dirname, 'public'
app.use express.static path.join __dirname, 'build'

app.use '/api', routesPeople
app.use '/api', routesMe
app.use '/', index

# catch 404 and forward to error handler
app.use (req, res, next) ->
    err = new Error 'Not Found'
    err.status = 404
    next err

# error handlers

# development error handler
# will print stacktrace
if app.get('env') is 'development'
    app.use (err, req, res, next) ->
        console.log 'ERROR:', err
        console.error err.stack
        res.status err.status or 500
        res.render 'error',
            message: err.message,
            error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
    res.status err.status or 500
    console.log 'ERROR:', err
    res.render 'error',
        message: err.message,
        error: {}

module.exports = app
