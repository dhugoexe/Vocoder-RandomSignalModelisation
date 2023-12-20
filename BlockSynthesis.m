%% Y = BlockSynthesis(pitch,sigma2,Aopt,N)
% Synthetizes a random signal based on the parameters of a
% source/filter model.
%
% INPUTS
% - pitch the pitch value in normalized frequency if the sound
% is voiced, -1 otherwise.
% - sigma2 the variance of excitation
% - Aopt vector of optimal filter coefficients.
% - N number of samples to be synthetized
% OUTPUTS
% - Y synthetized block
function Y = BlockSynthesis(pitch,sigma2,Aopt,N)
    
    B = genWhiteNoise(sigma2, N);


    if pitch ~= -1

        T0 = round(1/pitch);
        for i = T0:T0:N
            B(i) = B(i) + 1; 
        end
    end

    Y = filter(1, [1 -Aopt.'], B);

end