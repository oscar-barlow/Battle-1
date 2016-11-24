require 'sinatra/base'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions
  configure(:development) { set :session_secret, "secret" }


  post '/names' do
    $player_1 = Player.new(params[:name1])
    $player_2 = Player.new(params[:name2])
    $game = Game.new($player_1, $player_2)
    redirect '/play'
  end

  get '/play' do
    @warrior1 = $player_1
    @warrior2 = $player_2
    erb(:play)
  end

  get '/attack2' do
    @attacker = $player_1
    @defender = $player_2
    $game.attack($player_2)
    erb(:confirmation)
  end

  get '/attack1' do
    @attacker = $player_2
    @defender = $player_1
    $game.attack($player_1)
    erb(:confirmation)
  end

  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
