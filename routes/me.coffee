express = require('express')
mongoose = require('mongoose')
router = express.Router()

Person = mongoose.model('Person')

router.route('/me').get (req, res) ->
  token = req.headers.authentication
  Person.find { token: token }, (err, person) ->
    if err || (person.length == 0)
      res.status 404
      res.json
        success: false
    else
      res.json person

module.exports = router
