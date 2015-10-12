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

describe 'API', ->
  before (done) ->

    mongoose.connect(dbURI)
    clearDB(done)

  describe 'People', ->
    it 'should return persons index', (done) ->
      person = new Person()
      person.name = name

      person.save ->
        request(app).get('/api/people')
        .end (err, res) ->
          res.should.have.status(200)
          res.body[0].name.should.equal(name)
          done()

    it 'should return specific person', (done) ->
      person = new Person()
      person.name = name

      person.save ->
        request(app).get('/api/people')
        .end (err, res) ->
          request(app).get("/api/people/#{res.body[0]._id}")
          .end (err, res) ->
            res.should.have.status(200)
            res.body.name.should.equal(name)
            done()

    it 'should create specific person', (done) ->
      request(app).post '/api/people'
      .send
        name: name
      .end (err, res) ->
        res.should.have.status(200)
        Person.find (err, persons) ->
          persons.length.should.equal(1)
          persons[0].name.should.equal(name)
          done()

    it 'should be able to delete specific person', (done) ->
      person = new Person()
      person.name = name

      person.save ->
        request(app).get('/api/people')
        .end (err, res) ->
          request(app).delete "/api/people/#{res.body[0]._id}"
          .end (err, res) ->
            res.should.have.status(200)
            Person.find (err, persons) ->
              persons.length.should.equal(0)
              done()

    it 'should update specific person', (done) ->
      person = new Person()
      person.name = name

      person.save ->
        request(app).get('/api/people')
        .end (err, res) ->
          request(app).put "/api/people/#{res.body[0]._id}"
          .send
            name: 'Vasily Alibabaev'
          .end (err, res) ->
            res.should.have.status(200)
            Person.find (err, persons) ->
              persons.length.should.equal(1)
              persons[0].name.should.equal('Vasily Alibabaev')
              done()