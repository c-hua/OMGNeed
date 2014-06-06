var omgneedApp = angular.module('omgneed-app', ['ngResource',  'mgcrea.ngStrap', 'ngAnimate']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

omgneedApp.factory('User', ['$resource', function($resource) {
  return $resource('/users/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

omgneedApp.factory('Products', ['$resource', function($resource) {
  return $resource('/products/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

omgneedApp.factory('List', ['$resource', function($resource) {
  return $resource('/lists/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

omgneedApp.controller('ListsCtrl', ['$scope', 'User', 'Products', 'List', function($scope, User, Products, List) {

  $scope.users = [];
  $scope.products = [];
  $scope.lists = [];

  $scope.newList = new List();

User.get(function(users) {
      $scope.users = users;
   });

List.query(function(lists) {
      $scope.lists = lists;
   });

Products.query(function(products){
  $scope.products = products;

});

$scope.saveList = function() {
      $scope.newList.$save(function(list) {
        console.log(list);
        $scope.lists.push(list);
        $scope.newList = new List();
      });
    };


$scope.showList = function(list) {
      list.details = true;
      list.editing = false;
    };

$scope.hideList = function(list) {
      list.details = false;
    };

$scope.editList = function(list) {
      list.editing = true;
      list.details = false;
    };

$scope.updateList = function(list) {
      list.$update(function() {
        list.editing = false;
      }, function(errors) {
        $scope.errors = errors.data;
      });
    };


$scope.saveProducts = function () {
      $scope.newProduct.$save(function(products) {
        $scope.products.push(products);
        $scope.newProducts = new Products();
      });
    };

$scope.deleteProducts= function (products) {
      products.$delete(function() {
        position = $scope.list.indexOf(products);
        $scope.products.splice(position, 1);
      }, function(errors) {
        $scope.errors = errors.data;
      });
    };

    $scope.showProducts = function(products) {
      products.details = true;
      products.editing = false;
    };

    $scope.hideProducts = function(products) {
      products.details = false;
    };

    $scope.editProducts = function(products) {
      products.editing = true;
      products.details = false;
    };

    $scope.updateProducts = function(products) {
      products.$update(function() {
        products.editing = false;
      }, function(errors) {
        $scope.errors = errors.data;
      });
    };

    $scope.clearErrors = function() {
      $scope.errors = null;
    };

}]);
