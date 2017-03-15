angular
  .module('stockApp')
  .controller('StockController', function($route, $location) {
    var vm = this;

    vm.sortType = 'rank';
    vm.sortReverse = false;
    vm.date = '';
    vm.code = '';

    vm.submitForm = function() {
      $location.path('/search').search({ date: vm.date, code: vm.code });
    };
  })
  .controller('DataController', function(stocks) {
    var vm = this;
    vm.sortType = 'rank';
    vm.sortReverse = false;

    vm.stocks = (angular.isObject(stocks)) ? stocks : [];
  })
  .controller('TableController', function($location) {
    var vm = this;
    vm.$location = $location;
    vm.isEmpty = function(value) {
      return angular.equals({}, value);
    };
  });
