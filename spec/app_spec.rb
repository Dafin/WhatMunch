require File.dirname(__FILE__) + '/spec_helper'

describe 'WhatMunch' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should load the webpage' do
    get '/'
    last_response.status.should == 200
  end
end