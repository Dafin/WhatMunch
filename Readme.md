# WhatMunch :fork_and_knife: :yum: :money_with_wings:

### What is this?


This is a rudimentary bill splitting/budgeting thingy (being) built in Ruby, using Sinatra and RSpec.

It's hosted on [heroku](https://stark-waters-35727.herokuapp.com), to [use](# how-to-use) straight away.

Please _don't_ use this with real currency! read the [notes](# notes).

### Installation


1. Clone/ Fork this repo [here](https://github.com/Dafin/WhatMunch),

2. Navigate to the app folder in the command line and run `bundle install`. Install any missing dependencies.

3. To start the app and server, run `ruby app.rb` and navigate to http://localhost:4567 in a web browser.


### How to use


1. Enter the name of the food item into the first box.

2. Press tab / touch or select the next input to enter the cost of the previous item.

3  Press 'Add Munch', and continue to add further items, the total running cost will be displayed below the button

### Testing

1. Navigate to the app folder and run `rspec spec/`


### Notes

Don't use this in the real life with real currency, due to rounding errors in float arithmetic, there will be inaccuracies! 

**Global variables** are being used here. This is generally bad practice, however, as there is no database or data persistence, this should not be an issue.