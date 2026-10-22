# Motion Recognition with Convolutional Neural Networks
A convolutional neural network (CNN) created using MATLAB that classifies whether a smartphone is being raised to eye level or undergoing another movement, using only its built in accelerometer and gyroscope.

## Overview
This project investigates the feasibility of using smartphone motion sensors and a convolutional neural network to distinguish intentional phone to eye gestures from other everyday movements.

A total of 400 labeled motion recordings were collected using an iPhone 14 Plus's accelerometer and gyroscope. The sensor signals were preprocessed into normalized, five second inputs containing six motion channels. These recordings were divided into training and validation datasets, while a separate set of 30 recordings was collected to test the model under more challenging movement conditions.

A two convolution layer CNN was developed and trained in MATLAB to perform binary motion classification. Across 20 independent training runs, the model achieved 84.67% mean test accuracy, demonstrating the potential of sensor based gesture recognition while revealing limitations in generalizing to unfamiliar movement patterns.

## Technical Approach
### Sensor Data
* Input: Using MATLAB mobile app, three axis acceleration and three axis angular velocity were recorded with an iPhone 14 Plus.
* Sampling rate: 100 Hz.
* Preprocessing: Each recording was trimmed to 5 seconds (500 samples), the six sensor channels were combined, and the data was normalized to the range [-1, 1]. Each recording was assigned a binary label (1 for phone to eye gesture, 0 for other movement).

The repository contains 320 training, 80 validation, and 30 testing recordings in .mat files. The training and validation recordings were drawn from 400 collected examples; the test recordings were collected separately.

### CNN Architecture
The 12 layer CNN uses two convolutional layers (16 and 32 filters, each 5 × 1), Leaky ReLU activations, average pooling, and fully connected layers with 64 and 2 outputs, followed by softmax classification. Training uses stochastic gradient descent with a learning rate of 0.01 for 25 epochs.

![CNN Architecture](CNN%20Architecture.png)

## Result
The CNN was evaluated across 20 independent training runs. The average performance metrics are summarized below.

| Metric | Average Value |
|---|---:|
| Training Accuracy | 100.00% |
| Validation Accuracy | 97.63% |
| Test Accuracy | 84.67% |
| Test Precision | 83.89% |
| Test Recall | 88.44% |
| Test F1 Score | 86.04% |

The model achieved an average test accuracy of 84.67%, demonstrating its ability to distinguish phone to eye gestures from other movements. However, the lower test accuracy compared with validation accuracy (97.63%) suggests that the model encounters difficulty when classifying unfamiliar or more complex movement.

## Running the Model
### Requirements
* MATLAB
* Deep Learning Toolbox
* Statistics and Machine Learning Toolbox

### Instructions
1. Clone or download this repository.
2. Open MATLAB and navigate to the repository folder.
3. Open CNN.m in the MATLAB Editor.
4. Click Run to execute the script.

### Expected Output
1. Load the training, validation, and testing datasets.
2. Construct and train the CNN for 25 epochs.
3. Display the training progress and network architecture.
4. Evaluate the trained model using the separate test dataset.
5. Display the test accuracy, precision, recall, and F1 score.

Note: Each execution trains a new model, so the results may vary between runs.

## Limitations
* Generalization: The collected dataset comes from one individual; evaluating data from multiple people would better establish user independent performance.
* Unseen movement patterns: More varied transitions and phone to face angles could improve robustness to realistic background movement.
* Response time: The current model requires a 5 second input window, making it unsuitable for immediate screen activation without further optimization.
* Deployment: This repository demonstrates offline training and evaluation, not a real time mobile application.

## Project Report
For the full literature review, data collection protocol, preprocessing rationale, CNN design, trial by trial evaluation, and references, see [project report](Project%20report.pdf).