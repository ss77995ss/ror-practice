# Api-server

## Getting started
```sh
npm start
```

## Endpoints
### GET /api/turnover/:year/:month/:date
Get all turnovers at specific date, e.g.

```json
// 20181214192158
// http://localhost:8080/api/turnover/2018/12/14

[
  {
    "id": 8283,
    "name": "子涵 LLC",
    "opening_price": "84.22",
    "highest_price": "338.33",
    "floor_price": "902.26",
    "yesterday_closing_price": "619.11",
    "today_closing_price": "460.35",
    "volumes": 23097
  },
  { ... }
]
```
