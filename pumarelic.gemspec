require './lib/version'

Gem::Specification.new do |s|
  s.name        = "pumarelic"
  s.version     = VERSION
  s.summary     = "Publish puma specific stats to New Relic"
  s.description = "This gem will publish puma specific stats to New Relic"
  s.authors     = ["Joe Hunt"]
  s.email       = "josephbhunt@gmail.com"
  s.files       = ["lib/pumarelic.rb"]
  s.homepage    = "https://github.com/josephbhunt/pumarelic"
  s.license       = "MIT"
end
