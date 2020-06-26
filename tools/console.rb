require "pry"
require_relative '../config/environment.rb'
# require_relative '../app/models/cult.rb'
# require_relative '../app/models/followers.rb'
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



puts "Mwahahaha!" # just in case pry is buggy and exits
c1=Cult.new("Mafia","NYC",1930,"You'll die")
c2=Cult.new("Cosanostra","NYC",1936,"You'll do too")
c3=Cult.new("Naragastra","Sicily",1942,"Maybe not")
c4=Cult.new("AstoriaGang","Astoria",2020,"We'll become monks soon")

f1=Follower.new("Bob",12,"No Rules")
f2=Follower.new("Jimmy",18,"Try everything")
f3=Follower.new("Jessica",21,"YOLO")
f4=Follower.new("Karen",100,"Call the manager")


c1.recruit_follower(f1)
c2.recruit_follower(f1)
c1.recruit_follower(f3)


f4.join_cult(c3)
binding.pry