% % % Load the data, split the trial up in terms of events and preprocess

addpath /home/cscjh/fieldtrip/fieldtrip-20200607

ft_defaults

clearvars

stimuli = {
	'advp', {'S  0' 'S  1' 'S  2' 'S  3' 'S  4' 'S  5' 'S  6' 'S  7' 'S  8' 'S  9' 'S 10' 'S 11' 'S 12' 'S 13' 'S 14' 'S 15' 'S 16' 'S 17' 'S 18' 'S 19' 'S 20' 'S 21' 'S 22' 'S 23' 'S 24'}
	'rrrr', {'S 30' 'S 31' 'S 32' 'S 33' 'S 34' 'S 35' 'S 36' 'S 37' 'S 38' 'S 39' 'S 40' 'S 41' 'S 42' 'S 43' 'S 44' 'S 45' 'S 46' 'S 47' 'S 48' 'S 49' 'S 50' 'S 51' 'S 52' 'S 53' 'S 54'}
	'rrrv', {'S 60' 'S 61' 'S 62' 'S 63' 'S 64' 'S 65' 'S 66' 'S 67' 'S 68' 'S 69' 'S 70' 'S 71' 'S 72' 'S 73' 'S 74' 'S 75' 'S 76' 'S 77' 'S 78' 'S 79' 'S 80' 'S 81' 'S 82' 'S 83' 'S 84'}
	'avav', {'S 90' 'S 91' 'S 92' 'S 93' 'S 94' 'S 95' 'S 96' 'S 97' 'S 98' 'S 99' 'S100' 'S101' 'S102' 'S103' 'S104' 'S105' 'S106' 'S107' 'S108' 'S109' 'S110' 'S111' 'S112' 'S113' 'S114'}
	'anan', {'S120' 'S121' 'S122' 'S123' 'S124' 'S125' 'S126' 'S127' 'S128' 'S129' 'S130' 'S131' 'S132' 'S133' 'S134' 'S135' 'S136' 'S137' 'S138' 'S139' 'S140' 'S141' 'S142' 'S143' 'S144'}
	'phmi', {'S150' 'S151' 'S152' 'S153' 'S154' 'S155' 'S156' 'S157' 'S158' 'S159' 'S160' 'S161' 'S162' 'S163' 'S164' 'S165' 'S166' 'S167' 'S168' 'S169' 'S170' 'S171' 'S172' 'S173' 'S174'}
          };
      
lpf = 25;
sample_freq = 1000;

ms=0.001;
word_length=320*ms;
number_of_words_per_sentence=4;
number_of_sentences_per_trial=13;

sentence_length = word_length*number_of_words_per_sentence;
trial_length = word_length*number_of_words_per_sentence*number_of_sentences_per_trial;

filepath = '/home/cscjh/Experiment2/data/'
filepath_save = '/home/cscjh/Experiment2/processed_data/pre_processed/'
filename = 'P5_25_11_2018'
fileend  = '.eeg'

full_filename=strcat(filepath,filename,fileend)

hdr   = ft_read_header(full_filename);
event = ft_read_event(full_filename);
	
block = horzcat(stimuli{1,2},stimuli{2,2},stimuli{3,2},stimuli{4,2},stimuli{5,2}, stimuli{6,2})  

% --------- define trials

cfg = [];
cfg.dataset = full_filename;
cfg.trialdef.eventtype  = 'Stimulus';
cfg.trialdef.eventvalue = block;
cfg.trialdef.prestim    = -sentence_length*1;   % this cuts one sentence length
cfg.trialdef.poststim   = sentence_length*13;

cfg = ft_definetrial(cfg);

% --------  rereference

cfg.channel = 'EEG';
cfg.demean = 'yes';
cfg.reref='yes';
cfg.refchannel = 'Cz'; % need to reference to single electrode for ICA
cfg.lpfilter = 'yes'; 
cfg.lpfreq = lpf;

data = ft_preprocessing(cfg);
    
fileout = strcat(filepath_save,filename);
f = fileout;
save(f, 'data');       

% --------- calculate power

variances=zeros(32,1)
for i=1:150
    variances=variances+var(data.trial{1,i},0,2)./150;
end

% --------- do ica

cfg = [];
cfg.method = 'runica'; % this is the default; uses implementation from EEGLAB
cfg.numcomponent = 30;

comp = ft_componentanalysis(cfg, data);

fileout = strcat(filepath_save,filename,"_ica_comp");
f = fileout;
save(f, 'comp');


component_to_remove = [];

% identify eyeblink components

for i=1:cfg.numcomponent
    
    electrode_weighting = (comp.unmixing(i,:).').^2;

    power= electrode_weighting.* variances;
    
    frontal_pwr = mean(power([1:3,7]));
    back_pwr = mean(power([4:6, 8:32]));
    extra='_front_4';
            
    i
    ratio = frontal_pwr / back_pwr   

    if ratio>=4
        r = 'to remove'
        component_to_remove = [component_to_remove; i];                     
    end
        
end
        
unique(component_to_remove)

                
% plot the components topographically for visual inspection

figure
cfg = [];
cfg.component = 1:30;       % specify the component(s) that should be plotted
cfg.layout    = 'easycapM23.mat' % 'biosemi128.lay'% %; % specify the layout file
cfg.comment   = 'no';
ft_topoplotIC(cfg, comp)

cfg = [];
cfg.layout = 'easycapM23.mat' %layout_file
cfg.viewmode = 'component';
ft_databrowser(cfg, comp)

        
        % cfg = [];
        % cfg.component = component_to_remove; 
        % data = ft_rejectcomponent(cfg, comp, data);

        % % rereference to average
        % cfg=[]
        % cfg.reref = 'yes';
        % cfg.refchannel = 'all';
        % cfg.refmethod='avg';
        % data = ft_preprocessing(cfg, data);

            
        % filetype = '.mat';
        % fileout = strcat(filepath_save,filename,'_comp_rm_',extra,blk_nm{1});
        
        % f = fileout;
        % save(f, 'data');





