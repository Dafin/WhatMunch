require "sinatra"
require "sinatra/reloader"

$munch = []

get "/" do
  template
end

get "/places" do
 "This will list food vendors and their distance away"
end

post "/" do
 params.each do |key, value|
    $munch << "<div>#{ key } #{ value }</div>"
  end

  redirect "/"
end

def template
  "
  <html>
  <title>WhatMunch App</title>
  <body>
  <form action='/' method='post'>
  What: <input name='what'>
  Cost: <input name='cost'>
  <button type='submit'>add munch</button>
  </form>
  #{ $munch.join('') }
  </body>
  </html>
  "
end