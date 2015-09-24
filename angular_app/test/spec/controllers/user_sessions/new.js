'use strict';

describe('Controller: UserSessionsNewCtrl', function () {

  // load the controller's module
  beforeEach(module('angularAppApp'));

  var UserSessionsNewCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    UserSessionsNewCtrl = $controller('UserSessionsNewCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
