require './config/environment'

class AppController < Sinatra::Base

  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
    enable :sessions
    set :session_secret, 'veogenesis_sisenegoev'
  end

  get '/' do
    if User.all.empty?
      user = User.create(username: "example", password: "example")

      being = Being.new
      being.name = "Alekto"
      being.age = 1000
      being.species = "Erinyes"
      being.parts = [
        Part.create(model: 2, color: 75, brightness: 100), 
        Part.create(model: 3, color: 75, brightness: 80), 
        Part.create(model: 3, color: 60, brightness: 90)
      ]

      being.save
      user.beings << being
    end

    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def login(user)
      session[:user_id] = user.id
      redirect '/users/index'
    end
  end

end
