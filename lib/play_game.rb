require_relative 'logic/choices'
require_relative 'logic/find_winner'
require_relative 'logic/print_grid'

module PlayGame
  def self.round(player_1_char, player_2_char, grid)
    PrintGrid.print(player_1_char, player_2_char, grid)
    puts "Player 1, make your choice."
    player_1_spot = Choices.get_spot(grid)
    grid = grid.gsub(player_1_spot, player_1_char)
    PrintGrid.print(player_1_char, player_2_char, grid)

    if FindWinner.won(grid)[:won] == false && FindWinner.won(grid)[:tie] == false
      puts "Player 2, make your choice."
      player_2_spot = Choices.get_spot(grid)
      grid = grid.gsub(player_2_spot, player_2_char)
      PrintGrid.print(player_1_char, player_2_char, grid)
    end

    status = FindWinner.won(grid)

    if status[:won] == false && status[:tie] == false
      round(player_1_char, player_2_char, grid)
    else
      status
    end
  end

  def self.play
    grid = "1 2 3\n4 5 6\n7 8 9"

    puts "Player 1, choose X or O"
    player_1_char = Choices.get_choice
    player_2_char = Choices.set_player_2_char(player_1_char)
    
    result = round(player_1_char, player_2_char, grid)

    if result[:winning_char] == player_1_char
      winner = 'PLAYER 1'
    else
      winner = 'PLAYER 2'
    end

    case
    when result[:won]
      puts "\n#{winner} HAS WON THE MATCH!\n\n"
    when result[:tie]
      puts "\nNo one won this match\n\n"
    end
  end
end