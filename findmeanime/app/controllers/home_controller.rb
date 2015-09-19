#require_relative 'suggestions.rb'

class HomeController < ApplicationController
  def index
    if logged_in?
        auth = Signet::Rails::Factory.create_from_env :google, request.env
        client = Google::APIClient.new
        client.authorization = auth

        @userid = current_user.uid
    end
  end
end
