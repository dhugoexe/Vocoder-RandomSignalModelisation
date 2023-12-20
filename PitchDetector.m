function pitch = PitchDetector(Cx, Fe, Fmin, Fmax)

    
    [peaks, locations] = findpeaks(Cx, 'MinPeakDistance', Fe/Fmax);  
    pitchFreq = (1/mean(diff(locations)))

     if pitchFreq < Fmin/Fe || pitchFreq > Fmax/Fe
        pitch = -1; 
    else
        pitch = pitchFreq; 
    end
end