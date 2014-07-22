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

# Songs
get '/songs' do
  @songs_with_upvotes = Song.joins(:upvotes).group("song_id").order("COUNT(*) DESC")
  # SELECT *
  # FROM songs INNER JOIN upvotes ON upvotes.song_id = songs.id
  # GROUP BY song_id
  # ORDER BY COUNT(*) DESC;
  @all_songs = Song.all
  @songs = (@songs_with_upvotes + @all_songs).uniq
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs/new' do
  @song = Song.create(
      user_id: current_user.id,
      title: params[:title],
      url: params[:url]
  )
  if @song.save
    redirect'/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @reviews = Review.where(song_id: params[:id])
  @more_songs = Song.where.not(id: params[:id]).where(user_id: @song.user_id)
  erb :'songs/show'
end

post '/songs/upvote' do
  Upvote.create!(
    user_id: current_user.id,
    song_id: params[:song_id]
  )
  redirect '/songs/' + params[:song_id]
end

post '/songs/review' do
  Review.create!(
    user_id: current_user.id,
    song_id: params[:song_id],
    rating: params[:rating],
    review_text: params[:review_text]
  )
  redirect '/songs/' + params[:song_id]
end

post '/songs/review/delete' do
  Review.delete(params[:review_id])
  redirect '/songs/' + params[:song_id]
end
