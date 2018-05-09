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

    head_part = Part.new(
      category: "head", 
      model: params[:head_model], 
      color: params[:head_color], 
      brightness: params[:head_brightness]
    ) 

    being.parts << head_part

    body_part = Part.new(
      category: "body",
      model: params[:body_model], 
      color: params[:body_color], 
      brightness: params[:body_brightness]
    )

    being.parts << body_part
    
    eyes_part = Part.new(
      category: "eyes",
      model: params[:eyes_model], 
      color: params[:eyes_color], 
      brightness: params[:eyes_brightness]
    )

    being.parts << eyes_part

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

    being.parts[Part::HEAD].model = params[:head_model]
    being.parts[Part::HEAD].color = params[:head_color]
    being.parts[Part::HEAD].brightness = params[:head_brightness]
    being.parts[Part::HEAD].save

    being.parts[Part::BODY].model = params[:body_model]
    being.parts[Part::BODY].color = params[:body_color]
    being.parts[Part::BODY].brightness = params[:body_brightness]
    being.parts[Part::BODY].save

    being.parts[Part::EYES].model = params[:eyes_model]
    being.parts[Part::EYES].color = params[:eyes_color]
    being.parts[Part::EYES].brightness = params[:eyes_brightness]
    being.parts[Part::EYES].save

    being.save

    redirect '/users/index'
  end

  delete '/beings/:id/delete' do
    redirect '/beings' if !logged_in?

    being = Being.find(params[:id])
    being.destroy

    redirect '/users/index'
  end

end
