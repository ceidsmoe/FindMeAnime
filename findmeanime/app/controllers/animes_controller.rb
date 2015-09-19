class AnimesController < ApplicationController
    def index
        @animes = Anime.all
    end

    def new
        @anime = Anime.new
    end

    def show
        @anime = Anime.find(params[:id])
    end

    def create
        @anime = Anime.new(anime_params)

        if @anime.save
            redirect_to @anime
        else
            render 'new'
        end
    end

    private
        def anime_params
            params.require(:anime).permit(:title)
        end
end
