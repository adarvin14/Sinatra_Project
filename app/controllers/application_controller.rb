require './config/environment'

class ApplicationController < Sinatra::Base
  
   configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["S3SS1ON_S3CRET"]
  end
  
  get '/' do 
    erb :welcome
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end
    
    def current_user
      @user ||= User.find_by(id: session[:user_id]) if logged_in?
    end
    
    #helper method for Song.find_by(title: params[:title])
    def existing_song
      Song.find_by(title: params[:title])
    end
    #helper method for @song = current_user.songs.find_by(id: params[:id])
    def selected_song
      @song = current_user.songs.find_by(id: params[:id])
      if !@song
        redirect '/songs'
      end
      @song
    end
  

    #not sure if this helper method will work since code needs to go inside if,else statement in songs controller
    def session_confirmed?
      if !logged_in?
       redirect '/login'
      end
    end
  end
  
  # def authenticate      
  #   if !logged_in?
  #     redirect '/login'
  #   end
  # end

end