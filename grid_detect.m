function [value] = grid_detect(array)
    value = true;
    for i = 1 : 3
        for j = 1 : 3
            grid = array(3*i-2 : 3*i , 3*j-2 : 3*j);
            grid = grid( grid > 0 );
            if numel(grid) ~= numel( unique(grid) )
                value = false;
            end
        end
    end
end

