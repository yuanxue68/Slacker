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
  reddit.request_content(params["text"]) 
  reddit.parse_content
  reddit.response.join("\r\n")
end

post '/stack' do
end

post '/news' do
end

post '/hacker' do
end
