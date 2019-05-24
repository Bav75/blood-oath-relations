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
        blood_oaths.select {|blood_oath| blood_oath.cult}
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

