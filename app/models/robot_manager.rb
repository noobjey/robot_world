require 'yaml/store'
require 'models/robot'

class RobotManager

  def self.all
    [Robot.new({id: 1}), Robot.new({id: 2}), Robot.new({id: 3})]
  end

end
