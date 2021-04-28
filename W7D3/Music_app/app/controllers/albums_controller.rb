class AlbumsController < ApplicationController
   
    def show
        @albums = Album.find_by(id: params[:id])
        render :show
    end 

    def create
        @albums = Album.new(album_params)
        if @albums.save
            redirect_to album_url
        else  
            flash.now[:errors] = @albums.errors.full_messages
            render :new
        end 
    end 

    def new
        @band = Band.find(params[:band_id])
        @albums = Album.new(band_id: params[:band_id])
        render :new
    end 

    def edit
        @albums = Albums.find_by(id: params[:id])
        render :edit
    end 

    def update
        @albums = Albums.find_by(id: params[:id])
        if @albums.update(album_params)
            redirect_to album_url
        else 
            flash.now[:errors] = @albums.errors.full_messages
            render :edit
        end 
    end 

    def destory
        @albums = Albums.find_by(id: params[:id])
        @albums.destory
        redirect_to band_url(@albums.band_id)
    end 


    private

    def albums_params
        params.require(:album).require(:name,:band_id,:year,:live)
    end 
end
