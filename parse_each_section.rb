# This takes a block of code and returns an array of lines that contain a QuestReward.

def parse_each_section(lines, section_bounds, index_section_bounds)
  this_section = lines.slice(section_bounds[index_section_bounds][0], section_bounds[index_section_bounds][1])
  index = 0
  reward_line = []
  has_reward = false
  while index < this_section.length
    line = this_section[index].strip
    if line.include?("QuestReward")
      reward_line << line
      has_reward = true
    end
    index += 1
  end
  if has_reward == true
    return reward_line
  else
    return nil
  end
end
