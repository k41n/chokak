app = angular.module('chokak')

class NewPersonController
  constructor: ->
    @person = {}

NewPersonController.$inject = [ ]
app.controller 'NewPersonController', NewPersonController

