require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end

  def score
    @found = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read)
    vector = params[:word].chars
    @result = vector.all? { |letter| vector.count(letter) <= params[:letters].count(letter)}
  end
end
