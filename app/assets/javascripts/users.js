


 // $(function(){ $(document).foundation(); });

 // $(function() {
 //    $( ".off-canvas-list" ).sortable();
 //    $( ".off-canvas-list" ).disableSelection();
 //  });

Products = angular.module('product-app', ['ngResource', 'mm.foundation']).config(

    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

Products.factory('Product', ['$resource', function($resource) {
  return $resource('/products/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

Products.controller('ProductCtrl', ['$scope', 'Product', function($scope, Product) {
    $scope.products= [];

    $scope.newProduct = new Product();

    Product.query(function(products) {
      $scope.products = products;
   });

    $scope.button = {
  "toggle": false,
  "checkbox": {
    "left": false,
    "middle": true,
    "right": true
  },
  "radio": 0
};



  $scope.items = [
    "The first choice!",
    "And another choice for you.",
    "but wait! A third!"
  ];
  $scope.linkItems = {
    "Google": "http://google.com",
    "AltaVista": "http://altavista.com"
  };


$scope.alerts = [
    { type: 'danger', msg: 'Oh snap! Change a few things up and try submitting again.' },
    { type: 'success round', msg: 'Well done! You successfully read this important alert message.' }
];
    $scope.addAlert = function() {
    $scope.alerts.push({msg: "Another alert!"});
  };

  $scope.closeAlert = function(index) {
    $scope.alerts.splice(index, 1);
  };
    // $scope.leftAside = {
    //   "body": "hi"
    // };

    // $scope.selectedState = "";
    // $scope.states = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"];


    // $scope.popover = {
    //   "title": "Title",
    //   "content": "Hello Popover<br />This is a multiline message!"
    // };

    // $scope.modal = {
    //   "title": "Title",
    //   "content": "Hello Modal<br />This is a multiline message!"
    // };

  

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

