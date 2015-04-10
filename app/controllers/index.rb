get '/' do
  erb :index
end

get '/users/:id' do
  @user = User.where(id: params[:id]).first
  erb :index
end


#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  @user = User.where(email: params[:email]).first
  if @user.nil?
    status 404
    return "User does not exist!"
  end
  if @user.password == params[:password]
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Incorrect email/password combination"
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :'sign_up'
end

post '/users' do
  @user = User.new
  @user.username = params[:username]
  @user.email = params[:email]
  @user.password = params[:password]
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :sign_up
  end
end

get '/users/:id/profiles' do
  @all_users = User.all
  @user = User.where(id: params[:id]).first

  erb :index_all_users
end



get '/users/:id/profiles/:user_id' do
  @somebody_else = User.where(id: params[:user_id]).first
  @user = User.where(id: params[:id]).first

  erb :other_profile
end

get '/users/:id/profiles/:user_id/unfollow' do
  @somebody_else = User.where(id: params[:user_id]).first
  @user = User.where(id: params[:id]).first

  @user.leaders.delete(@somebody_else)

  erb :other_profile
end

get '/users/:id/profiles/:user_id/follow' do
  @somebody_else = User.where(id: params[:user_id]).first
  @user = User.where(id: params[:id]).first

  @user.leaders << @somebody_else

  erb :other_profile
end