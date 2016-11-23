require 'sinatra/base'

class Battle < Sinatra::Base
  post '/names' do
    @warrior1 = params[:name1]
    @warrior2 = params[:name2]
    erb(:play)
  end

  get '/' do
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
