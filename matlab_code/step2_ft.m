

addpath /home/cscjh/fieldtrip/fieldtrip-20200607

ft_defaults

clearvars



      
% ----------- parameters, filenames
%low pass filter cutoff
lpf = 25; %Hz

sample_freq = 1000;

ms=0.001;
word_length=320*ms;
number_of_words_per_sentence=4;
number_of_sentences_per_trial=13;

sentence_length = word_length*number_of_words_per_sentence;
trial_length = word_length*number_of_words_per_sentence*number_of_sentences_per_trial;


filepath = '/home/cscjh/Experiment2/processed_data/pre_processed/'
filepath_save = '/home/cscjh/Experiment2/processed_data/ft/'

filepath_filelist = '/home/cscjh/Experiment2/data/'
filelist ='file_list.txt'

extra_load='_rm_front_4';         
extra_save='_fg';
extra_dat='_fg';
extra_trial='_trial';



% ----------- load filenames

filenames = strsplit(deblank(fileread(strcat(filepath_filelist,filelist))))

%  ---------- loop over files

for file_i=1:length(filenames)
    
    filename=filenames(file_i);
    filename=filename{1,1}
    
    freq_data = struct;

    ppt_data=struct;
    ppt_data_sc = struct;

    
    
    file_in = strcat(filepath,filename,extra_load);
    load(file_in, 'data');
                      
    cfg = [];
    cfg.output     = 'fourier';
    cfg.channel    = 'all';
    cfg.method     = 'mtmfft';
    cfg.taper      = 'hanning';
    cfg.foilim     = [0.25 4];
    cfg.keeptrials = 'yes';
    
    freq  = ft_freqanalysis(cfg, data);
        
    
    %save the whole data structure
    
    file_out = strcat(filepath_save,filename,extra_save);
    save(file_out, 'freq');
    
    %save the fourier coeff in a csv file - load.jl can load this and indicates the order it is
    %flattened in since it is a three-index array (trial / channel / freq)

    file_out = strcat(filepath_save,filename,extra_dat,'.dat');
    writematrix(freq.fourierspctrm ,file_out);
    
    %save the trialinfo - this gives the order the trials are in as is required for splitting by condition
    
    file_out = strcat(filepath_save,filename,extra_trial,'.dat');
    writematrix(freq.trialinfo ,file_out);
    
    
    
end


