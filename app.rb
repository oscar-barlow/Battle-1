require 'sinatra/base'
require_relative 'lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions
  configure(:development) { set :session_secret, "secret" }


  post '/names' do
    $player_1 = Player.new(params[:name1])
    $player_2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @warrior1 = $player_1
    @warrior2 = $player_2
    #@warrior1_health = $player_1.health
    #@warrior2_health = $player_2.health
    erb(:play)
  end

  get '/attack2' do
    @attacker = $player_1
    @defender = $player_2
    @attacker.attack(@defender)
    erb(:confirmation)
  end

  get '/attack1' do
    @attacker = $player_2
    @defender = $player_1
    @attacker.attack(@defender)
    erb(:confirmation)
  end

  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
