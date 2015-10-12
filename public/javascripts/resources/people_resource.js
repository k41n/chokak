var app;

app = angular.module('chokak');

app.factory('PeopleResource', [
  '$resource', function($resource) {
    return $resource("/api/people/:id", {
      id: "@id"
    }, {
      update: {
        method: "PUT"
      }
    });
  }
]);
