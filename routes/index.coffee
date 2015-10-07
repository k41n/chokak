express  = require 'express'
mongoose = require 'mongoose'
router = express.Router()

router.get '/', (req, res, next) ->
  res.render 'index'

module.exports = router