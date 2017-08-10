class UsuariosController < ApplicationController
  def index
    @users = User.all
  end

  def songsof
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @canciones = @user.songs
  end
end
