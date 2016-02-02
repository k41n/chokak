should   = require('should')
require('should-http')
assert   = require('assert')
request  = require('supertest')
mongoose = require('mongoose')
config   = require('../config-debug')
express  = require('express')

dbURI    = config.db.mongodb
clearDB  = require('mocha-mongoose')(dbURI)

app = require('../app')

Person = mongoose.model('Person')
name = 'Ivan Ivanov'
token = '1234'

describe 'API', ->
  before (done) ->
    mongoose.connect(dbURI) unless mongoose.connection.readyState
    clearDB(done)

  describe '/me', ->
    it 'should return person if authenticated with token', (done) ->
      person = new Person()
      person.name = name
      person.token = token

      person.save ->
        request(app).get('/api/me')
        .set('Authentication', token)
        .end (err, res) ->
          res.should.have.status(200)
          res.body[0].name.should.equal(name)
          done()

    it 'should return 404 if not authenticated with token', (done) ->
      request(app).get('/api/me')
      .end (err, res) ->
        res.should.have.status(404)
        done()
