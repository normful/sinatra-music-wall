get '/signup' do
  @user = User.new
  erb :'auth/signup'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :'auth/signup'
  end
end

get '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])
  erb :'auth/login'
end

post '/login' do
  begin
    @user = User.find_by!(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/songs'
  rescue ActiveRecord::RecordNotFound
    erb :'auth/login'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end

