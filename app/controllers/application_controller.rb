require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect "/account"
    else
      erb :error
    end
  end

  get '/account' do
<<<<<<< HEAD
    if session[:user_id]
      @session = session
      erb :account
    else
      erb :error
    end
=======
    erb :account
>>>>>>> 5fa239f21c60bcf4cc5a9817821c314ed9e90124
  end

  get '/logout' do
    session.clear
<<<<<<< HEAD
    redirect "/"
=======
>>>>>>> 5fa239f21c60bcf4cc5a9817821c314ed9e90124
  end


end

