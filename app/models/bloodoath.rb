require "pry"
# require "date"
class BloodOath
    attr_reader  :initiation_date, :cult, :follower
    @@all = []
    def initialize(cult,follower)
        @cult = cult
        @follower = follower
        @initiation_date = Time.now
        @@all << self
    end
    def self.all
        @@all
    end
    def self.first_oath
        
        self.all[0].follower
    end
end
