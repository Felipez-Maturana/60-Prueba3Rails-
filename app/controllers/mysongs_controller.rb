class MysongsController < ApplicationController
  before_action :authenticate_user!
  def index
    @mysongs = current_user.songs
  end

  def deletesong
    current_user.songs.delete(params[:song_id])
    redirect_to(mysongs_index_path)
  end


end
