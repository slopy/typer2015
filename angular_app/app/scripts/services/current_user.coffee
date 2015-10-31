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

  .factory 'currentUser', ['$auth','$cookies', ($auth, $cookies) ->
    userData = {}
    authenticated = null
    
    init = -> 
      if $cookies.get("auth_headers")
        userInfo = JSON.parse($cookies.get("auth_headers"));
        $auth.validateUser()
          .then (response) ->
            if response.signedIn
              userData = response
              authenticated = true
          .catch (response) -> 
    init()

    checkIfAuthenticated: ->
      authenticated

    logout: ->
      $auth.signOut
      userData = {}
      authenticated = null
      $cookies.remove("auth_headers")

    set: (user) ->       
      if user.signedIn is true and $auth.validateUser()
        authenticated = true
        userData = user
      else
        authenticated = null
        userData = {}

    get: ->
      userData

    data: userData
]