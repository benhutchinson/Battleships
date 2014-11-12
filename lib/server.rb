require 'sinatra/base'
require_relative './battleships'

class Battleships < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions

  get '/' do
    'Hello Battleships!'
    erb :index
  end

  get '/namequestion' do
    erb :form
  end

  post '/hiya' do
    @name = params[:your_name]
    @game = Game.new(@name)
    session[:game] = @game
    session[:me] = @name
    p session
    if @name != ''
      erb :form
    else
      erb :error
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
     @row_headers = (0..9).to_a
     @column_headers = (0..9).to_a


    erb :choice
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
