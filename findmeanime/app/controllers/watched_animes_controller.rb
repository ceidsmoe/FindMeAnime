class WatchedAnimesController < ApplicationController

    def create
        if logged_in?
            @user = current_user
            @watched_anime = @user.watched_animes.create(watched_anime_params)

            #if @watched_anime.save
            redirect_to root_path
            #else
            #    render 'new'
            #end
        end
    end

    private
        def watched_anime_params
            params.require(:watched_anime).permit(:rank)
        end
end
