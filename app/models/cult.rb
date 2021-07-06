class Cult
    attr_reader :name, :location, :founding_year, :slogan ,:minimum_age
    @@all = []
    def initialize(name, location, founding_year, slogan,minimum_age)
        @name = name 
        @location = location 
        @founding_year = founding_year
        @slogan = slogan 
        @@all << self 
        @minimum_age=minimum_age
    end
    #takes in an argument of a Follower instance and adds them to this cult's list of followers
    def recruit_follower(follower)
        if !BloodOath.all.find {|blood_oaths| blood_oaths.cult == self && blood_oaths.follower == follower }
            if(follower.age>=self.minimum_age)
                BloodOath.new(self, follower)
                follower.cults.push(self)
            else
                "Sorry You're too young to join this cult"
            end
        else 
        "#{follower.name} is part of this cult."
        end 
    end
    #helper method that gets all the members of the this cult
    def cult_blood_oaths
        BloodOath.all.select { |current_cult| current_cult.cult == self }
    end
    #second helper method
    def cult_members
        self.cult_blood_oaths.map{ |followers| followers.follower}
    end
    #returns an Integer that is the number of followers in this cult
    #we are using a help method 'cult_blood_oaths' put self b/c class is calling the method
    def cult_population
        self.cult_blood_oaths.count 
    end
    def self.all
        @@all 
    end
    #takes a String argument that is a name and returns a Cult instance whose name matches that argument
    def self.find_by_name(name)
        self.all.find { |cult| cult.name == name }
    end
    #akes a String argument that is a location and returns an Array of cults that are in that location
    def self.find_by_location(place)
        self.all.select { |locations| locations.location == place }
    end
    #takes an Integer argument that is a year and returns all of the cults founded in that year
    def self.find_by_founding_year(num)
        self.all.select { |year| year.founding_year == num}
    end
    #returns a Float that is the average age of this cult's followers
    def average_age
        self.cult_members.reduce(0) { |sum, members| sum += members.age }/self.cult_population
    end
    #prints out all of the mottos for this cult's followers
    def my_followers_mottos
        puts "These are the mottos: "
        puts self.cult_members.map { |followers| puts followers.life_motto}
    end
    #returns the Cult instance who has the least number of followers :(
    def self.least_popular
        self.all.map { |cults| cults.cult_population}.min
    end
    #returns a String that is the location with the most cults
    def self.most_common_location
       all_locations = self.all.map { |cults| cults.location }
       all_locations.max_by { |cities| all_locations.count(cities)}
       #all_locations.group_by(&:to_s).values.max_by(&:size).uniq.join()
    end
end