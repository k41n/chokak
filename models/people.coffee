mongoose = require('mongoose')

personSchema = new mongoose.Schema
  name:   String

mongoose.model 'Person', personSchema