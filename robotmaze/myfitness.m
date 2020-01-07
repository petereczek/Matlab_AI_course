

function myfit = myfitness(x);

    A=[  0     0     1     0     1     1     1     1;
         1     0     1     0     1     1     1     1;
         1     0     0     0     1     0     1     1;
         1     0     1     0     1     0     1     1;
         1     0     1     0     0     0     0     1;
         1     0     1     1     1     1     0     1;
         0     0     0     1     1     1     0     1;
         1     1     0     0     0     1     0     0];
  
     %{
    A=[  0     0     1     1     1;
          1     0     1     1     1;
          1     0     0     0     1;
          1     1     1     0     1;
          1     1     1     0     0;];
    %}
          
    %%Start on square 1,1 in the top left corner, chromosomes are sequences of directions to move in     
    counter = 1;
    positionx = 1;
    positiony = 1;
    %%As long as the robot has not hit the last square, explore
    while (positionx<8 && positiony<=8) || (positiony<8 && positionx<=8)
        %% Prevent robot from backtracking own steps, for now assume cycles are invalid
        if (abs(x(counter+1)-x(counter))~=2) || (positionx==8 && positiony==8)
            switch x(counter)
                %%Go right (y specifies the column number, not position on y axis) 
                case 1
                    positiony = positiony + 1;
                    positionx;
                %%Go down (x specifies row number)
                case 2
                    positionx = positionx + 1;
                    positiony;
                %%Go left
                case 3
                    positiony = positiony - 1;
                    positionx;
                %%Go up
                case 4
                    positionx = positionx - 1;
                    positiony;
            end
        else
            break;
        end
        counter = counter + 1;
        %%Avoid stepping off the field
        try
            field = A(positionx,positiony);
        catch
            break;
        end
        %%If stepped on wrong square(hit a wall), terminate movement for
        %%that vector sequence
        if field ~= 0
            break;
        else
        end
    end
    positionx;
    positiony;
    counter;
    %%Fitness is determined based on the distance from the last square(exit
    %%of the maze)
    myfit = (positiony-8)^2+(positionx-8)^2;
end
        



