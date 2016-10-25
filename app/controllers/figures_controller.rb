class FiguresController < ApplicationController
   
   get '/figures' do 
       erb :'/figures/index'
   end
   
   get '/figures/new' do 
       erb :'figures/new'
   end
   
   post '/figures' do
      @figure = Figure.create(:name => params["figure"]["name"], :title_ids => params["figure"]["title_ids"], :landmark_ids => params["figure"]["landmark_ids"])
      if !params["title"]["name"].empty?
         @figure.titles << Title.create(:name => params["title"]["name"])
      end
      if !params["landmark"]["name"].empty?
         @figure.landmarks << Landmark.create(:name => params["landmark"]["name"])
      end
   end
   
   get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'figures/show'
   end
   
   post '/figures/:id' do 
      @figure = Figure.find(params[:id])
      @figure.update(params[:figure])
      if !params[:landmark][:name].empty?
         @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
      end
      if !params[:title][:name].empty?
         @figure.title << Title.create(:name => params[:title][:name])
      end
      erb :'figure/show'
   end
   
   get '/figures/:id/edit' do 
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
   end
    
end