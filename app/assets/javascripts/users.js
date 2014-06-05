var omgneedApp = angular.module('omgneed-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

omgneedApp.factory('User', ['$resource', function($resource) {
  return $resource('/users/:id/',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

omgneedApp.controller('UserCtrl', ['$scope', 'User', function($scope, User) {

  $scope.users= [];

User.query(function(users) {
      $scope.users = users;
   });



}])
