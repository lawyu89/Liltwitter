get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
end

post '/sessions' do
  # sign-in
end

delete '/sessions/:id' do
  # sign-out -- invoked
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
