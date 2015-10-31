'use strict'

###*
 # @ngdoc function
 # @name angularAppApp.controller:NoGroupCtrl
 # @description
 # # NoGroupCtrl
 # Controller of the angularAppApp
###
angular.module 'angularAppApp'
  .controller 'NoGroupCtrl',[ '$scope','currentUser','$auth', ($scope, currentUser, $auth) -> 
    
    $scope.watchDemo = -> 
      console.log 'watchDemo'
      return 


    return
]