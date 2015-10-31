'use strict'

###*
 # @ngdoc function
 # @name angularAppApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the angularAppApp
###
 
angular.module 'angularAppApp'
  .controller 'MainCtrl',[ '$scope','$http','$auth','currentUser','$state',
    ($scope, $http, $auth, currentUser, $state) ->

      user = currentUser.get()

      # go to no-group if user has no group
      # if user.groups.lenght > 0
      if true
        $state.go('no-group')

]
