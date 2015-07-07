require 'models/robot_manager'

class RobotManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/robots' do
    @robots = RobotManager.all
    erb :index
  end
end
