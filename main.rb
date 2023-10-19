# Open the file
# Decide whether to read the whole file or line by line.... maybe convert each file to an array of lines?
# I don't want to rebuild the wheel on this so I might as well have it parse every line and then figure out how to use the stuff I want and ignore the rest... so not just quest xp... but also faction and anything else that might be useful...
#separate each function into an array

#am I eventually going to want each of the functions to be a class with .faction and .rewards properties? hmmm maybe but I'm not sure I want things grouped that way... I want to be able to call all the quests that hit a certain faction for example.. so maybe faction needs to be its own class?

#As I think about it more I think quests are there own class and faction is its own class

#Faction with each faction as an instantiated object. Has properties of id #, quests that impact it and by how much, mobs that impact it, and by how much

#Quests is class with each quest... one QuestReward per quest... that's how to delineate quest? Some way to link related quests maybe?

require "./find_functions.rb"
require "./parse_function.rb"

file = File.open("./Beno_Targnarle.lua")
lines = file.readlines
file.close

test = parse_function(lines, find_functions(lines), 1)
