
#localhost:9696
get '/' do
  # Look in app/views/index.erb
  erb :index
end

 get '/recipes/' do
  erb :recipes
 end

get '/recipes/:recipe_id' do 
  @recipe = Recipe.where(id: params[:recipe_id]).first
  erb :recipe 
end 
