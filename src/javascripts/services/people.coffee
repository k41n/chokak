app = angular.module('chokak')

class PeopleService
  constructor: (@PeopleResource)->
    @loading = @PeopleResource.query (data) =>
      @people = data

PeopleService.$inject = [ 'PeopleResource' ]
app.service 'PeopleService', PeopleService

