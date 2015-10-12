describe 'PeopleService', ->
  beforeEach module('chokak')
  PeopleService = undefined
  beforeEach inject (_PeopleService_) ->
    PeopleService = _PeopleService_

  describe 'Constructor', ->
    it 'exists', ->
      expect(PeopleService).toBeDefined()
