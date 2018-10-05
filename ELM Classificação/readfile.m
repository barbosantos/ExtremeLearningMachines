function [dataset, classes] = readfile(filename, n_features, startRow, endRow)


%% Initialize variables.

%     data_set = load(filename, '-ascii');
    delimiter = ',';
%     n_features = size(data_set, 2);

    if nargin <= 2
        startRow = 1;
        endRow = inf;
    end

%% Format string for each line of text:
%  Repeat 'n_features' times to get all the double (%f) attributes
%  Assume the last attribute refers to the classes is a text (%s)
%  For more information, see the TEXTSCAN documentation.

    formatSpec = [repmat('%f', 1, n_features) '%s%[^\n\r]'];

%% Open the text file.

    fileID = fopen(filename,'r');

%% Read columns of data according to format string.
%  This call is based on the structure of the file used to generate this
%  code. If an error occurs for a different file, try regenerating the code
%  from the Import Tool.

    dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, ...
        'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);

    for block = 2 : length(startRow)
        frewind(fileID);
        dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, ...
            'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);

        for col = 1 : length(dataArray)
            dataArray{col} = [dataArray{col}; dataArrayBlock{col}];
        end
    end

%% Close the text file.

    fclose(fileID);

%% Post processing for unimportable data.
%  No unimportable data rules were applied during the import, so no post
%  processing code is included. To generate code which works for unimpor-
%  table data, select unimportable cells in a file and regenerate the script.

%% Filter data and classes, assuming that the classes are the last column.

    dataset = cat(2, dataArray{:, 1 : n_features});
    classes = dataArray{:, n_features+1};

end
