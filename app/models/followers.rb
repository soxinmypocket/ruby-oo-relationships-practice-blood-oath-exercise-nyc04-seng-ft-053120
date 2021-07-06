class Follower
    attr_accessor :cults, :age
    attr_reader :name, :life_motto
    @@all = []
    def initialize(name, age, life_motto)
        @name = name 
        @age = age 
        @cults = []
        @life_motto = life_motto 
        @@all << self 
    end
    #takes in an argument of a Cult instance and adds this follower to the cult's list of followers
    def join_cult(cult)
        
        if !BloodOath.all.find {|blood_oaths| blood_oaths.cult == cult && blood_oaths.follower == self }
            if(self.age>=cult.minimum_age)
                BloodOath.new(cult, self)
                 self.cults.push(cult)
            else
                "Sorry You're too young to join this cult"
            end
    else 
        "You are already part of #{cult.name}."
        end 
    end
    def self.all
        @@all
    end
    #takes an Integer argument that is an age and returns an Array of followers who are the given age or older
    def self.of_a_certain_age(age)
        self.all.select { |follower_instance| follower_instance.age >= age }
    end
    #prints out all of the slogans for this follower's cults
    def my_cults_slogans
        puts self.cults.map { |cults| cults.slogan}
    end
    #returns the Follower instance who has joined the most cults
    def self.most_active
        all_cults = self.all.map { |followers| followers.cults}
        max_cults = all_cults.max_by { |cities| all_cults.count(cities)}
        self.all.find { |followers| followers.cults = max_cults}
    end
    #returns an Array of followers; they are the ten most active followers
    def self.top_ten
       sorted_top = self.all.sort_by { |followers| followers.cults.count}.reverse 
        sorted_top[0..9]
    end
    #returns a unique Array of followers who are in the same cults as you
    def fellow_cult_members
        self.cults.map{|follower_cults|
        self.class.all.select {|followers| followers.cults.include?(follower_cults)}}.flatten.uniq
    end

end