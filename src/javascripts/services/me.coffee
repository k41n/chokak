app = angular.module('chokak')

class MeService
  constructor: (@MeResource)->
    @loading = @MeResource.get (data) =>
      @currentUser = data

MeService.$inject = [ 'MeResource' ]
app.service 'MeService', MeService
