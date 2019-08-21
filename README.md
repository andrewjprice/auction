# Setup
To start application run:
Note: If you want seeds, go to db/seeds.rb and uncomment/add before running `db:setup`

```
bundle install
bundle exec rake db:migrate
bundle exec rake db:setup
```

# Run

```
rackup config.ru
```

# Debug

```
bundle exec shotgun --server=thin --port=9292 config.ru
```

# Run Tests
```
bundle exec rspec spec/
```

# API Endpoints

POST /bids - create new bid
Required: "start_bid", "max_bid", "auto_increment"

```
curl -i -X POST -H "Content-Type: application/json" -d'{"name": "Andrew", "start_bid": 2501, "max_bid": 3200, "auto_increment": 247}' http://localhost:9292/bids
```

GET /calculate - calculates winning bid and lowest winning amount

```
curl http://localhost:9292/calculate
```