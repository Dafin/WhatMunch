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
  append_munch_array
  redirect "/"
end

def append_munch_array
 params.each do |key, value|
    $munch << "<div>#{ key } #{ value }</div>"
  end

end


def template
  "
  <html>
  <title>WhatMunch App</title>
  <body>
  <form action='/' method='post'>
  What: <input name='what:' required>
  Cost: <input name='cost:' required type='number'>
  <button type='submit'>add munch</button>
  </form>
  #{ $munch.join('') }
  <br>
   #{ $munch.inspect }
  </body>
  </html>
  "
end