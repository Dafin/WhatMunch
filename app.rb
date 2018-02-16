require "sinatra"


$munch = []
$running_total = 0

get "/" do
    erb :index
end

get "/places" do
 "This will list food vendors and their distance away"
end

post "/" do
  @last_total = params['thismunch']['cost'].to_f
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
  $running_total = (@last_total + $running_total).round(2)
end
