class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(name: params[:name],
        email: params[:email],
        username: params[:username],
        password: params[:password])
        
        #if user is logged in, redirect to library, if not redirect back to login

    end

end