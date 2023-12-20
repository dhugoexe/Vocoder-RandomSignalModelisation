%% [pitch,sigma2,Aopt] = BlockAnalysis(X,M,Fe)
% Analyses the samples of a supposedly stationnary process
% and fits the parameters of a model source/filter.
%
% INPUTS
% - X vector of samples of the current block of signal
% - M filter order (optional, defaults to 10)
% - Fe sampling frequency (optional, defaults to 10kHz)
% OUTPUTS
% - pitch the pitch value in normalized frequency if the sound
% is voiced, -1 otherwise.
% - sigma2 the variance of excitation
% - Aopt vector of filter coefficients (optimal linear prediction
% of order M).
function [pitch, sigma2, Aopt] = BlockAnalysis(X, M, Fe)

    Cx = BiasedCrossCorr(X, length(X));
    pitch = PitchDetector(Cx, Fe, 100, 400);
    [Aopt, sigma2] = YuleWalkerSolver(Cx, M);

end
