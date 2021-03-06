class LandmarksController < ApplicationController
  
  get '/landmarks/new' do 
      erb :'landmarks/new'
  end
  
  get '/landmarks' do 
      erb :'landmarks/index'
  end
  
  post '/landmarks' do 
      Landmark.create(params[:landmark])
      erb :'landmarks/index'
  end
  
  get '/landmarks/:id' do 
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
  end
  
  get '/landmarks/:id/edit' do 
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/edit'
  end
  
  post '/landmarks/:id' do 
      @landmark = Landmark.find(params[:id])
      @landmark.update(params[:landmark])
      @landmark.save
      erb :'/landmarks/show'
  end
  
end
