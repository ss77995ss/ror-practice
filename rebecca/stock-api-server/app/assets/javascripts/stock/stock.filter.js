angular
  .module('stockApp')
  .filter('iconFormat', function() {
    return function(num) {
      if (num.toString().charAt(0) === '-') {
        return '▼' + num.toString().replace(/-/, '');
      } else if (num === 0) {
        return num;
      }
      return '▲' + num.toString().replace(/\+/, '');
    };
  });
