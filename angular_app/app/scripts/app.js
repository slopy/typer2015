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
    'ngSanitize',
    'ngTouch',
    'ng-token-auth',
    'ui.router'
  ]);

typer.run(function ($rootScope, $state, currentUser) {

    $rootScope.$on('$stateChangeError', function(event, toState, toParams, fromState, fromParams, error) {
        console.log(error)
        if(error === 'already_logged'){
            event.preventDefault();
            $state.go('home'); 
            return
        } 
        if(error.reason === 'unauthorized'){
            event.preventDefault();
            $state.go('sign_in'); 
            return
        } 
        if (currentUser.checkIfAuthenticated() === null) {
            event.preventDefault();
            $state.go('sign_in');

        }
    });

});

typer.config(function ($stateProvider,$urlRouterProvider,$authProvider) {

 $urlRouterProvider.otherwise('home');

    $stateProvider
    .state('sign_in', {
        url: '/sign_in',
        templateUrl: 'views/user_sessions/new.html',
        controller: 'UserSessionsNewCtrl',
    })
    .state('home', {
        url: '/home',
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        resolve: {
            auth: function($auth) {
                return $auth.validateUser();
            }
        }
    });

    $authProvider.configure({
        emailSignInPath: '/auth/sign_in',
        tokenValidationPath: '/auth/validate_token',
        emailRegistrationPath: '/auth',
        signOutUrl: '/auth/sign_out',
        storage: 'localStorage',
        validateOnPageLoad: true,
    });
  
});


