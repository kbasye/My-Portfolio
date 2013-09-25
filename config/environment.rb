# Load the rails application
require File.expand_path('../application', __FILE__)

api_keys = File.join(Rails.root, 'config', 'api_keys.rb')
load(api_keys) if File.exists?(api_keys)

# Initialize the rails application
Mine::Application.initialize!
