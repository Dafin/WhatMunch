require "sinatra"



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
 params[:thismunch].each do |key, value|
    $munch << "<div>#{ key } #{ value }</div>"

  
  end

end


def template
  "
  <html>
  <title>WhatMunch App</title>
  <body>
  <form action='/' method='post'>
  What: <input name='thismunch[what:]' required>
  Cost: <input name='thismunch[cost:]' type='number' step=0.01 min= required>
  <button type='submit'>add munch</button>
  </form> 

  #{ $munch.join('') }

  <br>
  </body>
  </html>
  "
end