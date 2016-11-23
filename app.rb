require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/:names' do
    $player_1 = Player.new
    $player_2 = Player.new
    $player_1.name=(params[:player_1_name])
    $player_2.name=(params[:player_2_name])
    session[:player_2_hp] = 60
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_2_hp = session[:player_2_hp]
    erb :play
  end

  get '/attack' do
    erb :attack
  end
  run! if app_file == $0
end
