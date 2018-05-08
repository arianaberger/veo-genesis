class UsersController < AppController

  get '/users' do
    erb :'users/index'
  end

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users/signup' do
    fields_empty = params[:username] == '' || params[:password] == ''

    if fields_empty
      flash[:signup_error] = "Username and Password are required."
      redirect '/users/signup'
    end

    already_taken = User.find_by(username: params[:username])

    if already_taken 
      flash[:signup_error] = "That Username is already taken."
      redirect '/users/signup'
    end

    user = User.create(
      username: params[:username], password: params[:password]
    )

    login(user)
  end

  get '/users/login' do
    if logged_in?
      redirect '/users/index'
    else
      erb :'/users/login'
    end
  end

  post '/users/login' do
    user = User.find_by(username: params[:username])

    if !user
      flash[:login_error] = "#{params[:username]} does not exist."
      redirect '/users/signup'
    end

    if !user.authenticate(params[:password])
      flash[:login_error] = "The password entered was incorrect."
      redirect '/users/login'
    end

    login(user)
  end

  get '/users/logout' do
    session.clear
    redirect '/'
  end

  get '/users/index' do
    if logged_in?
      @beings = Being.all
      @bodies = ['/img/body1.svg', '/img/body2.svg', '/img/body3.svg']

      erb :'users/index'  
    else
      erb :'users/login'
    end
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
