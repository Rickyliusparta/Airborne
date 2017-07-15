require 'airborne'
require 'rspec'
require 'json'
require_relative '../airborne'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end

Airborne.configure do |config|
  config.base_url = "https://api.postcodes.io/postcodes"  
end