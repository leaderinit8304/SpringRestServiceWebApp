/*jslint devel: true */
/*global angular */

angular.module('module1', [])
    .config(['$locationProvider', function ($locationProvider) {
        'use strict';
        $locationProvider.html5Mode({enabled: true, requireBase: false });
    }])

    .controller('mainController', function ($scope) {
    
        $scope.newProducts = newProducts;
        $scope.allProducts = allProducts;
    })

    .controller('productController', ['$scope', '$location', function ($scope, $location) {
        'use strict';
        $scope.param1 = $location.search().param1;
        
        angular.forEach(allProducts, function (item) {
            if ($scope.param1 === item.nmb) {
                $scope.selectedProductName = item.name;
                $scope.selectedProductPrice = item.price;
            }
        });
    }]);


