var app = angular.module('turnoversApp', []);

app.service('stockService', function() {
  this.getStocks = function($http) {
    return $http.get('/turnovers.json');
  };

  this.searchStock = function($http, number, date) {
    return $http.get('/turnovers.json?number=' + number + '&date=' + date);
  };
});

app.controller('TurnoverCtrl', ['$scope', '$http', 'stockService', function($scope, $http, stockService) {
  $scope.turnovers = [];
  // initialize number and date search input value
  $scope.number = null;
  $scope.date = new Date();

  let promise = stockService.getStocks($http);
  promise.then( function(response) {
    $scope.turnovers = stockChangeSymbol(response.data);
  });

  // search click
  $scope.search = function() {
    if($scope.date !== null) {
      promise = stockService.searchStock($http, $scope.number, $scope.date.toISOString().slice(0, 10));
    } else {
      promise = stockService.searchStock($http, $scope.number, $scope.date);
    }

    promise.then( function(response) {
      $scope.turnovers = stockChangeSymbol(response.data);
    });
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
