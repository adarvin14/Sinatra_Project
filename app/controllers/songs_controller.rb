class SongsController < ApplicationController
    
    get '/songs' do
        if logged_in?
            @songs = current_user.songs
            erb :'songs/index'
        else
            redirect '/login'
        end
    end

    get '/songs/new' do
        if logged_in?
            erb :'songs/new'
        else
            redirect '/login'
        end
    end

    post '/songs' do
        #add song to user's songs list, if it's not in the db, create a new song to add
        #if the song is saved after being created, redirect to /songs
        #else, redirect to /songs/new
        
        if @song = Song.find_by(title: params[:title].downcase)
            current_user.songs << @song
            redirect '/songs'
        else
            params[:title].downcase!
            @song = Song.create(params)
            current_user.songs << @song
            if @song.save
                redirect '/songs'
            else
                redirect '/songs/new'
            end
        end
    end

    get '/songs/:id' do
        if logged_in?
            @song = current_user.songs.find_by(id: params[:id])
            if @song
                erb :'songs/show'
            #if song is not listed, redirect to list of songs
            end
        else
            redirect '/login'
        end
    end

    get '/songs/:id/edit' do
        if logged_in?
            @song = current_user.songs.find_by(id: params[:id])
            erb :'songs/edit'
        else
            redirect '/login'
        end
    end

    patch '/songs/:id' do
        if logged_in?
            @song = current_user.songs.find_by(id: params[:id])
            if @song
                @song.title = params[:title]
                @song.artist = params[:artist]
                @song.album = params[:album]
                @song.genre = params[:genre]
                @song.release_date = params[:release_date]
                if @song.save
                    redirect "/songs/:id"
                else
                    redirect "/songs/:id/edit"
                end
            else
                redirect '/songs'
            end
        else
            redirect '/login'
        end
    end

    delete '/songs/:id' do
        if logged_in?
            @song = current_user.songs.find_by(id: params[:id])
            current_user.songs.delete(@song)
            redirect '/songs'
        else
            redirect '/login'
        end
    end

end