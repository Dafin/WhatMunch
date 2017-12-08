require "sinatra"
require "sinatra/reloader"

get "/" do
"
<html>
<body>
<form action='/' method='get'>
What: <input name='what'>
Cost: <input name='cost'>
<button type='submit'>add munch</button>
</form>
<!-- food list goes here -->
</body>
</html>
"
end


get "/places" do
 "This will list food vendors and their distance away"
end