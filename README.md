Microphone-Adaptation
=====================

Matlab Scripts for modeling a microphone, distorting audio recordings to build acoustic models for a specific microphone.


AUTHOR: Seshadri Sridharan 
first 7 letters of my first name + s AT andrew.cmu.edu 

The folder contains all the Matlab files needed to:
- generate a chirp file [generateChirp.m]
- get the Impulse or the ifft(frequency_response) [geth.m]
- script to distort all WAV files(recursively found) in a directory [distortionScript.m]


All the above Matlab files, and the functions they call are sufficiently documented in the respective '.m' files. Parameters used are explained in the comments. 
For information on the '.m' files, type "help <funcname>". 


To distort all WAV files in a directory with a chirp file generated using generateChirp.m,
1. Add this folder path in Matlab
2. run distortionScript(D,C, R), where 'D' -> path-to-dir\dirname, 'C' -> path-to-chirp\chirpfilename, 'C' -> path-to-recording\recordingname


A chirp file('chirp.wav') and the recording('recording.wav') from the Microsoft Kinect sensor at 1m distance is included as an example.
