'use strict'

###*
 # @ngdoc function
 # @name angularAppApp.controller:NavbarctrlCtrl
 # @description
 # # NavbarctrlCtrl
 # Controller of the angularAppApp
###
angular.module 'angularAppApp'
  .controller 'NavbarCtrl', ['$scope','currentUser','$state', ($scope, currentUser,$state) ->
    user = currentUser

    $scope.signOutBtn = ->
      user.logout()
      $state.go('sign_in')
      
    $scope.userLogged = ->
      # console.log user.data
      user.checkIfAuthenticated()

    return
]