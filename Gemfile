source 'https://rubygems.org'

# All Environments
gem 'sinatra'
gem 'sinatra-cross_origin'
gem 'sinatra-activerecord'
gem 'activerecord'
gem 'rake'
gem 'shotgun'
gem 'json'
gem 'thin'

# Development
group :development do
    gem 'sqlite3'
end

# Test
group :test do
    gem "rack-test", require: "rack/test"
    gem "rspec"
    gem 'database_cleaner'
end

# Production
group :production do
    gem 'pg'
end
