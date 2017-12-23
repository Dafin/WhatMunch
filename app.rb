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
  @last_total = params['thismunch']['cost'].to_i
  append_munch_array
  p @last_total
  running_total 
  redirect "/"
end

def append_munch_array
  params[:thismunch].each do |key, value|
    $munch << "<div>#{ key }: #{ value }</div>"
  end

end

def running_total
  # p params
  # p params['thismunch']
  # p params['thismunch']['cost']
  $running_total = @last_total + $running_total
end

def template
  "
  <html>
  <title>WhatMunch App</title>
  <body>
  <form action='/' method='post'>
  What: <input name='thismunch[what]' required>
  Cost: <input name='thismunch[cost]'  type='number' step=0.01 min= required>:
  <button type='submit'>add munch</button>
  </form> 

  #{ $munch.join('') }
  <hr>Running Total is:</hr>
  #{ $running_total}


  <br>
  </body>
  </html>
  "
end