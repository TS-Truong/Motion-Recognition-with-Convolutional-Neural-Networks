% Define the root folder to search
rootFolder = 'C:\Users\Kevin\Desktop\Skewl\Praxis\Mobile\MobileSensorData (Finale)\Training and Validation';

% Define the destination folders for training and validation data
trainingFolder = 'C:\Users\Kevin\Desktop\Skewl\Praxis\TrainingData';
validationFolder = 'C:\Users\Kevin\Desktop\Skewl\Praxis\ValidationData';

% Create the destination folders if they don't exist
if ~exist(trainingFolder, 'dir')
    mkdir(trainingFolder);
end
if ~exist(validationFolder, 'dir')
    mkdir(validationFolder);
end

% Initialize counters for file naming
trainingCounter = 1;
validationCounter = 1;

% Start processing files
[trainingCounter, validationCounter] = splitFilesByIndices(rootFolder, trainingFolder, validationFolder, trainingCounter, validationCounter);

disp('Files split into training and validation folders with sequential naming.');

% Recursive function to split files by predefined indices
function [trainingCounter, validationCounter] = splitFilesByIndices(sourceFolder, trainingFolder, validationFolder, trainingCounter, validationCounter)
    % Get all items in the current folder
    items = dir(sourceFolder);
    files = dir(fullfile(sourceFolder, '*.mat')); % Find all .mat files

    % Check if there are files in the folder
    if ~isempty(files)
        % Sort files alphabetically to ensure consistent order
        files = sort({files.name});

        % Define validation indices
        validationIndices = [1, 10, 11, 20];

        % Process each file
        for i = 1:length(files)
            % Current file path
            oldFilePath = fullfile(sourceFolder, files{i});

            % Determine destination based on the index
            if ismember(i, validationIndices)
                % Validation file
                newFileName = sprintf('%d.mat', validationCounter);
                newFilePath = fullfile(validationFolder, newFileName);
                validationCounter = validationCounter + 1;
            else
                % Training file
                newFileName = sprintf('%d.mat', trainingCounter);
                newFilePath = fullfile(trainingFolder, newFileName);
                trainingCounter = trainingCounter + 1;
            end

            % Copy the file to the destination folder
            copyfile(oldFilePath, newFilePath);
        end
    end

    % Process subfolders recursively
    for i = 1:length(items)
        if items(i).isdir && ~startsWith(items(i).name, '.') % Skip "." and ".."
            subfolderPath = fullfile(sourceFolder, items(i).name);
            [trainingCounter, validationCounter] = splitFilesByIndices(subfolderPath, trainingFolder, validationFolder, trainingCounter, validationCounter);
        end
    end
end
