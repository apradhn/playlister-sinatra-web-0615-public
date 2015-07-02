class SongsController < ApplicationController
  enable :sessions

  get '/songs' do 
    @songs = Song.all
    erb:'/songs/index'
  end

  get '/songs/new' do 
    @genres = Genre.all
    erb :'/songs/new'
  end  

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    @message = session[:message]
    session[:message] = ""
    erb :'/songs/show'
  end

  post '/songs' do 
    song = Song.new(params[:song])
    song.artist = params[:artist]
    song.genres < params[:genre]
    song.save
    redirect "/songs"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(params[:artist])
    genres = params[:genre].keys.collect{|genre_id| Genre.find(genre_id)}
    song.artist = artist
    song.genres = genres
    song.save
    session["message"] = "Song successfully updated."
    redirect "/songs/#{song.slug}"
  end

end