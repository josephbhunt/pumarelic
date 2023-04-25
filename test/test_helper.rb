require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'
require 'mocha/minitest'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/pumarelic'
