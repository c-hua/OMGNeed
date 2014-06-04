var yogurtApp = angular.module('yogurt-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

yogurtApp.factory('Yogurt', ['$resource', function($resource) {
  return $resource('/yogurts/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

yogurtApp.controller('YogurtCtrl', ['$scope', 'Yogurt', function($scope, Yogurt) {
    $scope.yogurts= [];

    $scope.newYogurt = new Yogurt();

    Yogurt.query(function(yogurts) {
      $scope.yogurts = yogurts;
    });

    $scope.saveYogurt = function() {
      $scope.newYogurt.$save(function(yogurt) {
        $scope.yogurts.push(yogurt);
        $scope.newYogurt = new Yogurt();
      });
    }

    $scope.deleteYogurt = function(index,yogurt) {
      yogurt.$delete(function() {
        $scope.yogurts.splice(index, :1);

      }
      )

    $scope.showYogurt = function(yogurt) {
      yogurt.details = true;
    }

    }
}])