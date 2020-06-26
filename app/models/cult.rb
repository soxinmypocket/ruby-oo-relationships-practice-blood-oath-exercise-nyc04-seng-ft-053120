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
        BloodOath.new(self,follower)
        Follower.all.each{|followers|
        if(followers==follower)
        followers.cults.push(self)
        end
    }
    end
    def cult_population
        Follower.all.select{|followers| followers.cults.include?(self)}.count
    end
    def self.all
        #binding.pry
        @@all
    end
    def self.find_by_name(cult)
        Cult.all.find{|cults| cults.name==cult}
    end
    def self.find_by_location(location)
        self.all.select{|cults|cults.location==location}

    end
    def self.find_by_founding_year(year)
        self.all.select{|cults|cults.founding_year==year}
    end




end