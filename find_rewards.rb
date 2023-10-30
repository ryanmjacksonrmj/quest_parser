def find_rewards(lines, section_bounds)
  index = 0
  while index < section_bounds.length
    current_section = parse_each_section(lines, section_bounds, index)
    contains_rewards = []
    if current_section != nil
      contains_rewards << current_section #This creates an array of arrays
    end
    index += 1
  end
  return contains_rewards
end