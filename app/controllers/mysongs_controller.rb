class MysongsController < ApplicationController
  before_action :authenticate_user!
  def index
    @mysongs = current_user.songs
  end
end
