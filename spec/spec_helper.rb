require 'rspec'
require_relative '../lib/environment'


RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
