% Define the root folder
rootFolder = 'C:\Users\Kevin\Desktop\Skewl\Praxis\Mobile\MobileSensorData (Finale)\Training and Validation';

% Labels for "Yes" and "No" folders
labelYes = 1; % Label for "Yes"
labelNo = 0;  % Label for "No"

% Define subfolders for "Yes" and "No"
yesFolder = fullfile(rootFolder, 'Yes');
noFolder = fullfile(rootFolder, 'No');

% Add labels to "Yes" files
processFolder(yesFolder, labelYes);

% Add labels to "No" files
processFolder(noFolder, labelNo);

disp('Labels added and files updated successfully.');

% Function to process a folder recursively
function processFolder(folderPath, label)
    % Get all .mat files and subfolders in the current folder
    items = dir(folderPath);
    files = dir(fullfile(folderPath, '*.mat')); % .mat files only
    
    % Process each .mat file
    for i = 1:length(files)
        filePath = fullfile(files(i).folder, files(i).name);
        fileData = load(filePath); % Load .mat file
        
        % Add label
        fileData.label = label; % Add the label to the file data
        
        % Save the updated file
        save(filePath, '-struct', 'fileData'); % Overwrite the file
    end

    % Recursively process subfolders
    for i = 1:length(items)
        if items(i).isdir && ~startsWith(items(i).name, '.') % Ignore "." and ".."
            subfolderPath = fullfile(folderPath, items(i).name);
            processFolder(subfolderPath, label); % Recursive call
        end
    end
end
