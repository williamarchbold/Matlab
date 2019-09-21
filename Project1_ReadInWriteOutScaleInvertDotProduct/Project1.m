%William Archbold
%CS 2300 
function[] = Project1() %function is a keyword, two brackets represent output/return value

fprintf('\n\nProject 1 for William Archbold\n\n');                       

fileid = fopen('Amatrix', 'r'); %matlab treats chars and strings as C chars with ''
                                    %first argument is file, second is r
                                    %for read/write
a = fscanf(fileid , '%d'); %scan in numbers from fileid object to a variable
fprintf('Matrix A w/ dimensions: \n'); 
fprintf('%d', a); %fprintfprints horizontally
fileid =fopen('CS2300P1aArchbold.outA', 'w'); %change file object to open the new file and give write ability
fprintf(fileid, '%d ', a); %overloaded fprintf takes 3 arguments: fileobject, character write type, and the list, a, which was read in

fileid = fopen('Bmatrix', 'r');
b = fscanf(fileid, '%d');
fileid= fopen('CS2300P1aArchbold.outB', 'w');
fprintf(fileid, '%d ', b); %same as fprintf a, also need a space after %d to add back space 
fprintf('\nMatrix B w/ row dimensions: \n');
fprintf('%d', b);

d = a(3: a(1)*a(2)+2); %a1 = first element in file a2 = second element in file and 3 is offset
fprintf('\nMatrix A no row dimensions\n:');
fprintf('%d', d); %printed to command window just to check output

c = b(3: b(1)*b(2)+2);
fprintf('\nMatrix B no dimensions\n:');
fprintf('%d', c);%print B to command window 
d = 5*d; %scale d by 5 but Matlab transposed on it's own creating a 100x1 matrix
e = d.'- c; % had to take transpose of d to get it back into 1x100 matrix and match dimension of c
fprintf('\n5A - B:\n');
fprintf('%d', e);

fileid = fopen('CS2300P1aArchbold.calc', 'w');
fprintf(fileid, '%d %d ', a(1), a(2)); %write 10 10 for dimensions to file
fileid = fopen('CS2300P1aArchbold.calc', 'a');
fprintf(fileid, '%d ', e(1:100)); %added (1:100) to get it to stop writing

x = reshape(e(1:100), a(1), a(2)); %reshape method changes dimensions of matrix by the second and third arguments of the method
y = x.'; %transpose 
fprintf('\nTranspose of 5A - B:\n');
fprintf('%d', y);
y = reshape(y, 1, a(1)*a(2)); %reshape to prep for output to file

fileid = fopen('CS2300P1aArchbold.trans', 'w');
fprintf(fileid, '%d %d ', a(1), a(2));
fileid = fopen('CS2300P1aArchbold.trans', 'a');
fprintf(fileid, '%d ', y);


