app.service('stockService', function() {
  this.getStocks = function($http) {
    return $http.get('/turnovers.json')
      .then(function(res) {
        return res.data;
      }).catch( function(err) {
        console.log(err);
      });
  };

  this.searchStock = function($http, number, date) {
    return $http.get('/turnovers.json?number=' + number + '&date=' + date)
      .then(function(res) {
        return res.data;
      }).catch( function(err) {
        console.log(err);
      });;
  };
});
