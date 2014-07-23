get '/songs' do
  @songs_with_upvotes = Song.joins(:upvotes).group("songs.id").order("COUNT(upvotes.user_id) DESC")
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
