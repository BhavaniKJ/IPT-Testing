A = imread('color.tif');
[rows, columns, dim] = size(A);
fileID = fopen('TIFF_Mat_Imread.txt','wt');
for i = 1 : dim
    %fprintf(fileID, 'A(:,:,%d)\n',i);
    for j = 1 : rows
        for k = 1 : columns
             fprintf(fileID, '%d  ',A(j,k,i));   
        end
        fprintf(fileID,'\n');
    end
    fprintf(fileID,'\n');
end

fclose(fileID);

