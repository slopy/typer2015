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

    $scope.signOutBtn = ->
      currentUser.logout()
      $state.go('sign_in')
      
    $scope.userLogged = ->
      currentUser.checkIfAuthenticated()

    return
]