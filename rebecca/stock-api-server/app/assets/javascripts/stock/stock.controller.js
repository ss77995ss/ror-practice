/* eslint no-param-reassign: 0*/

angular
  .module('stockApp')
  .controller('StockController', function($window, SEARCH_URL) {
    var vm = this;

    vm.sortType = 'rank';
    vm.sortReverse = false;
    vm.date = '';
    vm.code = '';

    vm.submitForm = function() {
      $window.location.href = SEARCH_URL + '?date=' + vm.date + '&code=' + vm.code;
    };
  });
