
class Follower
    attr_reader :name, :age, :life_motto
    attr_accessor :cults
    @@all=[]
    def initialize(name,age,life_motto)
        @name=name
        @age=age
        @life_motto=life_motto
        @@all<<self
        @cults=[]
    end
    def join_cult(cult)
        if !BloodOath.all.find {|blood_oaths| blood_oaths.cult == cult && blood_oaths.follower == self }
            BloodOath.new(cult, self)
            self.cults << cult 
        else 
            "You are already part of #{cult.name}."
            end 
    end
    def self.all
        @@all
    end
    def self.of_a_certain_age(age)
        self.all.select{|followers|followers.age >= age}
    end


end