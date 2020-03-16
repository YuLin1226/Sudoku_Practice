function [value] = column_detect(array)
    value = true;
    for i = 1:length(array)
        col = array(:,i);
        col = col( col > 0 );
        if length(col) ~= length( unique(col) )
            value = false;
        end
    end
end

