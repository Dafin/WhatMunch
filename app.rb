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
    $munch << "<tr><td>#{ key }:</td><td> #{ value }</td></tr>"
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
    <head>
    <title>WhatMunch App</title>
    <link rel='stylesheet' href='/css/normalize.min.css'>
    <link rel='stylesheet' href='/css/main.css'>
    <div class='main-container'</div>
    </head>
    <body>
    <div class='header-container'>
    <h1 class='title'>WhatMunch</h1></div>

    <form action='/' method='post'>
    What: <input name='thismunch[what]' required>
    Cost: <input name='thismunch[cost]'  type='number' step=0.01 min= required>:
    <button type='submit'>add munch</button>
    </form> 
    <table>
    #{ $munch.join('') }
    <hr>Running Total is:</hr>
    #{ $running_total}
    </table>
    </body>
    </div>
  </html>
  "
end