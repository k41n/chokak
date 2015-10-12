var PeopleService, app;

app = angular.module('chokak');

PeopleService = (function() {
  function PeopleService(PeopleResource) {
    this.PeopleResource = PeopleResource;
    this.loading = this.PeopleResource.query((function(_this) {
      return function(data) {
        return _this.people = data;
      };
    })(this));
  }

  return PeopleService;

})();

PeopleService.$inject = ['PeopleResource'];

app.service('PeopleService', PeopleService);
