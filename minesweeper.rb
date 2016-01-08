class Tile

  attr_reader :bomb
  attr_accessor :revealed, :display
  def initialize (location, bomb = false)
    @bomb = bomb
    @revealed = false
    @display = "*"
    @location = location
  end

end

class Board

  attr_reader :no_of_bombs, :size, :grid
  def initialize (size = 9,no_of_bombs = 5)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
    @no_of_bombs = no_of_bombs
  end

  def generate_grid
    bomb_array = []
    no_of_bombs.times do
      bomb_array << [rand(size),rand(size)]
    end
    0.upto(size - 1) do |i|
      0.upto(size - 1) do |j|
        if bomb_array.include?([i,j])
          @grid[i][j] = Tile.new([i,j],true)
        else
          @grid[i][j] = Tile.new([i,j])
        end
      end
    end
  end

  def display
    display_grid = Array.new(size) {Array.new(size)}
    0.upto(size - 1) do |i|
      0.upto(size - 1) do |j|
        display_grid[i][j] = @grid[i][j].display
      end
    end
    p display_grid

  end


end
