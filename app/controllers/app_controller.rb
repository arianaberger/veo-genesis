require './config/environment'

class AppController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
    enable :sessions
    set :session_secret, 'veogenesis_sisenegoev'
  end

  register Sinatra::Flash

  get '/' do
    if User.all.empty?
      example_user = User.create(username: "Example", password: "elpmaxe")
      being = Being.new
      being.name = "Alekto"
      being.age = 1000
      being.species = "Erinyes"

      being.parts = [Part.new, Part.new, Part.new]

      being.parts[0].model = 2
      being.parts[0].color = 75
      being.parts[0].brightness = 100
      being.parts[0].save
      being.parts[1].model = 3
      being.parts[1].color = 75
      being.parts[1].brightness = 100
      being.parts[1].save
      being.parts[2].model = 3
      being.parts[2].color = 75
      being.parts[2].brightness = 100
      being.parts[2].save
      being.save

      example_user.beings << being
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
