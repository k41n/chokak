app = angular.module 'chokak'

app.factory 'PeopleResource', [ '$resource', ($resource) ->
  $resource "/api/people/:id",
    id: "@id"
  ,
    update: { method: "PUT" }
]