# Open the file
# Decide whether to read the whole file or line by line.... maybe convert each file to an array of lines?
# I don't want to rebuild the wheel on this so I might as well have it parse every line and then figure out how to use the stuff I want and ignore the rest... so not just quest xp... but also faction and anything else that might be useful...
#separate each function into an array

file = File.open("./Beno_Targnarle.lua")
lines = file.readlines
file.close

def find_functions(lines)
  function_lines = []
  index = 0
  expecting_ends = 0
  within_function = false
  while index < lines.length
    if lines[index].strip.start_with?("function") == true
      function_start = index
      within_function = true
      expecting_ends += 1
    elsif lines[index].strip.start_with?("if") == true
      expecting_ends += 1
    elsif lines[index].strip.start_with?("end") == true
      if within_function == true && expecting_ends == 1
        function_end = index
        function_bounds = [function_start, function_end]
        function_lines << function_bounds
        within_function = false
        expecting_ends = 0
      else
        expecting_ends -= 1
      end
    end
    index += 1
  end
  return function_lines
end

pp find_functions(lines)

