const express = require('express')
const app = express()

const { getTurnoverList } = require('./fake')

/**
 * @example http://localhost:8080/api/turnover/2018/12/14 - get all turnovers at 12/14 Dec.
*/
app.get('/api/turnover/:year/:month/:date', function(req, res, next) {
  const config = {
    year: parseInt(req.params.year, 10),
    month: parseInt(req.params.month, 10),
    date: parseInt(req.params.date, 10),
  }

  const fakeData = getTurnoverList(config)

  res.status(200).send(JSON.stringify(fakeData))
})

app.listen(8080, () => {
  console.log('🔥 Fake API server is running on port 8080')
})
