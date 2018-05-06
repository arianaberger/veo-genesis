class BeingsController < AppController

  get '/beings' do
    erb :'beings/index' 
  end

  get '/beings/new' do
    erb :'beings/new'
  end

end
