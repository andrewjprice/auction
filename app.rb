# Load in rack environment
@Env = ENV["RACK_ENV"] || "development"

# Require setup
require "./setup/libs" # Require libraries
require "./setup/configure" # Require config
require "./setup/db" # Require app setup

# Require app directory (Order matters!)
Dir['./app/models/**/*.rb'].each { |file| require file }
Dir['./app/routes/**/*.rb'].each { |file| require file }
