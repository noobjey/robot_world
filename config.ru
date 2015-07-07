Bundler.require

# http://stackoverflow.com/questions/837123/adding-a-directory-to-load-path-ruby
$:.unshift File.dirname(__FILE__) + '/app'

require 'controllers/robot_manager_app'

run RobotManagerApp
