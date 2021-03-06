app = angular.module 'chokak'

app.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    templateUrl: 'home/index.html'
    controller: 'DashboardController as dash'

  .state 'new_person',
    url: '/people/new'
    templateUrl: 'people/new.html'
    controller: 'NewPersonController as c'

  $urlRouterProvider.otherwise('/')
]