class SongsController < ApplicationController
    
    get "/songs" do
        if logged_in?
            current_user.songs
            erb :'songs/index'
        else
            redirect '/login'
        end
    end

    get "/songs/new" do
        if logged_in?
            erb :'songs/new'
        else
            redirect '/login'
        end
    end

    post "/songs" do
        #add song to user's songs list, if it's not in the db, create a new song to add
        #if the song is saved after being created, redirect to /songs
        #else, redirect to /songs/new
    end

    get "/songs/:id" do
        if logged_in?
            @song = current_user.songs.find_by(params)
            erb :"songs/show"
        else
            redirect '/login'
        end
    end

    get "/songs/:id/edit" do
        if logged_in?
            @song = current_user.songs.find_by(params)
            erb :"/songs/edit"
        else
            redirect '/login'
        end
    end

    patch "/songs/:id" do
        #find song by id
        #song attributes (@song.attribute = params[:attribute], complete for each attribute)
        #save song and redirect to the song that is saved
        #else redirect to edit page for the saong
    end

    delete "/songs/:id" do
        if logged_in?
            song = current_user.songs.find_by(id: params[:id])
            current_user.songs.delete(song)
            redirect '/songs'
        else
            redirect '/login'
        end
    end

end