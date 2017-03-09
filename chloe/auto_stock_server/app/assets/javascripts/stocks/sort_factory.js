app.factory('sortFactory', function() {
  return {
    desc: function(sortItem, dataList) {
      dataList = dataList.sort(function (a, b) {
        return b[sortItem] > a[sortItem] ? 1 : -1;
      });
      return dataList;
    },
    asc: function(sortItem, dataList) {
      dataList = dataList.sort(function (a, b) {
        return a[sortItem] > b[sortItem] ? 1 : -1;
      });
      return dataList;
    }
  }
});
