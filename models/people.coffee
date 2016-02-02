mongoose = require('mongoose')

personSchema = new mongoose.Schema
  name:   String
  token:  String

mongoose.model 'Person', personSchema
