'use strict';

/**
 * @ngdoc overview
 * @name angularAppApp
 * @description
 * # angularAppApp
 *
 * Main module of the application.
 */

var typer = angular
  .module('angularAppApp', [
    'ngAnimate',
    'ngCookies',
    'ngMessages',
    'ngResource',
    // 'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ng-token-auth',
    'ui.router'
  ])

typer.run(['$state', '$stateParams',
    function($state, $stateParams) {
  }])
  
typer.config(function ($stateProvider,$urlRouterProvider,$authProvider) {
    // $routeProvider

    $urlRouterProvider.otherwise("/");
        


    $stateProvider
    .state('/', {
        url: "/",
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
    })
    .state('/sign_in', {
        url: '/sing_in',
        templateUrl: 'views/user_sessions/new.html',
        controller: 'UserSessionsNewCtrl'
    });

    $authProvider.configure({
      apiUrl: "0.0.0.0:3000",

    })    
  
  });
