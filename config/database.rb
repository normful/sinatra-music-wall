configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  configure :production do
    set :database, {
      adapter: "postgresql",
      database: "postgres://jawumeabvjywyn:5pFM6Kseh2CshvdpCm53LX-z-7@ec2-50-17-207-54.compute-1.amazonaws.com:5432/d8cft36k91f075"
    }
  end

  configure [:development, :test].each do
    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
