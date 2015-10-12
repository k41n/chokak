var PeopleService, app;

app = angular.module('chokak');

PeopleService = (function() {
  function PeopleService() {}

  return PeopleService;

})();

PeopleService.$inject = [];

app.service('PeopleService', PeopleService);
