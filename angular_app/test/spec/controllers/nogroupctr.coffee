'use strict'

describe 'Controller: NogroupctrCtrl', ->

  # load the controller's module
  beforeEach module 'angularAppApp'

  NogroupctrCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NogroupctrCtrl = $controller 'NogroupctrCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(NogroupctrCtrl.awesomeThings.length).toBe 3
