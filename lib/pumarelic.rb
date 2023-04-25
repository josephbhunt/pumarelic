require 'newrelic_rpm'

Dir["#{File.dirname(__FILE__)}/pumarelic/**/*.rb"].each { |f| require f }