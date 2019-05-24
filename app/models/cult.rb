class Cult

    attr_accessor :name, :location, :slogan, :founding_year
    attr_reader :blood_oaths, :followers

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
            if locations.count(location) > max
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