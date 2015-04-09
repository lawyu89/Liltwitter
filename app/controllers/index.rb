get '/' do
  # render home page
 #TODO: Show all users if user is signed in
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
    redirect '/'
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
    redirect '/'
  else
    erb :sign_up
  end
end
