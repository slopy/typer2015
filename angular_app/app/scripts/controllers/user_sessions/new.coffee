'use strict'

###*
 # @ngdoc function
 # @name angularAppApp.controller:UserSessionsNewCtrl
 # @description
 # # UserSessionsNewCtrl
 # Controller of the angularAppApp
###

angular.module 'angularAppApp' 
  .controller 'UserSessionsNewCtrl', ['$scope','$auth', 'currentUser','$state','$anchorScroll', '$location'
   ($scope, $auth, currentUser, $state, $anchorScroll, $location) ->

    $scope.sign_up_show = false
    $scope.register_error_show = false
    $scope.new_session_page = true
    if currentUser 
      $state.go 'home'

    $scope.signUpShowClick = ->
      $scope.sign_up_show = true

    $scope.afterSignUpShowClick = ->
      $location.hash('sign-up-panel')
      $anchorScroll()

    $scope.logout = -> 

    $scope.loginBtn = (login)-> 

      $auth.submitLogin login 
        .then (response) ->
          if response.signedIn
            currentUser.set response
            $state.go('home')
            $scope.loginForm.password = ""

        .catch (response) ->
          $scope.login_error_show = true
          $scope.loginForm.password = ""
          $scope.login_errors = response.errors
      return

    $scope.submitRegistration = (register) ->
      $auth.submitRegistration register
        .then (response) ->
          currentUser.set response.data
          $state.go 'home'
          $scope.registrationForm.password  = ""
          $scope.registrationForm.password_confirmation  = ""

        .catch (response) ->
          $scope.register_error_show = true
          $scope.registrationForm.password  = ""
          $scope.registrationForm.password_confirmation  = ""
          $scope.register_errors = response.data.errors.full_messages

    return
]
