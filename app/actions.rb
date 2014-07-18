helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  current_user ? (redirect '/songs') : (erb :index)
end

# User signup
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

# User login
get '/login' do
  @user = User.new
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

# Songs
get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
  )
  @song.save ? (redirect'/songs') : (erb :'songs/new')
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @more_songs = Song.where.not(id: params[:id]).where(author: @song.author)
  erb :'songs/show'
end
