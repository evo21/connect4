class UsersController < ApplicationController
  def index
  	@current_user = current_user
  	@all_users = User.all
  end


  def destroy
  	@current_user = current_user
  	@current_user.destroy
    redirect_to new_user_session_path, notice: "User deleted."
  end
end
