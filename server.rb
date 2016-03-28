require 'sinatra'
require 'dotenv'
require 'rest-client'
require './lib/reddit'
require './lib/hackernews'
require './lib/new_york_times'
require './lib/stackoverflow'

Dotenv.load

get '/reddit' do

end

get '/stack' do
end

get '/news' do
end

get '/hacker' do
end
