require 'sinatra'
require 'dotenv'
require './lib/reddit'
require './lib/new_york_times'
require './lib/stackoverflow'
require './lib/constants'
require 'rest-client'
require 'pry'

Dotenv.load

post '/reddit' do
  reddit = Reddit.new
  reddit.fetch_content(params["text"]) 
  reddit.response
end

post '/stack' do
  stack = StackOverflow.new
  stack.fetch_content(params["text"])
  stack.response
end

post '/news' do
  nytimes = NewYorkTimes.new
  nytimes.fetch_content(params["text"])
  nytimes.response
end
