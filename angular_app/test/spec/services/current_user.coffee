'use strict'

describe 'Service: currentUser', ->

  # load the service's module
  beforeEach module 'angularAppApp'

  # instantiate service
  currentUser = {}
  beforeEach inject (_currentUser_) ->
    currentUser = _currentUser_

  it 'should do something', ->
    expect(!!currentUser).toBe true
