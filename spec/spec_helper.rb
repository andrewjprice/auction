ENV['RACK_ENV'] = 'test'
require './app'
require 'rack/test'
require 'rspec'
require 'database_cleaner'

module RSpecMixin
  include Rack::Test::Methods
  def app
    Bids
  end
end

RSpec.configure do |c| 
  c.include RSpecMixin 

  c.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  c.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
