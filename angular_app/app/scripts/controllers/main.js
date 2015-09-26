'use strict';

/**
 * @ngdoc function
 * @name angularAppApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the angularAppApp
 */
angular.module('angularAppApp')
  .controller('MainCtrl', function ($scope, $http) {


    $scope.getGroups = function(){
        $http.get('/api/v1/groups').success(function(response){
            console.log(response)
            $scope.groups = response
        })
    }
  });
