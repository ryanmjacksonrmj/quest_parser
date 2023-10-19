# e.other:Faction(e.self,312, 10); -- Storm Guard
# e.other:QuestReward(e.self,0,0,math.random(5),0,eq.ChooseRandom(13036,1051,13003,13002,10015,13009),4200); -- verified live xp
# Above are samples of the source file I need to be able to parse.
# This function needs input from the find_functions function first. The array returned by that function is the parameter array for this function and the array_index is the index for that array as well.

def parse_function(lines, array, array_index)
  this_function = lines.slice(array[array_index][0], array[array_index][1])
  index = 0
  quest_indexes = []
  quest_reward_found = false #Eventually I'll probably want to test to see if there is no quest reward then I can probably skip the function... well no quest reward and no faction change.
  # faction_change = false Nothing about this is incorporated into the code yet
  while index < this_function.length
    line = this_function[index].strip
    if line.include?("QuestReward")
      quest_indexes << index
      quest_reward_found = true
    end
    index += 1
  end
  pp quest_indexes #This is an array that has the index of the this_function array that have the QuestReward string on them.
end
