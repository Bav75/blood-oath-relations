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