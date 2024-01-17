# Vocoder - Random Signal Modelisation

### Goal
The goal of this project is to implement a coding and decoding chain for human voice using linear predictive coding. Such a chain is found in bandwidth-efficient speech transmission applications (see GSM 06.10 or LPC-10/FS-1015 standards), where the goal is to extract the minimal characteristics of the signal to be transmitted (encoder analysis stage) and to be able, at reception, to synthesize (encoder) a signal faithful to the original. Mastering the analysis and synthesis stages also opens the way to creative applications where an effect is applied to speech following three steps:
— Analysis of speech characteristics.
— Manipulation of these characteristics to achieve a desired effect (for example, frequency change).
— Synthesis of speech from the modified characteristics.
We will compare real and synthetic signals with signal processing tools (autocorrelation, spectrum) and by ear.

### Model

The model we use, illustrated in Figure 1, is based on the idea that the speech signal comes from a linear filter, modeling the vocal tract, which is excited by an independent source, representing the airflow passing through the glottis. This glottal source can take two forms:

**Voiced:** Corresponding to vocal vibrations, modeled by a periodic impulse with random phase (for example, this occurs in vowels, as well as in the sounds ‘b’, ‘d’, and ‘z’).
 Corresponding to turbulent airflow, modeled by white noise (for example, this occurs in the sounds ‘p’, ‘t’, ‘s’, and ‘ch’).
**Unvoiced:** Corresponding to turbulent airflow, modeled by white noise (for example, this occurs in the sounds ‘p’, ‘t’, ‘s’, and ‘ch’).

<img width="784" alt="Screenshot 2024-01-17 at 12 27 38" src="https://github.com/dhugoexe/Vocoder-RandomSignalModelisation/assets/57801194/35511af4-ddca-46ab-bbd6-37a04357fc6c">


This modeling is particularly useful for developing speech compression tools: speech is no longer represented as a series of samples, but directly from a sequence of source/filter models. In this context, the speech processing chain comprises two steps:

**Analysis:** Where the speech signal is broken down into its component parts, based on the source/filter model. This involves identifying whether the speech is voiced or unvoiced and determining the characteristics of the vocal tract filter.

**Synthesis:** Where the speech signal is reconstructed from the analyzed components. In the case of voiced speech, this would involve generating a periodic impulse with the identified characteristics, while for unvoiced speech, white noise is used.

This approach allows for a more efficient representation of speech, significantly reducing the amount of data needed to faithfully reproduce the sound, which is essential in applications like telecommunications, where bandwidth is often limited.
