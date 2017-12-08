require "sinatra"
require "sinatra/reloader"

$munch = []

get "/" do
  template
end


post "/" do
  $munch << params
  redirect "/"

end

get "/places" do
 "This will list food vendors and their distance away"
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
  #{ $munch.inspect }
  </body>
  </html>
  "

end