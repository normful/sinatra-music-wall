# Homepage (Root path)
get '/' do
  erb :index
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
    redirect '/songs'
  else
    erb :'auth/signup'
  end
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
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @more_songs = Song.where.not(id: params[:id]).where(author: @song.author)
  erb :'songs/show'
end
