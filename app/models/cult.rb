require "pry"
class Cult
    attr_reader :name , :location , :founding_year, :slogan
    @@all=[]

    def initialize(name,location,founding_year,slogan)
        @name=name
        @location=location
        @founding_year=founding_year
        @slogan=slogan
        @@all<<self
    end
    def recruit_follower(follower)
        if !BloodOath.all.find {|blood_oaths| blood_oaths.cult == self && blood_oaths.follower == follower }
            BloodOath.new(self, follower)
            follower.cults.push(self)
            else 
            "#{follower.name} is part of this cult."
            end 
    end
    def cult_population
        BloodOath.all.select{|blood_oaths| blood_oaths.cult==self }.count
    end
    def self.all
        #binding.pry
        @@all
    end
    def self.find_by_name(cult)
        binding.pry
        self.all.find{|cults| cults.name==cult}
    end
    def self.find_by_location(location)
        self.all.select{|cults|cults.location==location}

    end
    def self.find_by_founding_year(year)
        self.all.select{|cults|cults.founding_year==year}
    end




end