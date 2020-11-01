class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(username: params[:username], password: params[:password])
        if user.save 
            session[:user_id] = user.id 
            redirect '/songs'
        else
            redirect '/signup'
        end
    end

end