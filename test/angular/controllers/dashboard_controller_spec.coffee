describe 'DashboardController', ->
  beforeEach module('chokak')
  DashboardController = undefined
  $httpBackend  = undefined

  people = [
    id:   1
    name: 'Vasily Alibabaev'
  ]

  beforeEach ->
    inject ($controller) =>
      @controller = $controller 'DashboardController'

    inject ($httpBackend) =>
      @httpBackend = $httpBackend

  describe 'Constructor', ->
    it 'exists', ->
      expect(@controller).toBeDefined()

    it 'assigns PeopleService', ->
      expect(@controller.PeopleService).toBeDefined()

    it 'loads existing people', ->
      @httpBackend.expectGET('/api/people').respond 200, people
      @httpBackend.flush()
      expect(@controller.PeopleService.people).toBeDefined()
      expect(@controller.PeopleService.people[0].name).toEqual('Vasily Alibabaev')
