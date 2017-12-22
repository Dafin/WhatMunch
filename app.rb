require "sinatra"


$munch = []
$running_total = 0

get "/" do
  template
end

get "/places" do
 "This will list food vendors and their distance away"
end

post "/" do
  append_munch_array
  running_total 
  redirect "/"
end

def append_munch_array
  params[:thismunch].each do |key, value|
    $munch << "<div>#{ key } #{ value }</div>"
  end

end

def running_total
  $running_total = params[:thismunch][:cost].to_i
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
  <hr>Running Total is:</hr>
  #{ $running_total.inspect }


  <br>
  </body>
  </html>
  "
end