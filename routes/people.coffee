express = require('express')
mongoose = require('mongoose')
router = express.Router()

Person = mongoose.model('Person')

router.get '/', (req, res, next) ->
  Person.find (err, persons) ->
    if (err)
      return next(err)
    res.json persons

module.exports = router
