require './app'

# require 'sass/plugin/rack'
# Sass::Plugin.options[:style] = :compressed
# use Sass::Plugin::Rack

configure do
  set :sass, {:style => :compressed}
end


run Sinatra::Application