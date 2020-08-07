

addpath /home/cscjh/fieldtrip/fieldtrip-20200607

ft_defaults

clearvars
% load in the comp data and test best way to remove components


filepath = '/home/cscjh/Experiment2/processed_data/pre_processed/';

filename= 'P5_25_11_2018'

filepath_save = '/home/cscjh/Experiment2/processed_data/component_removed/;'
fileend  = '.mat';
    
extra ='';
  
blocks = {'rrrv', 'rrrr', 'avav', 'advp', 'anan','phmi'};

freq_data = struct;
all_processed_data = struct;

for b=1:length(blocks)
    
	blk_nm = blocks(b)   
        
	ppt_data=struct;
        processed_data=struct;

        file_pre = strcat(filepath, filename,'_',blk_nm{1},fileend);
        f = file_pre;
        load(f, 'data');   
        
        file_com = strcat(filepath, filename,'_ica_comp_',blk_nm{1},fileend);
        f = file_com;
        load(f, 'comp');
        
        
        % plot the components topographically for visual inspection

	% figure
	% cfg = [];
        % cfg.component = 1:30;       % specify the component(s) that should be plotted
        % cfg.layout    = 'easycapM23.mat' % 'biosemi128.lay'% %; % specify the layout file
        % cfg.comment   = 'no';
        % ft_topoplotIC(cfg, comp)
  
        % cfg = [];
        % cfg.layout = 'easycapM23.mat' %layout_file.lay %'biosemi128.lay'%layout_file.lay %'biosemi128.lay'; % specify the layout file that should be used
        % cfg.viewmode = 'component';
        % ft_databrowser(cfg, comp)

       
        component_to_remove = [];

        for i=1:30

            smallest_power = min(comp.topo(:,i));
            abs_power = comp.topo(:,i) + abs(smallest_power);
%           % front 4
           frontal_pwr = mean(abs_power([1:3,7]));
            back_pwr = mean(abs_power([4:6, 8:32]));
            extra='_front_4_';

            % front 2
            %frontal_pwr = mean(abs_power(1:2));
            %back_pwr = mean(abs_power(3:32));
            %extra='_front_2_lr_';
            % 

            ratio = frontal_pwr / back_pwr   

            if ratio>=2 | ratio<0.05
                r = 'to remove'
                i
                component_to_remove = [component_to_remove; i];
                            
            end
        
        end
        
        unique(component_to_remove)

        cfg = [];
        cfg.component = component_to_remove; 
        data = ft_rejectcomponent(cfg, comp, data);

        % rereference to average
        cfg=[]
        cfg.reref = 'yes';
        cfg.refchannel = 'all';
        cfg.refmethod='avg';
        data = ft_preprocessing(cfg, data);

            
        filetype = '.mat';
        fileout = strcat(filepath_save,filename,'_comp_rm_',extra,blk_nm{1});
        
        f = fileout;
        save(f, 'data');

end   
             

