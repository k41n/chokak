should   = require('should')
require('should-http')
assert   = require('assert')
request  = require('supertest')
mongoose = require('mongoose')
config   = require('../config-debug')
express  = require('express')

dbURI    = 'mongodb://localhost/chokak_test'
clearDB  = require('mocha-mongoose')(dbURI)

describe 'API', ->
  app = require('../app')
  before (done) ->

    console.log 'Connecting to Mongo'
    mongoose.connect(dbURI)
    console.log 'Connected.'

    clearDB(done)

  describe 'People', ->
    it 'should return persons index', (done) ->
      Person = mongoose.model('Person')
      person = new Person()
      person.name = 'Ivan Ivanov'
      person.save ->
        request(app).get('/api/people')
        .end (err, res) ->
          res.should.have.status(200)
          console.log res.body
          done()
