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
      flash[:signup_error] = "Username and password are required."
      redirect '/users/signup'
    end

    invalid_characters = 
      params[:username].match(/\W/) || params[:password].match(/\W/)

    if invalid_characters
      flash[:signup_error] = "Username and password must be alphanumeric characters."
      redirect '/users/signup'
    end

    already_taken = User.find_by(username: params[:username])

    if already_taken 
      flash[:signup_error] = "That username is already taken."
      redirect '/users/signup'
    end

    user = User.create(username: params[:username], password: params[:password])

    login(user)
  end

  get '/users/login' do
    redirect '/users/index' if logged_in? 

    erb :'/users/login'
  end

  post '/users/login' do
    fields_empty = params[:username] == "" || params[:password] == ""

    if fields_empty
      flash[:login_error] = "Username and password are required."
      redirect '/users/login'
    end

    user = User.find_by(username: params[:username])

    if !user
      flash[:login_error] = "User '#{params[:username]}' does not exist."
      redirect '/users/login'
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
      erb :'users/index' 
    else
      erb :'users/login'
    end
  end

end
