'use strict'

###*
 # @ngdoc service
 # @name angularAppApp.currentUser
 # @description
 # # currentUser
 # currentUser model
 # Factory in the angularAppApp.
###
angular.module 'angularAppApp'
  .factory 'currentUser', ['$auth','$window', ($auth, $window) ->
    currentUser = {}
    authenticated = null
    
    init = -> 
      if $window.localStorage["auth_headers"]
        userInfo = JSON.parse($window.localStorage["auth_headers"]);
        $auth.validateUser().then (response) ->
          if response.signedIn
            currentUser = response
            authenticated = true            
    init()

    checkIfAuthenticated: ->
      authenticated

    logout: ->
      $auth.signOut
      currentUser = {}
      authenticated = null
      $window.localStorage.clear()

    set: (user) -> 
      if user.signedIn is true and $auth.validateUser()
        authenticated = true
        currentUser = user
      else
        authenticated = null
        currentUser = {}

    get: ->
      currentUser

]