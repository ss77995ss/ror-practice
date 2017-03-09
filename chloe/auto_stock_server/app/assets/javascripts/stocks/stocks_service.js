app.service('stockService', function() {
  this.getStocks = function($http) {
    return $http.get('/turnovers.json');
  };

  this.searchStock = function($http, number, date) {
    return $http.get('/turnovers.json?number=' + number + '&date=' + date);
  };
});
