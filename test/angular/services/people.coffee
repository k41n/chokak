describe 'PeopleService', ->
  beforeEach module('chokak')
  PeopleService = undefined
  $httpBackend  = undefined

  people = [
    id:   1
    name: 'Vasily Alibabaev'
  ]

  beforeEach inject (_PeopleService_, _$httpBackend_) ->
    $httpBackend  = _$httpBackend_
    $httpBackend.expectGET('/api/people').respond 200, people
    PeopleService = _PeopleService_

  describe 'Constructor', ->
    it 'exists', ->
      expect(PeopleService).toBeDefined()

  describe 'index', ->
    it 'can query all people', ->
      $httpBackend.flush()
      expect(PeopleService.people).toBeDefined()
      expect(PeopleService.people[0].name).toEqual('Vasily Alibabaev')
