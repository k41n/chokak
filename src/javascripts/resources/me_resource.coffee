app = angular.module 'chokak'

app.factory 'MeResource', [ '$resource', ($resource) ->
  $resource "/api/me"
]
