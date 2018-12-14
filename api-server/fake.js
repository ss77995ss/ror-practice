const faker = require('faker/locale/zh_TW')

const DEFAULT_ROWS = 200

const randomTurnoverList = (count) => (
  Array.from({ length: count }).map(() => ({
    id: faker.random.number() % 10000, // at least 4 digits
    name: faker.company.companyName(),
    opening_price: faker.finance.amount(),
    highest_price: faker.finance.amount(),
    floor_price: faker.finance.amount(),
    yesterday_closing_price: faker.finance.amount(),
    today_closing_price: faker.finance.amount(),
    volumes: faker.random.number()
  }))
)

/**
 * @param {Number} config.year
 * @param {Number} config.month
 * @param {Number} config.date
 * @returns {Array} - todays turnover
 */
const getTurnoverList = (config = {}) => {
  const { year, month, date } = config

  const target = new Date(year, month - 1, date).getTime()

  // Validation for date
  if (isNaN(target)) return []

  // It cannot get the fake data for the future
  if (target > Date.now()) return []

  // Make result consistent
  const seed = parseInt(`${year}${month}${date}`, 10)
  faker.seed(seed);

  return randomTurnoverList(DEFAULT_ROWS)
}

module.exports = {
  getTurnoverList
}
