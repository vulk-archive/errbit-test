require 'airbrake'
require 'dotenv'
Dotenv.load


Airbrake.configure do |config|
  config.api_key  = ENV['AIRBRAKE_API_KEY']
  config.host     = ENV['ERRBIT_HOST']
  config.port     = ENV['ERRBIT_PORT']
  config.environment_name = ENV['ERRBIT_ENVIRONMENT_NAME'] || `hostname`
  config.user_attributes = %w[id email]
end


args = {error: "we have an error", origin: "somewhere special"}
Airbrake.notify(NoMethodError, :parameters => args, :cgi_data => ENV.to_hash)
