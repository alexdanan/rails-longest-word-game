require 'open-uri'

class GamesController < ApplicationController
  # before_action :create_letters
  def new_game
    letters = ('A'..'Z').to_a
    @random_letters = letters.sample(10)
  end

  def score
    # @random_letters = new_game
    random_letters = params[:letters].split(" ")
    user = params[:word].upcase.split("")
    includes = user.all? { |e| random_letters.include?(e) }
    if includes
      url = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read
      result = JSON.parse(url)
      if result['found'] == true
        @answer = 'Well done'
      else
        @answer = 'This is not an english word'
      end
    else
      @answer = "#{params[:word]} cannot be build out of #{params[:letters]}"
    end
  end
end

# private

#   def create_letters
#     letters = ('A'..'Z').to_a
#     @random_letters = letters.sample(10)
#     @random_letters

#   end

# end
