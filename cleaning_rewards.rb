def cleaning_rewards(contains_rewards)
  index_one = 0
  cleaned_up_quest = []
  while index_one < contains_rewards.length
    index_two = 0
    while index_two < contains_rewards[index_one].length
      quest = contains_rewards[index_one][index_two]
      quest = math_random(quest)
      quest = choose_random(quest)
      quest = delete_beginning(quest)
      quest = delete_ending(quest)
      quest = split_quest_rewards(quest)
      cleaned_up_quest << quest
      index_two += 1
    end
    index_one += 1
  end
  return cleaned_up_quest
end

# This function should get rid of all the "math.random" items from the lines of quest rewards
def math_random(quest)
  if quest.include?("math.random") == true
    i = 0
    while quest.index("math.random") != nil
      index_math = quest.index("math.random")
      index_left_parens = quest.index("(", index_math)
      index_right_parens = quest.index(")", index_math)
      string_to_be_replaced = quest.slice(index_math..index_right_parens)
      numbers = quest.slice(index_left_parens + 1..index_right_parens - 1).strip
      if numbers.include?(",")
        numbers_split = numbers.split(",")
        numbers_split[0] = numbers_split[0].strip
        numbers_split[1] = numbers_split[1].strip
        replacement_string = "Random number between #{numbers_split[0]} and #{numbers_split[1]}"
      else
        replacement_string = "Random number between 1 and #{numbers}"
      end
      quest.slice!(index_math..index_right_parens)
      quest.insert(index_math, replacement_string)
      i += 1
    end
  end
  return quest
end

def choose_random(quest)
  if quest.include?("eq.ChooseRandom") == true
    i = 0
    while quest.index("eq.ChooseRandom") != nil
      index_choose_random = quest.index("eq.ChooseRandom")
      index_left_parens = quest.index("(", index_choose_random)
      index_right_parens = quest.index(")", index_choose_random)
      string_to_be_replaced = quest.slice(index_choose_random..index_right_parens)
      numbers = quest.slice(index_left_parens + 1..index_right_parens - 1).strip
      if numbers.include?(",")
        numbers_split = numbers.split(",")
        index = 0
        item_numbers = ""
        while index < numbers_split.length
          item_number = "#" + numbers_split[index].strip
          item_numbers += item_number + " "
          index += 1
        end
        replacement_string = "A random item is chosen among these item #s: " + item_numbers
      else
        replacement_string = "A random item is chosen among item #s: #{numbers}"
      end
      quest.slice!(index_choose_random..index_right_parens)
      quest.insert(index_choose_random, replacement_string)
      i += 1
    end
  end
  return quest
end

def delete_beginning(quest)
  phrase_to_replace = "e.other:QuestReward(e.self"
  index_beginning = quest.index(phrase_to_replace)
  index_end = index_beginning + phrase_to_replace.length
  quest.slice!(index_beginning..index_end)
  return quest
end

def delete_ending(quest)
  characters_to_find = ");"
  index_beginning = quest.index(characters_to_find)
  index_end = quest.length - 1
  quest.slice!(index_beginning..index_end)
  return quest
end

def split_quest_rewards(quest)
  quest = quest.split(",")
  index = 0
  while index < quest.length
    quest[index] = quest[index].strip
    index += 1
  end
  return quest
end
