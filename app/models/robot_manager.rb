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

  def self.find(id)
    self.all.find { |robot| robot[:id].eql?(id.to_i) }
  end

  def self.next_id
    self.all.sort_by { |k, v| k[:id] }.last[:id] + 1
  end

  def self.create(args)
    database.transaction do
      database['robots'] << {
        id:         args[:id].to_i,
        name:       args[:name],
        city:       args[:city],
        state:      args[:state],
        avatar:     args[:avatar],
        birthdate:  args[:birthdate],
        date_hired: args[:date_hired],
        department: args[:department]
      }
    end
  end

  def self.update(args)
    database.transaction do
      robot        = database['robots'].find { |robot| robot[:id].eql?(args[:id].to_i) }
      robot[:name] = args[:name]
      robot[:city] = args[:city]
      robot[:state] = args[:state]
      robot[:avatar] = args[:avatar]
      robot[:birthdate] = args[:birthdate]
      robot[:date_hired] = args[:date_hired]
      robot[:department] = args[:department]
      robot
    end
  end
end
