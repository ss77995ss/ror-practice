app.controller('TurnoverCtrl', ['$scope', '$http', 'sortFactory', 'stockService', function($scope, $http, sortFactory, stockService) {
  $scope.turnovers = [];
  // initialize number and date search input value
  $scope.number = null;
  $scope.date = new Date();
  $scope.desc = true;
  $scope.asc = false;

  let promise = stockService.getStocks($http);
  promise.then( function(response) {
    $scope.turnovers = stockChangeSymbol(response.data);
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
      $scope.turnovers = stockChangeSymbol(response.data);
    });
  }

  // desc sort click
  $scope.sortDesc = function(column) {
    $scope.desc = false;
    $scope.asc = true;
    $scope.turnovers = sortFactory.desc(column, $scope.turnovers);
  }

  // asc sort click
  $scope.sortAsc = function(column) {
    $scope.desc = true;
    $scope.asc = false;
    $scope.turnovers = sortFactory.asc(column, $scope.turnovers);
  }
}]);

function stockChangeSymbol(turnovers) {
  for (let i = 0; i < turnovers.length; i += 1) {
    turnovers[i].changeNum = Math.abs(turnovers[i].change);
    if(turnovers[i].change < 0) {
      turnovers[i].symbol = '▼ ';
      turnovers[i].colorClass = 'down'
    } else if(turnovers[i].change === 0) {
      turnovers[i].symbol = '- ';
      turnovers[i].colorClass = ''
    } else {
      turnovers[i].symbol = '▲ ';
      turnovers[i].colorClass = 'up'
    }
  }

  return turnovers;
}
