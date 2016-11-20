require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)
get '/' do
  guess = params["guess"]
  message = check(guess)
  erb :index, :locals => {:message => message, :color => @color}
end

def check(guess)
  difference = guess.to_i - SECRET_NUMBER
  if difference < -5
    @color = "red"
    "Way too low!"
  elsif difference < 0
    @color = "salmon"
    "Too low!"
  elsif  difference > 5
    @color = "red"
    "Way too high!"
  elsif  difference > 0
    @color = "salmon"
    "Too high!"
  else
    @color = "lime"
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end