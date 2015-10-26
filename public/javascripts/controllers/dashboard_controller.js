var app;

app = angular.module('chokak');

window.DashboardController = (function() {
  function DashboardController(PeopleService) {
    this.PeopleService = PeopleService;
  }

  return DashboardController;

})();

DashboardController.$inject = ['PeopleService'];

app.controller('DashboardController', DashboardController);
