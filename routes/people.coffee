express = require('express')
mongoose = require('mongoose')
router = express.Router()

Person = mongoose.model('Person')

router.route('/people').post (req, res) ->
  person = new Person()
  person.name = req.body.name
  person.save (err) ->
    if err
      return next(err)
    res.json person

router.route('/people/:person_id').delete (req, res) ->
  Person.remove
    _id: req.params.person_id
  , (err, person) ->
    if err
      res.send err
    res.json
      message: 'Successfully deleted'

router.route('/people/:person_id').put (req, res) ->
  Person.findById req.params.person_id, (err, person) ->
    if err
      res.send err
    person.name = req.body.name
    person.save (err) ->
      if err
        res.send err
      res.json person

router.route('/people').get (req, res) ->
  Person.find (err, persons) ->
    if (err)
      return next(err)
    res.json persons

router.route('/people/:person_id').get (req, res) ->
  Person.findById req.params.person_id, (err, person) ->
    if (err)
      return next(err)
    res.json person

module.exports = router
