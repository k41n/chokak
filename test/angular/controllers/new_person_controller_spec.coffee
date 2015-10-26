describe 'NewPersonController', ->
  beforeEach module('chokak')

  beforeEach ->
    inject ($controller) =>
      @controller = $controller 'NewPersonController'

    inject ($httpBackend) =>
      @httpBackend = $httpBackend

  describe 'Constructor', ->
    it 'exists', ->
      expect(@controller).toBeDefined()

    it 'initializes empty person', ->
      expect(@controller.person).toEqual({})
