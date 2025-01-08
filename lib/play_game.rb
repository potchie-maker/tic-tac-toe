require_relative 'logic/choices'
require_relative 'logic/find_winner'
require_relative 'logic/print_grid'

module PlayGame
  def self.round(player_1_char, player_2_char, grid)
    PrintGrid.print(player_1_char, player_2_char, grid)
    puts "Player 1, make your choice."
    player_1_spot = Choices.get_spot(grid)
    grid = grid.gsub(player_1_spot, player_1_char)

    status = FindWinner.won(grid)
    if status[:won] || status[:tie]
      PrintGrid.print(player_1_char, player_2_char, grid)
      return status
    end

    PrintGrid.print(player_1_char, player_2_char, grid)
    puts "Player 2, make your choice."
    player_2_spot = Choices.get_spot(grid)
    grid = grid.gsub(player_2_spot, player_2_char)

    status = FindWinner.won(grid)
    if status[:won] || status[:tie]
      PrintGrid.print(player_1_char, player_2_char, grid)
      return status
    end

    round(player_1_char, player_2_char, grid)
  end

  def self.play
    grid = "1 2 3\n4 5 6\n7 8 9"

    puts "Player 1, choose X or O"
    player_1_char = Choices.get_choice
    player_2_char = Choices.set_player_2_char(player_1_char)
    
    result = round(player_1_char, player_2_char, grid)

    winner = result[:winning_char] == player_1_char ? 'PLAYER 1' : 'PLAYER 2'

    if result[:won]
      puts "\n#{winner} HAS WON THE MATCH!\n\n"
    elsif result[:tie]
      puts "\nNo one won this match\n\n"
    end
  end
end