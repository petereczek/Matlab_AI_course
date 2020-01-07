digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos', ...
    'nndatasets','DigitDataset');

%% Load the images into a datastore
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

%{
    %% Access image 2 or any other for viewing
    img = readimage(imds,2);
    imshow(img)
%}
%% Explore different numbers of Train Files
numTrainFiles = 50;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

%% Input size of the images
inputSize = [28 28 1];
numClasses = 10;

%% Define CNN layers
layers = [
    imageInputLayer(inputSize)
    convolution2dLayer(5,20)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

%% Set training options
options = trainingOptions('sgdm', ...
    'MaxEpochs',4, ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

%% Train the CNN
net = trainNetwork(imdsTrain,layers,options);

%% Run Predictions with trained net
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

%% Evaluate the prediction accuracy
accuracy = mean(YPred == YValidation)