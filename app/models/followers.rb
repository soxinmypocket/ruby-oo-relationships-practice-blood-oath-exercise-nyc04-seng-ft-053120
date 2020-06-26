
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
        BloodOath.new(cult,self)
        self.cults.push(cult)
    end
    def self.all
        @@all
    end
    def self.of_a_certain_age(age)
        self.all.select{|followers|followers.age >= age}
    end


end