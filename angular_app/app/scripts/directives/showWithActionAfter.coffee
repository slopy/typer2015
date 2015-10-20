'use strict'

###*
 # @ngdoc directive
 # @name angularAppApp.directive:afterAnimateAction
 # @description
 # # afterAnimateAction
###
angular.module 'angularAppApp'
  .directive 'showWithActionAfter', ($animate) ->
    scope:
      'myShow': '=',
      'afterShow': '&',
      'afterHide': '&'
    link: (scope, element, attrs) ->
      scope.$watch 'myShow', (show, oldShow) ->
        if show
          $animate.removeClass(element, 'ng-hide').then(scope.afterShow);
        if !show
          $animate.addClass(element, 'ng-hide').then(scope.afterHide);
