# This function takes in the lines of a file and returns an array with the beginning and end line numbers (by index of the array!) for each function.

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
