class BeingsController < AppController

  get '/beings' do
    if logged_in?
      @beings = current_user.beings

      erb :'beings/index' 
    else
      redirect '/users/login'
    end
  end

  get '/beings/new' do
    if logged_in?
      erb :'beings/new'
    else
      redirect '/users/login'
    end
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

    redirect '/beings'
  end

end
