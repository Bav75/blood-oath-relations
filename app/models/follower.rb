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