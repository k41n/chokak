describe 'MeService', ->
  beforeEach module('chokak')
  MeService = undefined
  LocalStorageService = undefined
  $httpBackend  = undefined

  person =
    id:   1
    name: 'Vasily Alibabaev'
    token: '1234'

  beforeEach inject (_LocalStorageService_) ->
    LocalStorageService = _LocalStorageService_
    spyOn(LocalStorageService, 'read').and.returnValue('1234')

  beforeEach inject (_MeService_, _$httpBackend_) ->
    $httpBackend  = _$httpBackend_
    $httpBackend.expectGET('/api/me', {'Authentication': '1234'}).respond 200, person
    MeService = _MeService_

  describe 'Constructor', ->
    it 'exists', ->
      expect(MeService).toBeDefined()

  describe 'injection', ->
    it 'queries user status', ->
      $httpBackend.flush()
      expect(MeService.currentUser).toBeDefined()
      expect(MeService.currentUser.name).toEqual('Vasily Alibabaev')
