class BeingsController < AppController

  get '/beings' do
    @users = User.all

    erb :'beings/index' 
  end

  get '/beings/new' do
    redirect '/users/login' if not logged_in?

    erb :'beings/new'
  end

  post '/beings/new' do
    being = Being.new
    being.name = params[:name] == "" ? "Unknown" : params[:name] 
    being.age = params[:age].to_i == 0 ? "Unknown" : params[:age]
    being.species = params[:species] == "" ? "Unknown" : params[:species]

    being.parts << Part.create(params[:head])
    being.parts << Part.create(params[:body])
    being.parts << Part.create(params[:eyes])
    being.save

    current_user.beings << being

    redirect '/users/index'
  end

  get '/beings/:id' do
    @being = Being.find(params[:id])
    
    erb :'/beings/show'
  end

  get '/beings/:id/edit' do
    redirect '/beings' if !logged_in?

    @being = Being.find(params[:id])

    erb :'/beings/edit' 
  end

  patch '/beings/:id/edit' do
    being = Being.find(params[:id])
    being.name = params[:name] == "" ? "Unknown" : params[:name] 
    being.age = params[:age].to_i == 0 ? "Unknown" : params[:age]
    being.species = params[:species] == "" ? "Unknown" : params[:species]

    being.parts[Part::HEAD].update(params[:head])
    being.parts[Part::BODY].update(params[:body])
    being.parts[Part::EYES].update(params[:eyes])
    being.save

    redirect '/users/index'
  end

  delete '/beings/:id/delete' do
    being = Being.find(params[:id])
    being.destroy

    redirect '/users/index'
  end

end
