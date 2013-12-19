use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV['USERNAME'] && password == ENV['PASSWORD']
end

#localhost:9696
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/recipes/new' do
  erb :new_recipe
end



 get '/recipes/' do
  erb :recipes
 end

get '/recipes/:recipe_id' do
  @recipe = Recipe.where(id: params[:recipe_id]).first
  erb :recipe
end

post '/recipes' do
  recipe = Recipe.create(title: params[:title], ingredients: params[:ingredients], instructions: params[:instructions] )
  redirect to "/recipes/#{recipe.id}"
end
