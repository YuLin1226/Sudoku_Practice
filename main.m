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
    pos_zero = find( a == 0 );                      % �M��Ů��m
    pos_row = mod(pos_zero(1) , 9);                 % �T�w�Ů�Ҧb���C
    if pos_row ~= 0                                 % �T�w�Ů�Ҧb����
        pos_col = 1 + ( pos_zero(1) - pos_row ) / 9;
    else
        pos_col = ( pos_zero(1) - pos_row ) / 9;
        pos_row = 9;
    end                                            
    
                                                % �Ů��m: (pos_row, pos_col)
    for index = stuck_value + 1 : 9                           % �����\���ܡAlist���|�ܤj
        b = a;                                  % ����state
        n = index;                              % �]�w���
        
        b(pos_row , pos_col) = n;               % ��J�Ʀr
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
    
    if t_f == false         % ���� >> �s�W�Ʀr����
        
        r = blank_list( length(blank_list) , 1 );
        c = blank_list( length(blank_list) , 2 );
        stuck_value = a(r,c);
        a( r,c ) = 0;
        blank_list( length(blank_list) , : )  = [];
        num_list( length(num_list) , : ) = [];
 
    else
        stuck_value = 0;
    end
    

% ��loop�d��ɪ��e�@�ӭȧ�X�ӡA�M��屼�A���U�@���]���൥��o�ӭȡC


end
disp("Answer is :");
disp(a)


