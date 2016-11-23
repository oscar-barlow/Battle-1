require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  configure(:development) { set :session_secret, "secret" }


  post '/names' do
    session[:warrior1] = params[:name1]
    session[:warrior2] = params[:name2]
    session[:health1] = 100
    session[:health2] = 100
    session[:confirmation1] = nil
    redirect '/play'
  end

  get '/play' do
    @confirmation1 = session[:confirmation1]
    @warrior1 = session[:warrior1]
    @warrior2 = session[:warrior2]
    @warrior1_point = session[:health1]
    @warrior2_point = session[:health2]
    erb(:play)
  end

  get '/attack2' do
    session[:health2] = session[:health2] - 20
    @attacker = session[:warrior1]
    @defender = session[:warrior2]
    erb(:confirmation)
  end

  get '/attack1' do
    session[:health1] = session[:health1] - 20
    @defender = session[:warrior1]
    @attacker = session[:warrior2]
    erb(:confirmation)
  end



  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
