class WatchedAnimesController < ApplicationController
    def index
        @watched_animes = WatchAnime.all
    end

    def new
        @watched_anime = WatchAnime.new
    end

    def show
        @watched_anime = WatchAnime.find(params[:id])
    end

    def create
        if logged_in?
            @user = current_user
            @user.watched_animes.create()

            if @watched_anime.save
                redirect_to root_path
            else
                render 'new'
            end
        end
    end

    private
        def watched_anime_params
            params.require(:watched_anime).permit(:rank)
        end
end
