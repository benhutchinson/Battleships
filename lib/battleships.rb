require 'sinatra/base'

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
    session[:me] = @name
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
    erb :choice
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
