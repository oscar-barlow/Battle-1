require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  configure(:development) { set :session_secret, "secret" }


  post '/names' do
    session[:warrior1] = params[:name1]
    session[:warrior2] = params[:name2]
    session[:life1] = 100
    session[:life2] = 100
    session[:confirmation1] = nil
    redirect '/play'
  end

  get '/play' do
    @confirmation1 = session[:confirmation1]
    @warrior1 = session[:warrior1]
    @warrior2 = session[:warrior2]
    @warrior1_point = session[:life1]
    @warrior2_point = session[:life2]
    erb(:play)
  end

  get '/attack2' do
    session[:confirmation1] = "#{session[:warrior1]} attacked #{session[:warrior2]}"
    session[:life2] = session[:life2] - 20
    redirect '/play'
  end

  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
