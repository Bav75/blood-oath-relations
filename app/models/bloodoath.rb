require "date"

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