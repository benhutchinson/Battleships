require 'sinatra/base'
require_relative './battleships'

class Battleships < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions

  GAME = Game.new

  get '/' do
    'Hello Battleships!'
    erb :index
  end

  get '/namequestion' do
    erb :form
  end

  post '/hiya' do
    @name = params[:your_name]
    GAME.add_player(@name)
    session[:game] = GAME
    session[:me] = @name
    p GAME.players.count
    p session
    if GAME.players.count == 2
      erb :form
    else
      erb :waiting
    end
  end

  post '/coord_selection' do 
    @co_ord_x = params[:x_co_ordinate]
    @co_ord_y = params[:y_co_ordinate]
    @orientation = params[:orientation]
    @player_name = session[:me]



    # @data_array = [[1,2,3,4],[5,6,7,8],['a','b','c','d'],['a','b','c','d']]
    # @row_headers = [1,2,3,4]
    # @column_headers = ['a','b','c','d']
    session[:game].current_player.board.place_ship(@co_ord_x.to_i, @co_ord_y.to_i, 2)
    @data_array = session[:game].current_player.board.show_data
     @row_headers = (0..(SIZE-1)).to_a
     @column_headers = (0..(SIZE-1)).to_a
Í

    erb :choice
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
