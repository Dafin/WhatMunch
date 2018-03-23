require "sinatra"

$munch = []
$running_total = 0
$budget = 100

    # scss :stylesheet, :style => :expanded
get "/" do
    erb :index 

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
    # $munch << "<tr><td>#{ key }:</td><td> #{ value }</td></tr>"
    $munch << "<td>#{ value }</td>"

      if "#{ value }".numeric? 
         $munch << "</tr>"
         return
       end

  end

end

def running_total
  $running_total = (@last_total + $running_total).round(2)
end


class String
  def numeric?
    Float(self) != nil rescue false
  end
end