require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  configure(:development) { set :session_secret, "secret" }


  post '/names' do
    session[:warrior1] = params[:name1]
    session[:warrior2] = params[:name2]
    redirect '/play'
  end

  get '/play' do
    @warrior1 = session["warrior1"]
    @warrior2 = session["warrior2"]
    @warrior1_point = 100
    @warrior2_point = 100
    erb(:play)
  end

  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
