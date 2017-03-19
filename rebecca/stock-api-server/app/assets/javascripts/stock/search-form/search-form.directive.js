angular
  .module('stockApp')
  .directive('searchForm', function() {
    return {
      restrict: 'E',
      controller: 'StockController',
      controllerAs: 'vm',
      templateUrl: 'assets/stock/search-form/search-form.template.slim'
    };
  });
