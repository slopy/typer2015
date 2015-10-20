'use strict'

describe 'Controller: UserProfileCtrl', ->

  # load the controller's module
  beforeEach module 'angularAppApp'

  UserProfileCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    UserProfileCtrl = $controller 'UserProfileCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
