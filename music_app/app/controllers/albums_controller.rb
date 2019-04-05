class AlbumsController < ApplicationController
    def new
        @album = Album.new
        @current_band = Band.find_by(id: params[:band_id])
        @bands = Band.all

        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])

        if @album
            @bands = Band.all
            render :edit
        else
            render json: "no such album", status: 404
        end
    end

    def update
        @album = Album.find_by(id: params[:id])

        if @album.update_attributes(album_params)
            redirect_to band_url(@album.band) #keep an eye
        else
            render :edit
        end
    end

    def show
        @album = Album.find_by(id: params[:id])

        if @album
            render :show
        else
            render json: "no such album", status: 404
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        band = @album.band

        @album.destroy

        redirect_to band_url(band)
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :live, :band)
    end
end
