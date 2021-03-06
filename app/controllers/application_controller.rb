require './config/environment'
require 'rack-flash'
require 'rack/flash/test'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
    use Rack::Flash
  end

  helpers do
    def logged_in?
        !!current_user
    end
      
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

end