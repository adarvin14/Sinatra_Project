class SongsController < ApplicationController
    
    get '/songs' do
        session_confirmed?
            @songs = current_user.songs
            erb :'songs/index'
    end

    get '/songs/new' do
        session_confirmed?
            erb :'songs/new'
    end

    post '/songs' do
        #add song to user's songs list, if it's not in the db, create a new song to add
        #if the song is saved after being created, redirect to /songs
        #else, redirect to /songs/new
        
        if existing_song
            current_user.songs << existing_song
            redirect '/songs'
        else
            @song = current_user.songs.build(params)
            if @song.save
                redirect '/songs'
            else
                @error = "Your song didn't save, try again!"
                
                erb :'/songs/new'
            end
        end
    end

    get '/songs/:id' do
        session_confirmed?
            selected_song
            erb :'songs/show'
    end

    get '/songs/:id/edit' do
        session_confirmed?
            selected_song
            erb :'songs/edit'
    end

    patch '/songs/:id' do
        session_confirmed?
            selected_song
            params.delete(:_method)
        if selected_song.update(params)
            redirect "/songs/#{@song.id}"
        else
            redirect "/songs/#{@song.id}/edit"
        end
    end

    delete '/songs/:id' do
        session_confirmed?
            selected_song
            current_user.songs.delete(@song)
            redirect '/songs'
    end

end