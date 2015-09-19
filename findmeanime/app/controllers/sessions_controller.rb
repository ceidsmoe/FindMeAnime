class SessionsController < ApplicationController
    def create
        user = request.env['signet.google.persistence_obj'].user
        session[:user_id] = user.id
        flash[:notice]  = 'Signed in!'
        redirect_to root_url
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Signed out'
        redirect_to root_url
    end
end
