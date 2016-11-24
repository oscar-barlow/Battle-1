require 'sinatra/base'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions
  configure(:development) { set :session_secret, "secret" }


  post '/names' do
    player_1 = Player.new(params[:name1])
    player_2 = Player.new(params[:name2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @warrior1 = $game.player1
    @warrior2 = $game.player2
    erb(:play)
  end

  get '/end_turn' do
    $game.switch_active_player
    redirect '/play'
  end

  get '/attack2' do
    @attacker = $game.player1
    @defender = $game.player2
    $game.attack($game.player2)
    erb(:confirmation)
  end

  get '/attack1' do
    @attacker = $game.player2
    @defender = $game.player1
    $game.attack($game.player1)
    erb(:confirmation)
  end

  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
