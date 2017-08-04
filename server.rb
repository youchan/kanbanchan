require 'sinatra'
require 'opal'
require 'sinatra/activerecord'

if development?
  require 'sinatra/reloader'
end

class Server < Sinatra::Base
  OPAL = Opal::Server.new do |server|
    server.append_path 'app'
    server.append_path 'assets'
    Opal.use_gem 'hyalite'
    Opal.use_gem 'menilite'
    Opal.use_gem 'opal-drb'
    Opal.paths.each {|path| server.append_path path }

    server.main = 'application'
  end

  configure do
    set opal: OPAL
    enable :sessions
  end

  get '/' do
    erb :index
  end

  get "/favicon.ico" do
  end
end

