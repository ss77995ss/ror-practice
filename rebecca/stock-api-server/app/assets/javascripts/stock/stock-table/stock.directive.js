/* eslint no-param-reassign: 0 */

angular
  .module('stockApp')
  .directive('stockTable', function() {
    return {
      restrict: 'E',
      controller: 'StockController',
      controllerAs: 'vm',
      scope: {
        stocks: '=',
        sortType: '=sortType',
        sortReverse: '=sortReverse'
      },
      templateUrl: 'assets/stock/stock-table/stock.template.slim',
      link: function(scope) {
        scope.vm.stocks = scope.stocks;
      }
    };
  });
