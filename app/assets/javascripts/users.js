


 // $(function(){ $(document).foundation(); });

 // $(function() {
 //    $( ".off-canvas-list" ).sortable();
 //    $( ".off-canvas-list" ).disableSelection();
 //  });

var productApp = angular.module('product-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

productApp.factory('Product', ['$resource', function($resource) {
  return $resource('/products/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

productApp.controller('ProductCtrl', ['$scope', 'Yogurt', function($scope, Product) {
    $scope.products= [];

    $scope.newProduct = new Product();

    Product.query(function(products) {
      $scope.products = products;
   });

    $scope.saveProduct = function () {
      $scope.newProduct.$save(function(product) {
        $scope.products.push(product)
        $scope.newProduct = new Product();
      });
    }

    $scope.deleteProduct = function (product) {
      product.$delete(function() {
        position = $scope.products.indexOf(product);
        $scope.products.splice(position, 1);
      }, function(errors) {
        $scope.errors = errors.data
      });
    }

    $scope.showProduct = function(product) {
      product.details = true;
      product.editing = false;
    }

    $scope.hideProduct = function(product) {
      product.details = false;
    }

    $scope.editProduct = function(product) {
      product.editing = true;
      product.details = false;
    }

    $scope.updateProduct = function(product) {
      product.$update(function() {
        product.editing = false;
      }, function(errors) {
        $scope.errors = errors.data
      });
    }

    $scope.clearErrors = function() {
      $scope.errors = null;
    }
}])