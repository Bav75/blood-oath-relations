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