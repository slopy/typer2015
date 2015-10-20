'use strict'

describe 'Controller: UserSessionsNewCtrl', ->

  # load the controller's module
  beforeEach module 'angularAppApp'

  UserSessionsNewCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    UserSessionsNewCtrl = $controller 'UserSessionsNewCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
