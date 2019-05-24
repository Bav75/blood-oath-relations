require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

class Cult

  attr_accessor :name, :location, :slogan, :founding_year, :followers

  @@all = []

  def initialize(name, location, slogan, founding_year)
      @name = name
      @location = location
      @slogan = slogan
      @founding_year = founding_year

      @followers = [] 

      @@all << self 
  end

  def recruit_follower(initiation_date, follower)
      bloodoath = BloodOath.new(initiation_date, self, follower)
      @followers << follower
  end

  def cult_population
      @followers.count
  end

  def self.find_by_name(name)
      @@all.detect {|cult| cult.name == name}
  end
  
  def self.find_by_location(location)
      @@all.detect {|cult| cult.location == location}
  end

  def self.find_by_founding_year(founding_year)
      @@all.detect {|cult| cult.founding_year == founding_year}
  end

  def self.all
      @@all
  end

end

class Follower

  attr_accessor :name, :age, :life_motto, :cults

  @@all = []

  def initialize(name, age, life_motto)
      @name = name
      @age = age
      @life_motto = life_motto

      @cults = []

      @@all << self 
  end

  def join_cult(initiation_date, cult)
      bloodoath = BloodOath.new(initiation_date, cult, self)
      @cults << cult
  end

  def self.all
      @@all
  end

  def self.of_a_certain_age(age)
      @@all.select {|follower| follower.age >= age}
  end

end

class BloodOath

  attr_accessor :date, :cult, :follower

  @@all = []

  #BloodOath initializes with the date it was started 
  def initialize(date, cult, follower)
      @date = date
      @cult = cult
      @follower = follower
      @@all << self 
  end

  #returns all instances of BloodOaths
  def self.all
      @@all
  end

end

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
