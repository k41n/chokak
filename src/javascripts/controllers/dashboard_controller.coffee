app = angular.module('chokak')

class window.DashboardController
  constructor: (@PeopleService) ->

DashboardController.$inject = [ 'PeopleService' ]
app.controller 'DashboardController', DashboardController

