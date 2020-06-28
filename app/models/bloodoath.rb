class BloodOath
    attr_reader :initiation_date, :cult, :follower
    @@all = []
    def initialize(cult, follower)
        @initiation_date = Time.now.to_s.split[0]
        @cult = cult
        @follower = follower 
        @@all << self 
    end
    #returns an Array of all the blood oaths
    def self.all
        @@all 
    end
    def self.first_oath
        self.all[0].follower
    end
end