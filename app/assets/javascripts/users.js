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
  return $resource('/users/:id/news_feed',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

omgneedApp.factory('Products', ['$resource', function($resource) {
  return $resource('/products/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

omgneedApp.controller('UserCtrl', ['$scope', 'User', 'Products', function($scope, User, Products) {

  $scope.users = [];
  $scope.products = [];

User.query(function(users) {
      $scope.users = users;
   });

Products.query(function(products){
  $scope.products = products;

});



}]);
