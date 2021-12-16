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
    
    potential_bombs = [[row-1,col-1], [row-1,col], [row-1,col+1], [row,col-1], [row, col+1], [row+1,col-1], [row+1, col], [row+1,col+1] ]
    
    (0...@grid.length).each do |row|
        (0...@grid.length).each do |col|
            counter = 0
            if @grid[row][col] != "B"
                potential_bombs.each do |pos|
                   counter +=1 if @grid[pos] == "B"
                end
                @grid[pos] = "_" if counter == 0  
            end
        end
    end


end
#["B", fringe(Integer), interior(_)]
def hidden_grid
    @grid.map do |row|
        row.map do |ele|
            if ele == "B"
                "*"
            else
                ele
            end
        end
    end
end

def num_bomb
    @grid.flatten.count{|ele| ele == "B"}
end

def fringe_squares
    @grid.flatten.count{|ele| ele.is_a?(Integer)}
end

def interior_squares
    @grid.flatten.count{|ele| ele == "_"}
end

def remaining_blanks
    @size - num_bomb - fringe_squares - interior_squares
end


end