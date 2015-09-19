class HomeController < ApplicationController
  def index
    if logged_in?
        auth = Signet::Rails::Factory.create_from_env :google, request.env
        client = Google::APIClient.new
        client.authorization = auth
        service = client.discovered_api('calendar', 'v3')
        @result = client.execute(
            :api_method => service.calendar_list.list,
            :parameters => {},
            :headers => {'Content-Type' => 'application/json'}
        )
    end
  end
end
