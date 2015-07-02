class SongsController < ApplicationController

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
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
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
    binding.pry
    song = Song.find_by_slug(params[:slug])
    song = Song.new(params[:song])
    song.artist = params[:artist]
    song.genres << params[:genre]
    song.save

  end

end