%% Sudoku Problem Array
a = [3 0 2 0 0 5 6 9 0;
    0 4 0 0 9 6 0 3 0;
    0 5 0 0 0 8 0 0 0;
    1 9 0 0 8 0 7 0 3;
    0 0 0 0 0 0 0 0 0;
    5 0 7 0 3 0 0 6 1;
    0 0 0 8 0 0 0 2 0;
    0 8 0 9 6 0 0 7 0;
    0 6 5 7 0 0 3 0 9];
 
%% Debug Function
% value_row = row_detect(a);
% value_col = column_detect(a);
% value_grid = grid_detect(a);

%% Main Loop
num_list = zeros;
blank_list = zeros(1,2);
stuck_value = 0;

while numel(a(a>0)) ~= 81 
    index = 0;
    pos_zero = find( a == 0 );                      % 尋找空格位置
    pos_row = mod(pos_zero(1) , 9);                 % 確定空格所在之列
    if pos_row ~= 0                                 % 確定空格所在之行
        pos_col = 1 + ( pos_zero(1) - pos_row ) / 9;
    else
        pos_col = ( pos_zero(1) - pos_row ) / 9;
        pos_row = 9;
    end                                            
    
                                                % 空格位置: (pos_row, pos_col)
    for index = stuck_value + 1 : 9                           % 有成功的話，list都會變大
        b = a;                                  % 紀錄state
        n = index;                              % 設定選擇
        
        b(pos_row , pos_col) = n;               % 放入數字
        if (row_detect(b) == true && ...
            column_detect(b) == true && ...
            grid_detect(b) == true)
        
            num_list = [num_list ; n];
            blank_list = [blank_list ; pos_row , pos_col];
            a = b;
            t_f = true;
            break
        end
        t_f = false;
    end
    
    if t_f == false         % 等於 >> 新增數字失敗
        
        r = blank_list( length(blank_list) , 1 );
        c = blank_list( length(blank_list) , 2 );
        stuck_value = a(r,c);
        a( r,c ) = 0;
        blank_list( length(blank_list) , : )  = [];
        num_list( length(num_list) , : ) = [];
 
    else
        stuck_value = 0;
    end
    

% 把loop卡住時的前一個值抓出來，然後砍掉，說下一次也不能等於這個值。


end
disp("Answer is :");
disp(a)


