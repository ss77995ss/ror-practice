app.controller('TurnoverCtrl', ['$scope', '$http', 'stockFactory', 'stockService', function($scope, $http, stockFactory, stockService) {
  $scope.turnovers = [];
  // initialize number and date search input value
  $scope.number = null;
  $scope.date = new Date();
  $scope.desc = true;
  $scope.asc = false;

  let promise = stockService.getStocks($http);
  promise.then( function(response) {
    $scope.turnovers = stockFactory.symbolChange(response.data);
  });

  // search click
  $scope.search = function() {
    if($scope.date === null && $scope.number === null) {
      $scope.date = new Date();
    }

    if($scope.date !== null) {
      promise = stockService.searchStock($http, $scope.number, $scope.date.toISOString().slice(0, 10));
    } else {
      promise = stockService.searchStock($http, $scope.number, $scope.date);
    }

    promise.then( function(response) {
      $scope.turnovers = stockFactory.symbolChange(response.data);
    });
  }

  // export click
  $scope.export = function() {
    stockFactory.exportStocks($scope.turnovers)
  }

  // desc sort click
  $scope.sortDesc = function(column) {
    $scope.desc = false;
    $scope.asc = true;
    $scope.turnovers = stockFactory.desc(column, $scope.turnovers);
  }

  // asc sort click
  $scope.sortAsc = function(column) {
    $scope.desc = true;
    $scope.asc = false;
    $scope.turnovers = stockFactory.asc(column, $scope.turnovers);
  }
}]);
