require "sinatra"
require "sinatra/reloader"

$munch = []

get "/" do
  $munch << params
  template

end


get "/places" do
 "This will list food vendors and their distance away"
end

def template
  "
  <html>
  <title>WhatMunch</title>
  <body>
  <form action='/' method='get'>
  What: <input name='what'>
  Cost: <input name='cost'>
  <button type='submit'>add munch</button>
  </form>
  #{ $munch.inspect }
  </body>
  </html>
  "

end