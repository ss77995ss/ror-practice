app.factory('stockFactory', function() {
  return {
    symbolChange: function(turnovers) {
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
    },
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
