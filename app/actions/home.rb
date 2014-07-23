get '/' do
  current_user ? (redirect '/songs') : (erb :index)
end
