


addpath /home/cscjh/fieldtrip/fieldtrip-20200607

ft_defaults

clearvars

filepath = '/home/cscjh/Experiment2/processed_data/component_removed/';

filename= 'P5_25_11_2018'

filepath_save = '/home/cscjh/Experiment2/processed_data/ft/;'
fileend  = '.mat';
    
extra ='';

blocks = {'rrrv', 'rrrr', 'avav', 'advp', 'anan','phmi'};

all_processed_data = struct;

for b=1:length(blocks)
    
    blk_nm = blocks(b)   

    processed_data=struct;

    file_in = strcat(filepath,filename,'_comp_rm_',extra,blk_nm{1});
    f = file_in;
    load(f, 'data');

    all_processed_data.(blk_nm{1}) = processed_data;

end

freq_data = all_processed_data

control = struct;
all_data = struct;


combined_data = ft_appenddata(cfg, freq_data.anan,freq_data.phmi,freq_data.advp,freq_data.avav)
control_data = freq_data.rrrr
    
data = control_data

cfg = [];
cfg.output     = 'fourier';
cfg.channel    = 'all';
cfg.method     = 'mtmfft';
cfg.taper      = 'hanning';
cfg.foilim     = [0.25 4];
cfg.keeptrials = 'yes';

freq  = ft_freqanalysis(cfg, data);

itc = [];
itc.label     = freq.label;
itc.freq      = freq.freq;
F = freq.fourierspctrm;   % copy the Fourier spectrum
N= size(F,1);           % number of trials
itc.itpc      = F./abs(F);         % divide by amplitude 
itc.itpc      = sum(itc.itpc,1);   % sum angles
itc.itpc      = abs(itc.itpc)/N;   % take the absolute value and normalize
itc.itpc      = squeeze(itc.itpc);

cfg = [];
freq = ft_freqdescriptives(cfg, freq);

% swap the powspctrm for itcpc
freq.powspctrm = itc.itpc;

freq.avgitc = nanmean(freq.powspctrm);

control = freq;




data = combined_data;

% calculate itpc
cfg = [];
cfg.output     = 'fourier';
cfg.channel    = 'all';
cfg.method     = 'mtmfft';
cfg.taper      = 'hanning';
cfg.foilim     = [0.25 4];
cfg.keeptrials = 'yes';

freq  = ft_freqanalysis(cfg, data);

itc = [];
itc.label     = freq.label;
itc.freq      = freq.freq;
F = freq.fourierspctrm;   % copy the Fourier spectrum
N= size(F,1);           % number of trials
itc.itpc      = F./abs(F);         % divide by amplitude 
itc.itpc      = sum(itc.itpc,1);   % sum angles
itc.itpc      = abs(itc.itpc)/N;   % take the absolute value and normalize
itc.itpc      = squeeze(itc.itpc);


cfg = [];
freq = ft_freqdescriptives(cfg, freq);

% swap the powspctrm for itcpc
freq.powspctrm = itc.itpc;

freq.avgitc = nanmean(freq.powspctrm);

all_data = freq;



fileout = strcat(filepath_save,filename, '_control',extra,'.mat');
f = fileout;
save(f, 'control');

fileout = strcat(filepath_save, '_all_data',extra,'.mat');
f = fileout;
save(f, 'all_data');
