require "sinatra"
require "sinatra/reloader"

$munch = []

get "/" do
  munch_markup
  template
end

get "/places" do
 "This will list food vendors and their distance away"
end

post "/" do
  $munch << params
  redirect "/"
end


def munch_markup
  munch = []
  $munch.each do |munch|
    munch << "<div>#{ munch[:what] } $#{ munch[:cost] }</div>"
  end
  munch.join("<br>")
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
  #{ $munch_markup }
  </body>
  </html>
  "
end