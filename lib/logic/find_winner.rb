module FindWinner
# Shows the index of the digits in the grid

# init_grid.chars.each_with_index do |char, index|
#   puts "#{index}: #{char}"
# end

  def self.no_more_spots?(grid)
    numbs = '123456789'
    num_arr = grid.chars.select { |char| numbs.include?(char) }
    num_arr.empty?
  end

  def self.won(grid)
    case [grid[0], grid[2], grid[4]] # top row [1, 2, 3]
    when ['X', 'X', 'X']
      return{tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    case [grid[6], grid[8], grid[10]] # middle row [4, 5, 6]
    when ['X', 'X', 'X']
      return {tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    case [grid[12], grid[14], grid[16]] # bottom row [7, 8, 9]
    when ['X', 'X', 'X']
      return {tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    case [grid[0], grid[6], grid[12]] # left column [1, 4, 7]
    when ['X', 'X', 'X']
      return {tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    case [grid[2], grid[8], grid[14]] # middle column [2, 5, 8]
    when ['X', 'X', 'X']
      return {tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    case [grid[4], grid[10], grid[16]] # right column [3, 6, 9]
    when ['X', 'X', 'X']
      return {tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    case [grid[0], grid[8], grid[16]] # left to right diagonal [1, 5, 9]
    when ['X', 'X', 'X']
      return {tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    case [grid[4], grid[8], grid[12]] # right to left diagonal [3, 5, 7]
    when ['X', 'X', 'X']
      return {tie: false, won: true, winning_char: 'X'}
    when ['O', 'O', 'O']
      return {tie: false, won: true, winning_char: 'O'}
    end

    if no_more_spots?(grid)
      return {tie: true, won: false, winning_char: nil}
    end

    { tie: false, won: false, winning_char: nil }
  end
end
