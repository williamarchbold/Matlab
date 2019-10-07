%William Archbold, CS2300, 6 Oct 2019
path = '/Users/William/Desktop/Project 2/sources/';
files = dir(path); %dir creates an array of contents of folder within variable path
filenames = {files.name}; %extracts the name of the files
fileswithpath = fullfile(path, filenames(3:end)); %concatenates filename with path incase there are multiple files with same name skips first 2 junk files {'.'} and {'..'}

for loop =1:1:numel(fileswithpath) %start at 1 increment by 1 end at number of elements in variable

    fileid = fopen(fileswithpath{loop}, 'r');
    source = fscanf(fileid, '%d');
    fclose(fileid);
    %create the box
    llx = source(1); %lower left x value
    lly = source(2); %lower left y value
    x_length = source(3); 
    y_length = source(3);
    ll = [llx, lly];
    lr = [llx + x_length, lly];
    ul = [llx,lly + y_length];
    ur = [llx + x_length, lly + y_length];
    %x = linespace(llx, 5);
    %target_bottom = linespace(ll,lr);

    %Create the parametric equation for the given line
    %parametric_line = line_point + t*line_vector;
    p = [source(4); source(5)];  %; creates a new row 
    line_vector = [source(6);source(7)];
    
    %convert to implicit 
    a = line_vector(end:-1:1); %(a:b:c) start at index end which is last value 
                                %in vector. go by -1 through vector ending at 
                                %position 1 
    a(1) = -a(1);

    b = a(2);

    %c = -(a1p1 + a2p2)
    c = -(a(1)*p(1) + a(2)*p(2)); 

    figure  %cmd to open up a figure window

    rectangle('Position', [llx,lly,x_length,y_length],'Linestyle', '--', 'LineWidth', 2); %Anything in single quotes is a property
                                                                            %-- is not a numerical value so also has single quotes  
    axis([-2*x_length 2*x_length -2*y_length 2*y_length]); %set size of axis in box

    f = @(x1,x2) a(1)*x1 + a(2)*x2 + c; %make an anonymous function 
    hold on
    fimplicit(f, 'LineStyle', ':', 'LineWidth', 3); %function to plot an implicit line 
    xline(0,'LineStyle', '-', 'LineWidth', 4, 'Color', 'g');
    yline(0,'LineStyle', '-', 'LineWidth', 4, 'Color', 'g');
    xlabel([num2str(a(1)),'*x1 + ', num2str(a(2)),'*x2 + ',num2str(c),' = 0']); %put formula at bottom of graph (fake label of x axis)

end
