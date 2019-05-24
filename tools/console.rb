require_relative '../config/environment.rb'
require "date"

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

class Cult

  attr_accessor :name, :location, :slogan, :founding_year
  attr_reader :blood_oaths

  @@all = []

  def initialize(name, location, slogan, founding_year)
      @name = name
      @location = location
      @slogan = slogan
      @founding_year = founding_year
      @@all << self 
  end

  def recruit_follower(initiation_date, follower)
      BloodOath.new(initiation_date, self, follower)
  end

  def blood_oaths
      BloodOath.all.select {|blood_oath| blood_oath.cult == self}
  end

  def followers
      blood_oaths.map {|blood_oath| blood_oath.follower}
  end

  def cult_population
      blood_oaths.count
  end

  def average_age
      #get the followers ages in an array
      ages = followers.map {|follower| follower.age}
      average = (ages.sum / cult_population).to_f
  end

  def my_followers_mottos
    followers.each {|follower| puts "#{follower.life_motto}"}
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

  def self.least_popular
    min = @@all[0].cult_population
    least_popular = nil

    @@all.each do |cult|
        if cult.cult_population < min
            min = cult.cult_population
            least_popular = cult
        end
    end
    least_popular
  end

  def self.most_common_location
      locations = @@all.map {|cult| cult.location}
      max = 0
      most_common = ""
      locations.each do |location|
          if (locations.count(location) > max)
              max = locations.count(location)
              most_common = location
          end
      end
      most_common
  end

  def self.all
      @@all
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

  def self.first_oath
    min = Date.parse(@@all[0].date)
    first_oath = nil

    @@all.each do |bloodoath|
        if Date.parse(bloodoath.date) < min
            min = Date.parse(bloodoath.date)
            first_oath = bloodoath
        end
    end
    first_oath
  end

end

class Follower

  attr_accessor :name, :age, :life_motto
  attr_reader :blood_oaths 

  @@all = []

  def initialize(name, age, life_motto)
      @name = name
      @age = age
      @life_motto = life_motto
      @@all << self 
  end

  def join_cult(initiation_date, cult)
      bloodoath = BloodOath.new(initiation_date, cult, self)
  end

  def blood_oaths
      BloodOath.all.select {|blood_oath| blood_oath.follower == self}
  end

  def cults
      blood_oaths.map {|blood_oath| blood_oath.cult}
  end

  def my_cults_slogans
    cults.each {|cult| puts "#{cult.slogan}"}
  end

  def self.most_active
    max = 0
    most_active = nil 

    @@all.each do |follower|
        if follower.cults.count > max 
            max = follower.cults.count
            most_active = follower
        end
    end
    most_active
  end

  def self.top_ten
    top_ten = @@all.sort_by {|follower| follower.cults.count}
    top_ten.reverse
  end
  
  def self.all
      @@all
  end

  def self.of_a_certain_age(age)
      @@all.select {|follower| follower.age >= age}
  end

end

follower1 = Follower.new("Bob", 22, "YOLO")
follower2 = Follower.new("Jim", 26, "ABC - always be coding")
follower3 = Follower.new("Tom", 28, "yeah buddy!")
illuminati = Cult.new("The Illuminati", "Berlin", "It's lit", 1600)
illuminate = Cult.new("The Illuminate", "Berlin", "It's lit", 1600)
illumi = Cult.new("The Illumi", "Berlin", "It's lit", 1600)
heavens_gate = Cult.new("Heaven's Gate", "San Diego", "Dank cult stuff", 1974)
heavens_fate = Cult.new("Heaven's Fate", "San Diego", "Dank cult stuff", 1974)

date1 = "2019-05-29"
date2 = "2018-05-29"

follower1.join_cult(date1, illuminati)
follower2.join_cult(date2, illuminati)
follower3.join_cult(date2, heavens_gate)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
