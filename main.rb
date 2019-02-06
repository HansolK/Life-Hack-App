require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'

require_relative 'db_config'
require_relative 'models/category'
require_relative 'models/idea'
require_relative 'models/user'
enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
  def logged_in?
    if current_user 
      true
    else
      false
    end
  end
end

get '/' do
  erb :login
end


get '/new_ideas' do
  @categories = Category.all
  erb :new_ideas
end


get '/ideas' do
  @ideas = Idea.all
  @users = current_user
  erb :ideas
end


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/my_ideas' do
  @ideas = Idea.where(user_id: current_user)
  erb :my_ideas
end


get '/ideas/detail/:id' do 
  @idea = Idea.find_by(id: params["id"])
  @user = User.find_by(id: @idea.user_id)
  erb :idea_details
end

get '/ideas/detail/:id/edit' do
  @idea = Idea.find_by(id: params["id"])
  @categories = Category.all
  erb :edit

end


get '/ideas/category' do
  @categorized_ideas = Idea.where(category_id: params["category_id"])
  erb :category
end

post '/session' do
  user = User.find_by(email: params["email"])

  if user && user.authenticate(params["password"])
    session[:user_id] = user.id
    redirect '/ideas'
  else
    if params["button"] == "join"
      erb :join
    else
      erb :login
    end
  end
end

post '/user' do
 user = User.new
 user.name = params["name"]
 user.email = params["email"]
 user.password = params["password"]
 user.save

 redirect '/'
end

post '/ideas' do 
  idea = Idea.new
  idea.title = params[:title]
  idea.description = params[:description]
  idea.user_id = current_user.id
  idea.category_id = params[:category_id]
  idea.save
  redirect '/ideas'
end

put '/ideas/:id' do
  idea = Idea.find(params[:id])
  idea.title = params[:title]
  idea.description = params[:description]
  # raise params[:category_id].to_s
  idea.category_id = params[:category_id]
  idea.save
  redirect "/ideas/detail/#{idea.id}"
end

delete '/ideas/:id' do
  delete_item = Idea.find_by(id: params[:id])
  delete_item.destroy

  redirect 'my_ideas'
end