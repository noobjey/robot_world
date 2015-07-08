require 'models/robot_manager'

class RobotManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/robots' do
    @robots = RobotManager.all
    erb :index
  end

  get '/robots/new' do
    @next_id = RobotManager.next_id
    erb :new
  end

  get '/robots/:id' do
    @robot = RobotManager.find(@params['id'])
    erb :robot
  end

  post '/robots' do
    RobotManager.create(@params)
    redirect "/robots/#{@params[:id]}"
  end

  get '/robots/:id/edit' do
    @robot = RobotManager.find(@params['id'])
    erb :edit
  end

  put '/robots' do
    RobotManager.update(@params)
    redirect "/robots/#{@params[:id]}"
  end
end
