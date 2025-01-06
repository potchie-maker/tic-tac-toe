module Choices
  def self.choose_char
    user_in = gets.chomp
    return false if user_in.match?(/^[xo]$/i) == false
    user_in.upcase
  end

  def self.get_choice
    choice = self.choose_char
    if choice == false
      puts "Enter valid character (x, X, o, O)"
      get_choice
    else
      choice
    end
  end

  def self.set_player_2_char(player_1_char)
    if player_1_char == 'X'
      player_2_char = 'O'
    else
      player_2_char = 'X'
    end
    player_2_char
  end

  def self.choose_spot(grid)
    numbs = '123456789'
    num_arr = grid.chars.select { |char| numbs.include?(char) }
    user_in = gets.chomp
    return false unless ((user_in =~ /^[1-9]$/) && (num_arr.include?(user_in)))
    user_in
  end

  def self.get_spot(grid)
    choice = self.choose_spot(grid)
    if choice == false
      puts "Enter valid character (one of the remaining number spots)"
      get_spot(grid)
    else
      choice
    end
  end

# No longer needed due to project only needing human players

  # def get_cpu_choice(string)
  #   numbs = '123456789'
  #   num_arr = string.chars.select { |char| numbs.include?(char) }
  #   cpu_choice = num_arr.sample
  #   cpu_choice
  # end
end