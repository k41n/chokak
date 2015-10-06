should   = require('should')
require('should-http')
assert   = require('assert')
request  = require('supertest')
mongoose = require('mongoose')
config   = require('../config-debug')
express  = require('express')

describe 'API', ->
  app = express()
  before (done) ->
    mongoose.connect config.db.mongodb
    done()

  describe 'People', ->
    it 'should return persons index', (done) ->
      request(app).get('/api/people')
      .end (err, res) ->
        res.should.have.status(200)
        done()
