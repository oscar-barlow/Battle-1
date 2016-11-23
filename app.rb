require 'sinatra/base'
require_relative 'lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions
  configure(:development) { set :session_secret, "secret" }


  post '/names' do
    $player_1 = Player.new(params[:name1])
    $player_2 = Player.new(params[:name2])
    session[:health1] = 100
    session[:health2] = 100
    redirect '/play'
  end

  get '/play' do
    @warrior1 = $player_1.name
    @warrior2 = $player_2.name
    @warrior1_health = $player_1.health
    @warrior2_health = $player_2.health
    erb(:play)
  end

  get '/attack2' do
    $player_1.attack($player_2)
    @attacker = $player_1.name
    @defender = $player_2.name
    erb(:confirmation)
  end

  get '/attack1' do
    $player_2.attack($player_1)
    @defender = $player_1.name
    @attacker = $player_2.name
    erb(:confirmation)
  end

  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
