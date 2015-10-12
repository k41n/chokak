app = angular.module 'chokak', [
  'ngResource'
]

app.controller 'DashboardController', [ '$scope', '$http', ($scope, $http) ->
  $scope.test = 'Hello world!12'

  $scope.socket = window.io.connect('http://localhost:8080')

  $scope.socket.on 'connect', ->
    $scope.socket.on 'message', (msg) ->
      console.log "Incoming message", msg
      $scope.$apply ->
        $scope.messages.push
          author: msg.name
          content: msg.text

  $http.get '/messages'
  .then (response) ->
    $scope.messages = response.data

  $scope.newMessage = ->
    $scope.socket.send $scope.content
]