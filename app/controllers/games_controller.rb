class GamesController < ApplicationController
  def index
  	@current_user = current_user
  	binding.pry
  end

  def show
  end
end
