class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(request.env["omniauth.auth"])
    if @user
      session[:user_id] = @user.id
      redirect_to user_playlists_path(@user)
    end
  end

  def destroy
    session.clear
    redirect_to user_playlists_path(@user)
  end
end
