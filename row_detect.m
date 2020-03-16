function [value] = row_detect(array)
    value = true;
    for i = 1:length(array)
        row = array(i,:);
        row = row( row > 0 );
        if length(row) ~= length( unique(row) )
            value = false;
        end
    end
end

