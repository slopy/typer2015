'use strict'

describe 'Controller: NavbarctrlCtrl', ->

  # load the controller's module
  beforeEach module 'angularAppApp'

  NavbarctrlCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NavbarctrlCtrl = $controller 'NavbarctrlCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(NavbarctrlCtrl.awesomeThings.length).toBe 3
