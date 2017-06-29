class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.create(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end


  patch '/recipes/:id' do
    Recipe.find_by_id(params[:id]).update(params[:recipe])
    @recipe = Recipe.find_by_id(params[:id])
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  delete '/recipes/:id/delete' do
    Recipe.find_by_id(params[:id]).destroy
  end

end
