require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'

set :environment, :test


# Explicitly enable both 'should 'and 'expect' syntaxes, should is deprecated?
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = [:should, :expect]
  end
end


# No DB, so not required for now
# Rspec.configure do |config|
#   config.before(:each) { DataMapper.auto_migrate! }
# end