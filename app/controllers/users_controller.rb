class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(username: params[:username],
        username: params[:username],
        password: params[:password])
        
        #if user is logged in, redirect to library, if not redirect back to login

    end

end