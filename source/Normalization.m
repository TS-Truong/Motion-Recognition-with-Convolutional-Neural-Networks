% Normalize each column (feature) to the range [-1, 1]
X_min = min(X);
X_max = max(X);
X = 2 * ((X - X_min) ./ (X_max - X_min)) - 1;

clear Acceleration;
clear AngularVelocity;
clear X_max;
clear X_min;