module PrintGrid
  def self.print(player_1_char, player_2_char, grid)
    puts "\n\n\n\n\nPlayer 1: #{player_1_char}"
    puts "Player 2: #{player_2_char}"
    puts "\n\n-----"
    puts grid
    puts "-----\n\n"
  end
end