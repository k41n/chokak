describe 'LocalStorageService', ->
  beforeEach module('chokak')
  LocalStorageService = undefined

  beforeEach inject (_LocalStorageService_) ->
    LocalStorageService = _LocalStorageService_

  describe 'Constructor', ->
    it 'exists', ->
      expect(LocalStorageService).toBeDefined()

  describe 'storage', ->
    it 'can store data and read it back', ->
      LocalStorageService.write 'foo', 'bar'
      expect(LocalStorageService.read('foo')).toEqual('bar')
