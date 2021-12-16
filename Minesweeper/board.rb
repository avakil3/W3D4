class Board

def initialize(n)
    @grid = Array.new(n) {Array.new(n,"*")}
    @size = n * n
end

def [](position)
    row, col = position
    @grid[row][col]
end

def []=(position,value)
    row, col = position
    @grid[row][col] = value
end


def populate
    total_bomb = 0.2 * @size
    while num_bomb < total_bomb
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        position = [rand_row,rand_col]
        @grid[position] = "B"
    end
end

def hidden_grid
    @grid
end

def num_bomb
    @grid.flatten.count{|ele| ele == "B"}
end

end