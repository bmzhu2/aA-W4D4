class TracksController < ApplicationController
    def new
        @track = Track.new
        band = Band.find_by(id: params[:band_id])
        @current_album = band.albums.find_by(id: params[:album_id])
        @albums = band.albums

        render :new
    end

    def create
        @track = Track.new(track_params)

        if @track.save
            redirect_to track_url(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :new
        end
    end

    def edit
        @track = Track.find_by(id: params[:id])

        if @track
            @bands = Band.all
            render :edit
        else
            render json: "no such track", status: 404
        end
    end

    def update
        @track = Track.find_by(id: params[:id])

        if @track.update_attributes(track_params)
            redirect_to band_url(@track.band) #keep an eye
        else
            render :edit
        end
    end

    def show
        @track = Track.find_by(id: params[:id])

        if @track
            render :show
        else
            render json: "no such track", status: 404
        end
    end

    def destroy
        @track = Track.find_by(id: params[:id])
        band = @track.band

        @track.destroy

        redirect_to band_url(band)
    end

    private
    def track_params
        params.require(:track).permit(:title, :ord, :lyrics, :album, :bonus)
    end
end
