require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)
get '/' do
  guess = params["guess"]
  message = check(guess)
  erb :index, :locals => {:message => message}
end

def check(guess)
  difference = guess.to_i - SECRET_NUMBER
  if difference < -5
    "Way too low!"
  elsif difference < 0
    "Too low!"
  elsif  difference > 5
    "Way too high!"
  elsif  difference > 0
    "Too high!"
  else
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end