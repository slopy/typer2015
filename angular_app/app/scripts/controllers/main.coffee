'use strict'

###*
 # @ngdoc function
 # @name angularAppApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the angularAppApp
###
 
angular.module 'angularAppApp'
  .controller 'MainCtrl',[ '$auth' ,($scope, $http, $auth) ->

    $scope.getGroups = ->
      $http.get '/api/v1/groups'
        .success (response) -> 
            console.log(response);
            $scope.groups = response

    return
]
