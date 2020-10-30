class UsersController < ApplicationController

    get '/login' do
        erb :'users/login'
    end 

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/library'
        else 
            redirect '/signup'
        end
    end

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

    get '/logout' do
        session.destroy
        redirect '/login'
    end
end