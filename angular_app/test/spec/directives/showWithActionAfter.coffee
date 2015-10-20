'use strict'

describe 'Directive: afterAnimateAction', ->

  # load the directive's module
  beforeEach module 'angularAppApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<after-animate-action></after-animate-action>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the afterAnimateAction directive'
