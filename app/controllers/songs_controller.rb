class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /songs
  # GET /songs.json
  def index

   if params[:search].blank?
      @songs = Song.all
   else
    @songs = Song.all
    @songs = @songs.where("name like ?", "%#{params[:search]}%")
     
   end

   if params[:alf]=='t'
     @songs = @songs.order('name ASC')
   end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    # genres_ids = song_params["genres_ids"].delete_if{ |x| x.empty? }
    # @genres = Genre.find(genres_ids)
    # @song.genres << @genres

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def addsong
      @s = Song.find(params[:id])
      current_user.songs << @s
      redirect_to songs_path
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :duration, :genre_id)
    end


end
