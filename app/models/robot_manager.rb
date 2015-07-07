require 'yaml/store'
require 'models/robot'

class RobotManager

  attr_reader :database

  def self.database
    @database ||= YAML::Store.new('db/robots')
  end

  def self.all
    database.transaction do
      database['robots'] || []
    end
  end

end
