class GamesController < ApplicationController
  def index
  	@current_user = current_user
  end

  def show
  end
end
