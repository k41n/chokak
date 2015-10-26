var NewPersonController, app;

app = angular.module('chokak');

NewPersonController = (function() {
  function NewPersonController() {
    this.person = {};
  }

  return NewPersonController;

})();

NewPersonController.$inject = [];

app.controller('NewPersonController', NewPersonController);
