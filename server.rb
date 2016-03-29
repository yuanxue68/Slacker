require 'sinatra'
require 'dotenv'
require './lib/reddit'
require './lib/hackernews'
require './lib/new_york_times'
require './lib/stackoverflow'
require 'rest-client'
require 'pry'

Dotenv.load
#stackoverflow = StackOverFlow.new

post '/reddit' do
  reddit = Reddit.new
  reddit.fetch_content(params["text"]) 
  reddit.response
end

post '/stack' do
end

post '/news' do
end

post '/hacker' do
end
