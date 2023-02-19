require 'sinatra'

get '/' do
  "Put this in your pipe & smoke it! - From: #{ENV['CURRENT_PLATFORM']}"
end
