# Open the file
# Stores each line of the file into an array called lines
# Use the find_sections method to return a two dimensional array. Each inner array returns the index of the start line and end line of a function within the designated file. This is then stored in section_bounds.


require "./find_sections.rb"
require "./parse_each_section.rb"
require "./cleaning_rewards.rb"
require "./find_rewards.rb"

file = File.open("./Beno_Targnarle.lua")
lines = file.readlines
file.close
section_bounds = find_sections(lines) #Two-dimensional array. Paired values which represent the beginning and ending index of chunks of code in lines.
contains_rewards = find_rewards(lines, section_bounds)
rewards = cleaning_rewards(contains_rewards)
system("clear")
puts "The reward for quest 1 is #{rewards[0][0]} platinum, #{rewards[0][1]} gold, #{rewards[0][2]} silver, #{rewards[0][3]} copper, Items: #{rewards[0][4]}, and #{rewards[0][5]} points xp."