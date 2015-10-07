var app;

app = angular.module('chokak', []);

app.controller('DashboardController', [
  '$scope', '$http', function($scope, $http) {
    $scope.test = 'Hello world!12';
    $scope.socket = window.io.connect('http://localhost:8080');
    $scope.socket.on('connect', function() {
      return $scope.socket.on('message', function(msg) {
        console.log("Incoming message", msg);
        return $scope.$apply(function() {
          return $scope.messages.push({
            author: msg.name,
            content: msg.text
          });
        });
      });
    });
    $http.get('/messages').then(function(response) {
      return $scope.messages = response.data;
    });
    return $scope.newMessage = function() {
      return $scope.socket.send($scope.content);
    };
  }
]);
