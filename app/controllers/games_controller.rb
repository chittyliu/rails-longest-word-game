require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    # raise
    @letters = []
    10.times do
      @letters << ("A".."Z").to_a.sample
    end
    return @letters
  end

  def score
    # raise
    @answer = params[:answer].upcase
    @letters = params[:letters].split(" ")
    if english(@answer) == true && grid?(@answer, @letters) == true
      return @result = "well done"
    else
      return @result = "It's not valid."
    end
  end

  def english(answer)
    word_serialized = open("https://wagon-dictionary.herokuapp.com/#{answer}").read
    word = JSON.parse(word_serialized)
    return word["found"]
  end

  def grid?(answer, letters)
    answer.split("").all? { |letter| answer.count(letter) <= letters.count(letter)}
  end
end
