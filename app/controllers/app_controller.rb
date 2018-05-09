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
      example_user = User.create(username: "example", password: "elpmaxe")
      being = Being.new
      being.name = "Alekto"
      being.age = 1000
      being.species = "Erinyes"

      being.parts = [Part.new, Part.new, Part.new]

      being.parts[Part::HEAD].model = 2
      being.parts[Part::HEAD].color = 75
      being.parts[Part::HEAD].brightness = 100
      being.parts[Part::HEAD].save
      being.parts[Part::BODY].model = 3
      being.parts[Part::BODY].color = 75
      being.parts[Part::BODY].brightness = 100
      being.parts[Part::BODY].save
      being.parts[Part::EYES].model = 3
      being.parts[Part::EYES].color = 75
      being.parts[Part::EYES].brightness = 100
      being.parts[Part::EYES].save
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
