app = angular.module('chokak')

class LocalStorageService
  constructor: ->
    @ls = window.localStorage

  write: (key, value) ->
    @ls.setItem key, value

  read: (key) ->
    @ls.getItem key

LocalStorageService.$inject = [ ]
app.service 'LocalStorageService', LocalStorageService
