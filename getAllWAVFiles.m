function fileList = getAllWAVFiles(dirName)
%%
% Returns all the WAV files in the given Directory name. 
%Looks for WAV files recursively
% Returns a list of the files found
%%

   dirData = dir(dirName);      %# Get all the data for the current directory
  
  
  WAVFIleList=dir(strcat(dirName,'\*.wav'));
  dirIndex = [WAVFIleList.isdir];
  %fileList = {WAVFIleList.name};   %%Get only the WAV files in the cur directory
  fileList = {WAVFIleList(~dirIndex).name}';  %'# Get a list of the files
  
  dirIndex = [dirData.isdir];  %# Find the index for directories
  
  if ~isempty(fileList)
    fileList = cellfun(@(x) fullfile(dirName,x),...  %# Prepend path to files
                       fileList,'UniformOutput',false);
                   
  end
  subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
  validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
  for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirName,subDirs{iDir});    %# Get the subdirectory path
    fileList = [fileList; getAllWAVFiles(nextDir)];  %# Recursively call getAllFiles
  end

end