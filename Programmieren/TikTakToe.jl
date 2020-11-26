function main()
    grid = reshape(1:9, 3,3)
    running = true
    while running
        next_move!(grid, 'x', 'o')
        next_move!(grid, 'o', 'x')
        running, winner = check_grid(grid)
    end
end

function next_move!(grid, player, opponent)
    
end

function check_moves(grid, c)
    for i = 1:size(grid,1), j = 1:size(grid, 2)
        if space == ' '
            good_move = check_neighbours(i, j, c)
            if good_move
                return (i,j)
            end
        end
    end
end
