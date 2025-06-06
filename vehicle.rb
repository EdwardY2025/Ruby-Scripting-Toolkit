#Edward Yeboah
#SBU ID: 114385084
#netid: eyeboah
#CSE/ISE 337 Homework 2

#!/usr/bin/env ruby


#represents a generic vehicle with common attributes
# tracks total # of vehicles created across all subclasses
class Vehicle
  # attributes for year, model, color, and speed
  attr_accessor :year, :model, :color, :current_speed
  #class variable to track total vehicles created
  @@number_of_vehicles = 0

  #Initializes a new vehicle with year, model, and color
  # Sets intiial speed to 0 and increments vehicle count
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  # Increases vehicle speed by given amount
  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end
  #Decreases speed by given amount
  def brake(number)
    @current_speed -= number
    puts "You push the gas and decelerate #{number} mph."
  end
  #Prints current speed
  def current_speed
    puts "You are going #{@current_speed} mph."
  end
  #Stops the vehicle completely
  def shut_down
    @current_speed = 0
    puts "Let's park the #{self.class.to_s.downcase}!"
  end
  #Changes vehicle color
  def spray_paint(new_color)
    @color = new_color
    puts "Your new #{@color} paint job looks great!"
  end
  #Calculates and displays miles per gallon
  def gas_mileage(miles, gallons)
    mileage =  (miles / gallons.to_f).ceil
    puts "#{mileage} miles per gallon of gas"
  end
  #Class method to display total vehicles created
    def self.total_vehicles
      puts "Total vehicles: #{@@number_of_vehicles}"
    end
  end

#module for vehicles that can tow heavy loads
module Towable
  #Checks if vehicle can tow a given weight
  def can_tow?(pounds)
    pounds < 2000
  end
  #Activates stability control for towing
  def stability_control
    puts "Activating towing stability control for hauling..."
  end
end
#module for self driving capabilities
module SelfDriving
  #Turns on auto pilot mode
  def engage_autopilot
    @autopilot = true
    puts "Autopilot engaged."
  end
  #turns off auto pilot mode
  def disengage_autopilot
    @autopilot = false
    puts "Autopilot disengaged."
  end
end
#activates stability control
  def stability_control
    puts "Activating lane-centering stability control for autopilot..."
  end

#Represents a user's car
class MyCar < Vehicle
  include Towable

  NUMBER_OF_DOORS = 4

  def to_s
    "My Car is a #{@color}, #{@year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{@color}, #{@year}, #{@model}!"
  end
end

# Initializes with battery charge level (default: 100%)
def initialize(year, model, color, battery_charge = 100)
  super(year, model, color)  # Calls parent class constructor
  @battery_charge = battery_charge
end

# Overrides speed_up to account for battery usage
def speed_up(number)
  if @battery_charge <= 0
    puts "Battery is dead. Cannot accelerate."
    return
  end
  super(number)  # Calls original speed_up method
  @battery_charge -= 10
  puts "Battery decreased by 10%."
end

# Displays current battery level
def current_battery
  puts "Battery level: #{@battery_charge}%"
end

# Fully recharges the battery
def charge_battery
  @battery_charge = 100
  puts "Battery fully charged!"
end

# Overrides shut_down to handle autopilot disengagement
def shut_down
  if defined?(@autopilot) && @autopilot
    puts "Disengaging and terminating self-driving services!"
    disengage_autopilot
  elsif defined?(@autopilot)
    puts "Terminating self-driving services!"
  end
  super  # Calls original shut_down method
  puts "Shutting down the battery-powered motor!"
end



# Demonstration code showing class usage
lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina
lumina.speed_up(20)
lumina.current_speed
lumina.brake(10)
lumina.current_speed
lumina.shut_down

tesla = ElectricCar.new(2021, 'Tesla Plaid', 'blue', 80)
puts tesla
tesla.current_battery
tesla.speed_up(30)
tesla.current_speed
tesla.current_battery
tesla.engage_autopilot
tesla.shut_down

Vehicle.total_vehicles
