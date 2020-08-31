scenario = "Amelia_Experiment2.sce"; 
active_buttons = 3;
button_codes = 1,2,3; # button 1 = enter button 2 = yes, button 3 = no
target_button_codes = 1,2,3;
response_logging= log_active;           
response_matching= simple_matching; 
randomize_trials = true;   
default_font_size= 24;
default_font = "Helvetica";
write_codes = true; 
default_cue_events = true;
default_cue_event_port = 1;
pulse_width = 10;          
begin;    



array {
sound {wavefile{filename="ADVP_1.wav";}; description="1";} stimulus_1;
sound {wavefile{filename="ADVP_3.wav";}; description="2";} stimulus_2;
sound {wavefile{filename="ADVP_5.wav";}; description="3";} stimulus_3;
sound {wavefile{filename="ADVP_6.wav";}; description="4";} stimulus_4;
sound {wavefile{filename="ADVP_7.wav";}; description="5";} stimulus_5;
sound {wavefile{filename="ADVP_10.wav";}; description="6";} stimulus_6;
sound {wavefile{filename="ADVP_11.wav";}; description="7";} stimulus_7;
sound {wavefile{filename="ADVP_12.wav";}; description="8";} stimulus_8;
sound {wavefile{filename="ADVP_14.wav";}; description="9";} stimulus_9;
sound {wavefile{filename="ADVP_15.wav";}; description="10";} stimulus_10;
sound {wavefile{filename="ADVP_16.wav";}; description="11";} stimulus_11;
sound {wavefile{filename="ADVP_19.wav";}; description="22";} stimulus_12;
sound {wavefile{filename="ADVP_21.wav";}; description="23";} stimulus_13;
sound {wavefile{filename="ADVP_22.wav";}; description="24";} stimulus_14;
sound {wavefile{filename="ADVP_23.wav";}; description="25";} stimulus_15;
sound {wavefile{filename="ADVP_24.wav";}; description="26";} stimulus_16;
sound {wavefile{filename="ADVP_25.wav";}; description="27";} stimulus_17;
sound {wavefile{filename="ADVP_26.wav";}; description="28";} stimulus_18;
sound {wavefile{filename="ADVP_27.wav";}; description="29";} stimulus_19;
sound {wavefile{filename="ADVP_28.wav";}; description="20";} stimulus_20;
sound {wavefile{filename="ADVP_29.wav";}; description="21";} stimulus_21;
sound {wavefile{filename="ADVP_30.wav";}; description="22";} stimulus_22;
sound {wavefile{filename="ADVP_31.wav";}; description="23";} stimulus_23;
sound {wavefile{filename="ADVP_34.wav";}; description="24";} stimulus_24;
sound {wavefile{filename="ADVP_35.wav";}; description="25";} stimulus_25;
} ADVP_sentences;


array {
sound {wavefile{filename="rrrV_1.wav";}; description="30";} stimulus_30;
sound {wavefile{filename="rrrV_3.wav";}; description="31";} stimulus_31;
sound {wavefile{filename="rrrV_5.wav";}; description="32";} stimulus_32;
sound {wavefile{filename="rrrV_7.wav";}; description="33";} stimulus_33;
sound {wavefile{filename="rrrV_8.wav";}; description="34";} stimulus_34;
sound {wavefile{filename="rrrV_9.wav";}; description="35";} stimulus_35;
sound {wavefile{filename="rrrV_13.wav";}; description="36";} stimulus_36;
sound {wavefile{filename="rrrV_14.wav";}; description="37";} stimulus_37;
sound {wavefile{filename="rrrV_15.wav";}; description="38";} stimulus_38;
sound {wavefile{filename="rrrV_16.wav";}; description="39";} stimulus_39;
sound {wavefile{filename="rrrV_17.wav";}; description="40";} stimulus_40;
sound {wavefile{filename="rrrV_18.wav";}; description="41";} stimulus_41;
sound {wavefile{filename="rrrV_19.wav";}; description="42";} stimulus_42;
sound {wavefile{filename="rrrV_20.wav";}; description="43";} stimulus_43;
sound {wavefile{filename="rrrV_21.wav";}; description="44";} stimulus_44;
sound {wavefile{filename="rrrV_22.wav";}; description="45";} stimulus_46;
sound {wavefile{filename="rrrV_23.wav";}; description="46";} stimulus_47;
sound {wavefile{filename="rrrV_24.wav";}; description="47";} stimulus_45;
sound {wavefile{filename="rrrV_25.wav";}; description="48";} stimulus_48;
sound {wavefile{filename="rrrV_26.wav";}; description="49";} stimulus_49;
sound {wavefile{filename="rrrV_28.wav";}; description="50";} stimulus_50;
sound {wavefile{filename="rrrV_31.wav";}; description="51";} stimulus_51;
sound {wavefile{filename="rrrV_32.wav";}; description="52";} stimulus_52;
sound {wavefile{filename="rrrV_33.wav";}; description="53";} stimulus_53;
sound {wavefile{filename="rrrV_34.wav";}; description="54";} stimulus_54;
} rrrV_sentences;


array {
sound {wavefile{filename="rrrr_2.wav";}; description="60";} stimulus_60;
sound {wavefile{filename="rrrr_3.wav";}; description="61";} stimulus_61;
sound {wavefile{filename="rrrr_4.wav";}; description="62";} stimulus_62;
sound {wavefile{filename="rrrr_5.wav";}; description="63";} stimulus_63;
sound {wavefile{filename="rrrr_6.wav";}; description="64";} stimulus_64;
sound {wavefile{filename="rrrr_7.wav";}; description="65";} stimulus_65;
sound {wavefile{filename="rrrr_8.wav";}; description="66";} stimulus_66;
sound {wavefile{filename="rrrr_9.wav";}; description="67";} stimulus_67;
sound {wavefile{filename="rrrr_10.wav";}; description="68";} stimulus_68;
sound {wavefile{filename="rrrr_11.wav";}; description="69";} stimulus_69;
sound {wavefile{filename="rrrr_12.wav";}; description="70";} stimulus_70;
sound {wavefile{filename="rrrr_13.wav";}; description="71";} stimulus_71;
sound {wavefile{filename="rrrr_14.wav";}; description="72";} stimulus_72;
sound {wavefile{filename="rrrr_15.wav";}; description="73";} stimulus_73;
sound {wavefile{filename="rrrr_16.wav";}; description="74";} stimulus_74;
sound {wavefile{filename="rrrr_17.wav";}; description="75";} stimulus_75;
sound {wavefile{filename="rrrr_20.wav";}; description="76";} stimulus_76;
sound {wavefile{filename="rrrr_21.wav";}; description="77";} stimulus_77;
sound {wavefile{filename="rrrr_22.wav";}; description="78";} stimulus_78;
sound {wavefile{filename="rrrr_23.wav";}; description="79";} stimulus_79;
sound {wavefile{filename="rrrr_24.wav";}; description="80";} stimulus_80;
sound {wavefile{filename="rrrr_25.wav";}; description="81";} stimulus_81;
sound {wavefile{filename="rrrr_29.wav";}; description="82";} stimulus_82;
sound {wavefile{filename="rrrr_30.wav";}; description="83";} stimulus_83;
sound {wavefile{filename="rrrr_32.wav";}; description="84";} stimulus_84;
} rrrr_sentences;


array {
sound {wavefile{filename="AVAV_1.wav";}; description="90";} stimulus_90;
sound {wavefile{filename="AVAV_2.wav";}; description="91";} stimulus_91;
sound {wavefile{filename="AVAV_3.wav";}; description="92";} stimulus_92;
sound {wavefile{filename="AVAV_4.wav";}; description="93";} stimulus_93;
sound {wavefile{filename="AVAV_7.wav";}; description="94";} stimulus_94;
sound {wavefile{filename="AVAV_8.wav";}; description="95";} stimulus_95;
sound {wavefile{filename="AVAV_9.wav";}; description="96";} stimulus_96;
sound {wavefile{filename="AVAV_11.wav";}; description="97";} stimulus_97;
sound {wavefile{filename="AVAV_13.wav";}; description="98";} stimulus_98;
sound {wavefile{filename="AVAV_14.wav";}; description="99";} stimulus_99;
sound {wavefile{filename="AVAV_18.wav";}; description="100";} stimulus_100;
sound {wavefile{filename="AVAV_23.wav";}; description="101";} stimulus_101;
sound {wavefile{filename="AVAV_25.wav";}; description="102";} stimulus_102;
sound {wavefile{filename="AVAV_29.wav";}; description="103";} stimulus_103;
sound {wavefile{filename="AVAV_31.wav";}; description="104";} stimulus_104;
sound {wavefile{filename="AVAV_34.wav";}; description="105";} stimulus_105;
sound {wavefile{filename="AVAV_36.wav";}; description="106";} stimulus_106;
sound {wavefile{filename="AVAV_39.wav";}; description="107";} stimulus_107;
sound {wavefile{filename="AVAV_42.wav";}; description="108";} stimulus_108;
sound {wavefile{filename="AVAV_44.wav";}; description="109";} stimulus_109;
sound {wavefile{filename="AVAV_45.wav";}; description="110";} stimulus_110;
sound {wavefile{filename="AVAV_46.wav";}; description="111";} stimulus_111;
sound {wavefile{filename="AVAV_83.wav";}; description="112";} stimulus_112;
sound {wavefile{filename="AVAV_84.wav";}; description="113";} stimulus_113;
sound {wavefile{filename="AVAV_86.wav";}; description="114";} stimulus_114;
} AVAV_sentences;

array {
sound {wavefile{filename="ANAN_1.wav";}; description="120";} stimulus_120;
sound {wavefile{filename="ANAN_3.wav";}; description="121";} stimulus_121;
sound {wavefile{filename="ANAN_6.wav";}; description="122";} stimulus_122;
sound {wavefile{filename="ANAN_10.wav";}; description="123";} stimulus_123;
sound {wavefile{filename="ANAN_11.wav";}; description="124";} stimulus_124;
sound {wavefile{filename="ANAN_12.wav";}; description="125";} stimulus_125;
sound {wavefile{filename="ANAN_13.wav";}; description="126";} stimulus_126;
sound {wavefile{filename="ANAN_16.wav";}; description="127";} stimulus_127;
sound {wavefile{filename="ANAN_17.wav";}; description="128";} stimulus_128;
sound {wavefile{filename="ANAN_18.wav";}; description="129";} stimulus_129;
sound {wavefile{filename="ANAN_24.wav";}; description="130";} stimulus_130;
sound {wavefile{filename="ANAN_26.wav";}; description="131";} stimulus_131;
sound {wavefile{filename="ANAN_28.wav";}; description="132";} stimulus_132;
sound {wavefile{filename="ANAN_29.wav";}; description="133";} stimulus_133;
sound {wavefile{filename="ANAN_31.wav";}; description="134";} stimulus_134;
sound {wavefile{filename="ANAN_33.wav";}; description="135";} stimulus_135;
sound {wavefile{filename="ANAN_34.wav";}; description="136";} stimulus_136;
sound {wavefile{filename="ANAN_41.wav";}; description="137";} stimulus_137;
sound {wavefile{filename="ANAN_42.wav";}; description="138";} stimulus_138;
sound {wavefile{filename="ANAN_47.wav";}; description="139";} stimulus_139;
sound {wavefile{filename="ANAN_48.wav";}; description="140";} stimulus_140;
sound {wavefile{filename="ANAN_50.wav";}; description="141";} stimulus_141;
sound {wavefile{filename="ANAN_86.wav";}; description="142";} stimulus_142;
sound {wavefile{filename="ANAN_87.wav";}; description="143";} stimulus_143;
sound {wavefile{filename="ANAN_89.wav";}; description="144";} stimulus_144;
} ANAN_sentences;

array {
sound {wavefile{filename="phrase_mix_1.wav";}; description="150";} stimulus_150;
sound {wavefile{filename="phrase_mix_2.wav";}; description="151";} stimulus_151;
sound {wavefile{filename="phrase_mix_3.wav";}; description="152";} stimulus_152;
sound {wavefile{filename="phrase_mix_4.wav";}; description="153";} stimulus_153;
sound {wavefile{filename="phrase_mix_5.wav";}; description="154";} stimulus_154;
sound {wavefile{filename="phrase_mix_6.wav";}; description="155";} stimulus_155;
sound {wavefile{filename="phrase_mix_7.wav";}; description="156";} stimulus_156;
sound {wavefile{filename="phrase_mix_8.wav";}; description="157";} stimulus_157;
sound {wavefile{filename="phrase_mix_9.wav";}; description="158";} stimulus_158;
sound {wavefile{filename="phrase_mix_10.wav";}; description="159";} stimulus_159;
sound {wavefile{filename="phrase_mix_11.wav";}; description="160";} stimulus_160;
sound {wavefile{filename="phrase_mix_12.wav";}; description="161";} stimulus_161;
sound {wavefile{filename="phrase_mix_13.wav";}; description="162";} stimulus_162;
sound {wavefile{filename="phrase_mix_14.wav";}; description="163";} stimulus_163;
sound {wavefile{filename="phrase_mix_15.wav";}; description="164";} stimulus_164;
sound {wavefile{filename="phrase_mix_16.wav";}; description="165";} stimulus_165;
sound {wavefile{filename="phrase_mix_17.wav";}; description="166";} stimulus_166;
sound {wavefile{filename="phrase_mix_18.wav";}; description="167";} stimulus_167;
sound {wavefile{filename="phrase_mix_19.wav";}; description="168";} stimulus_168;
sound {wavefile{filename="phrase_mix_20.wav";}; description="169";} stimulus_169;
sound {wavefile{filename="phrase_mix_21.wav";}; description="170";} stimulus_170;
sound {wavefile{filename="phrase_mix_22.wav";}; description="171";} stimulus_171;
sound {wavefile{filename="phrase_mix_38.wav";}; description="172";} stimulus_172;
sound {wavefile{filename="phrase_mix_39.wav";}; description="173";} stimulus_173;
sound {wavefile{filename="phrase_mix_40.wav";}; description="174";} stimulus_174;
} phrase_sentences;


#begin instructions

trial {                                    
trial_duration = forever;

	 trial_type = specific_response;
    terminator_button = 1; 
stimulus_event{picture {text {caption = "
Hello and welcome!

During this experiment you will be listening to streams of words.

Please try to sit still while you are listening.

There will be a few breaks.

In total the experiment will last about 45 minutes.

Press ENTER to continue";}; x = 0; y = 0; }instructions_a; }; 
}begin_trial_a; #beginning instructions



trial {                                    
trial_duration = forever;

	 trial_type = specific_response;
    terminator_button = 1; 
stimulus_event{picture {text {caption = "


You will listen to 150 word streams. 

The streams of words don't always make a lot of sense.
Some streams will make more sense than others.

At THE END of each stream of words you will be asked whether
you heard any phrases of at least four words.

Three example phrases are:

'ask him this thing'  
'from my old car'
'sit in that tree'

If you think you heard a four word phrase please press 'y'
at THE END of the word stream and ONLY WHEN PROMPTED.

If you didn't hear any four word phrases please press 'n'
at THE END of the word stream and ONLY WHEN PROMPTED.

Press ENTER to continue \n";}; x = 0; y = 0; }instructions_b; }; 
}begin_trial_b;


trial {
trial_duration = forever;
  trial_type = specific_response;
    terminator_button = 1; 
stimulus_event{picture {text {caption = "
We are now ready to start the experiment!

Remember, only answer 'y' or 'n' when prompted.

Answer 'y' if you heard a phrase and 'n' if you didn't.
Please don't press anything while you are listening.

Press ENTER when you are ready to begin.";}; x = 0; y = 0; }start_en; }; 
}begin_trial_c;


trial {
trial_duration = stimuli_length;  
    trial_type = first_response; 
       picture {
          text { caption = "+"; }; x = 0; y = 0;
   };
   time = 0;

	 stimulus_event {
      sound stimulus_7;
           time = 0;
           response_active = true;   
  } event1;
} main_trial;


trial{
trial_duration = forever;
trial_type = specific_response;
terminator_button = 2,3;
stimulus_event{picture {text {caption = "Did you hear any four word phrases or sentences? \n If yes, please press 'y' on the keyboard \n If no, please press 'n' on the keyboard";}; 
x=0; y=0;} instructions2;};
} make_choice;


trial{
trial_duration=250;
picture{
text{ caption = "+";};
x=0; y=0;};
}break_choice;

#trial{
#trial_duration=forever;
#trial_type = specific_response;
#terminator_button = 2,3;
#picture{
#text{ caption = "+";};
#x=0; y=0;};
#}inter_trial;

trial{
trial_duration=forever;
trial_type = specific_response;
terminator_button = 1;
picture{
text{ caption = "You can now take a break if you fancy. \n Please press ENTER when you are ready to begin again.";};
x=0; y=0;};
}inter_block;

trial{
trial_duration=30000;
picture{
text{ caption = "Well done, you are now half way through!
You can take a few minutes break.

Please feel free to move a little and make sure you're comfy.
You will be told before the next part begins.";};
x=0; y=0;};
}break_halfway;



trial {
trial_duration = forever;
  trial_type = specific_response;
    terminator_button = 1; 
stimulus_event{picture {text {caption = "
We are now ready to begin again!

Press ENTER when you are ready.";}; 
x = 0; y = 0; }resume; }; 
}resume_experiment;


trial{
trial_duration = forever;
	 trial_type = specific_response;
    terminator_button = 1
; 
stimulus_event{picture {text {caption = "This is the end of the experiment. \n \n
Well done and thank you!\n \n Call out to let us know you are done.";}; x = 0; y = 0; }Endoftest_en; }; 
}end_experiment;


begin_pcl;

array<sound> block1[0];
array<sound> block2[0];
array<sound> block3[0];
array<sound> block4[0];
array<sound> block5[0];
array<sound> block6[0];
array<sound> block7[0];
array<sound> block8[0];
array<sound> block9[0];
array<sound> block10[0];
array<sound> block11[0];
array<sound> block12[0];
array<sound> block13[0];
array<sound> block14[0];
array<sound> block15[0];
array<sound> block16[0];
array<sound> block17[0];
array<sound> block18[0];
array<sound> block19[0];
array<sound> block20[0];
array<sound> block21[0];
array<sound> block22[0];
array<sound> block23[0];
array<sound> block24[0];
array<sound> block25[0];

int number_of_trials_in_each_block = 6;
int number_of_trials_in_each_condition = 25;

array<int>
indices[25] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25}; # shuffle this for each ppt

	
block1.add(rrrV_sentences[1]);
block1.add(rrrr_sentences[1]);
block1.add(ADVP_sentences[1]);
block1.add(ANAN_sentences[1]);
block1.add(AVAV_sentences[1]);
block1.add(phrase_sentences[1]);
block2.add(rrrV_sentences[2]);
block2.add(rrrr_sentences[2]);
block2.add(ADVP_sentences[2]);
block2.add(ANAN_sentences[2]);
block2.add(AVAV_sentences[2]);
block2.add(phrase_sentences[2]);
block3.add(rrrV_sentences[3]);
block3.add(rrrr_sentences[3]);
block3.add(ADVP_sentences[3]);
block3.add(ANAN_sentences[3]);
block3.add(AVAV_sentences[3]);
block3.add(phrase_sentences[3]);
block4.add(rrrV_sentences[4]);
block4.add(rrrr_sentences[4]);
block4.add(ADVP_sentences[4]);
block4.add(ANAN_sentences[4]);
block4.add(AVAV_sentences[4]);
block4.add(phrase_sentences[4]);
block5.add(rrrV_sentences[5]);
block5.add(rrrr_sentences[5]);
block5.add(ADVP_sentences[5]);
block5.add(ANAN_sentences[5]);
block5.add(AVAV_sentences[5]);
block5.add(phrase_sentences[5]);
block6.add(rrrV_sentences[6]);
block6.add(rrrr_sentences[6]);
block6.add(ADVP_sentences[6]);
block6.add(ANAN_sentences[6]);
block6.add(AVAV_sentences[6]);
block6.add(phrase_sentences[6]);
block7.add(rrrV_sentences[7]);
block7.add(rrrr_sentences[7]);
block7.add(ADVP_sentences[7]);
block7.add(ANAN_sentences[7]);
block7.add(AVAV_sentences[7]);
block7.add(phrase_sentences[7]);
block8.add(rrrV_sentences[8]);
block8.add(rrrr_sentences[8]);
block8.add(ADVP_sentences[8]);
block8.add(ANAN_sentences[8]);
block8.add(AVAV_sentences[8]);
block8.add(phrase_sentences[8]);
block9.add(rrrV_sentences[9]);
block9.add(rrrr_sentences[9]);
block9.add(ADVP_sentences[9]);
block9.add(ANAN_sentences[9]);
block9.add(AVAV_sentences[9]);
block9.add(phrase_sentences[9]);
block10.add(rrrV_sentences[10]);
block10.add(rrrr_sentences[10]);
block10.add(ADVP_sentences[10]);
block10.add(ANAN_sentences[10]);
block10.add(AVAV_sentences[10]);
block10.add(phrase_sentences[10]);
block11.add(rrrV_sentences[11]);
block11.add(rrrr_sentences[11]);
block11.add(ADVP_sentences[11]);
block11.add(ANAN_sentences[11]);
block11.add(AVAV_sentences[11]);
block11.add(phrase_sentences[11]);
block12.add(rrrV_sentences[12]);
block12.add(rrrr_sentences[12]);
block12.add(ADVP_sentences[12]);
block12.add(ANAN_sentences[12]);
block12.add(AVAV_sentences[12]);
block12.add(phrase_sentences[12]);
block13.add(rrrV_sentences[13]);
block13.add(rrrr_sentences[13]);
block13.add(ADVP_sentences[13]);
block13.add(ANAN_sentences[13]);
block13.add(AVAV_sentences[13]);
block13.add(phrase_sentences[13]);
block14.add(rrrV_sentences[14]);
block14.add(rrrr_sentences[14]);
block14.add(ADVP_sentences[14]);
block14.add(ANAN_sentences[14]);
block14.add(AVAV_sentences[14]);
block14.add(phrase_sentences[14]);
block15.add(rrrV_sentences[15]);
block15.add(rrrr_sentences[15]);
block15.add(ADVP_sentences[15]);
block15.add(ANAN_sentences[15]);
block15.add(AVAV_sentences[15]);
block15.add(phrase_sentences[15]);
block16.add(rrrV_sentences[16]);
block16.add(rrrr_sentences[16]);
block16.add(ADVP_sentences[16]);
block16.add(ANAN_sentences[16]);
block16.add(AVAV_sentences[16]);
block16.add(phrase_sentences[16]);
block17.add(rrrV_sentences[17]);
block17.add(rrrr_sentences[17]);
block17.add(ADVP_sentences[17]);
block17.add(ANAN_sentences[17]);
block17.add(AVAV_sentences[17]);
block17.add(phrase_sentences[17]);
block18.add(rrrV_sentences[18]);
block18.add(rrrr_sentences[18]);
block18.add(ADVP_sentences[18]);
block18.add(ANAN_sentences[18]);
block18.add(AVAV_sentences[18]);
block18.add(phrase_sentences[18]);
block19.add(rrrV_sentences[19]);
block19.add(rrrr_sentences[19]);
block19.add(ADVP_sentences[19]);
block19.add(ANAN_sentences[19]);
block19.add(AVAV_sentences[19]);
block19.add(phrase_sentences[19]);
block20.add(rrrV_sentences[20]);
block20.add(rrrr_sentences[20]);
block20.add(ADVP_sentences[20]);
block20.add(ANAN_sentences[20]);
block20.add(AVAV_sentences[20]);
block20.add(phrase_sentences[20]);
block21.add(rrrV_sentences[21]);
block21.add(rrrr_sentences[21]);
block21.add(ADVP_sentences[21]);
block21.add(ANAN_sentences[21]);
block21.add(AVAV_sentences[21]);
block21.add(phrase_sentences[21]);
block22.add(rrrV_sentences[22]);
block22.add(rrrr_sentences[22]);
block22.add(ADVP_sentences[22]);
block22.add(ANAN_sentences[22]);
block22.add(AVAV_sentences[22]);
block22.add(phrase_sentences[22]);
block23.add(rrrV_sentences[23]);
block23.add(rrrr_sentences[23]);
block23.add(ADVP_sentences[23]);
block23.add(ANAN_sentences[23]);
block23.add(AVAV_sentences[23]);
block23.add(phrase_sentences[23]);
block24.add(rrrV_sentences[24]);
block24.add(rrrr_sentences[24]);
block24.add(ADVP_sentences[24]);
block24.add(ANAN_sentences[24]);
block24.add(AVAV_sentences[24]);
block24.add(phrase_sentences[24]);
block25.add(rrrV_sentences[25]);
block25.add(rrrr_sentences[25]);
block25.add(ADVP_sentences[25]);
block25.add(ANAN_sentences[25]);
block25.add(AVAV_sentences[25]);
block25.add(phrase_sentences[25]);


#block1.add(rrrV_sentences[1]);
#block1.add(rrrr_sentences[1]);
#block1.add(ADVP_sentences[1]);
#block1.add(ANAN_sentences[1]);
#block1.add(AVAV_sentences[1]);
#block1.add(phrase_sentences[1]);
#block1.add(rrrV_sentences[2]);
#block1.add(rrrr_sentences[2]);
#block1.add(ADVP_sentences[2]);
#block1.add(ANAN_sentences[2]);
#block1.add(AVAV_sentences[2]);
#block1.add(phrase_sentences[2]);
#block2.add(rrrV_sentences[3]);
#block2.add(rrrr_sentences[3]);
#block2.add(ADVP_sentences[3]);
#block2.add(ANAN_sentences[3]);
#block2.add(AVAV_sentences[3]);
#block2.add(phrase_sentences[3]);
#block2.add(rrrV_sentences[4]);
#block2.add(rrrr_sentences[4]);
#block2.add(ADVP_sentences[4]);
#block2.add(ANAN_sentences[4]);
#block2.add(AVAV_sentences[4]);
#block2.add(phrase_sentences[4]);
#block2.add(rrrV_sentences[5]);
#block3.add(rrrr_sentences[5]);
#block3.add(ADVP_sentences[5]);
#block3.add(ANAN_sentences[5]);
#block3.add(AVAV_sentences[5]);
#block3.add(phrase_sentences[5]);
#block3.add(rrrV_sentences[6]);
#block3.add(rrrr_sentences[6]);
#block3.add(ADVP_sentences[6]);
#block3.add(ANAN_sentences[6]);
#block3.add(AVAV_sentences[6]);
#block3.add(phrase_sentences[6]);
#block4.add(rrrV_sentences[7]);
#block4.add(rrrr_sentences[7]);
#block4.add(ADVP_sentences[7]);
#block4.add(ANAN_sentences[7]);
#block4.add(AVAV_sentences[7]);
#block4.add(phrase_sentences[7]);
#block4.add(rrrV_sentences[8]);
#block4.add(rrrr_sentences[8]);
#block4.add(ADVP_sentences[8]);
#block4.add(ANAN_sentences[8]);
#block4.add(AVAV_sentences[8]);
#block4.add(phrase_sentences[8]);
#block5.add(rrrV_sentences[9]);
#block5.add(rrrr_sentences[9]);
#block5.add(ADVP_sentences[9]);
#block5.add(ANAN_sentences[9]);
#block5.add(AVAV_sentences[9]);
#block5.add(phrase_sentences[9]);
#block5.add(rrrV_sentences[10]);
#block5.add(rrrr_sentences[10]);
#block5.add(ADVP_sentences[10]);
#block5.add(ANAN_sentences[10]);
#block5.add(AVAV_sentences[10]);
#block5.add(phrase_sentences[10]);
#block6.add(rrrV_sentences[11]);
#block6.add(rrrr_sentences[11]);
#block6.add(ADVP_sentences[11]);
#block6.add(ANAN_sentences[11]);
#block6.add(AVAV_sentences[11]);
#block6.add(phrase_sentences[11]);
#block6.add(rrrV_sentences[12]);
#block6.add(rrrr_sentences[12]);
#block6.add(ADVP_sentences[12]);
#block6.add(ANAN_sentences[12]);
#block6.add(AVAV_sentences[12]);
#block6.add(phrase_sentences[12]);
#block7.add(rrrV_sentences[13]);
#block7.add(rrrr_sentences[13]);
#block7.add(ADVP_sentences[13]);
#block7.add(ANAN_sentences[13]);
#block7.add(AVAV_sentences[13]);
#block7.add(phrase_sentences[13]);
#block7.add(rrrV_sentences[14]);
#block7.add(rrrr_sentences[14]);
#block7.add(ADVP_sentences[14]);
#block7.add(ANAN_sentences[14]);
#block7.add(AVAV_sentences[14]);
#block7.add(phrase_sentences[14]);
#block8.add(rrrV_sentences[15]);
#block8.add(rrrr_sentences[15]);
#block8.add(ADVP_sentences[15]);
#block8.add(ANAN_sentences[15]);
#block8.add(AVAV_sentences[15]);
#block8.add(phrase_sentences[15]);
#block8.add(rrrV_sentences[16]);
#block8.add(rrrr_sentences[16]);
#block8.add(ADVP_sentences[16]);
#block8.add(ANAN_sentences[16]);
#block8.add(AVAV_sentences[16]);
#block8.add(phrase_sentences[16]);
#block9.add(rrrV_sentences[17]);
#block9.add(rrrr_sentences[17]);
#block9.add(ADVP_sentences[17]);
#block9.add(ANAN_sentences[17]);
#block9.add(AVAV_sentences[17]);
#block9.add(phrase_sentences[17]);
#block9.add(rrrV_sentences[18]);
#block9.add(rrrr_sentences[18]);
#block9.add(ADVP_sentences[18]);
#block9.add(ANAN_sentences[18]);
#block9.add(AVAV_sentences[18]);
#block9.add(phrase_sentences[18]);
#block10.add(rrrV_sentences[19]);
#block10.add(rrrr_sentences[19]);
#block10.add(ADVP_sentences[19]);
#block10.add(ANAN_sentences[19]);
#block10.add(AVAV_sentences[19]);
#block10.add(phrase_sentences[19]);
#block10.add(rrrV_sentences[20]);
#block10.add(rrrr_sentences[20]);
#block10.add(ADVP_sentences[20]);
#block10.add(ANAN_sentences[20]);
#block10.add(AVAV_sentences[20]);
#block10.add(phrase_sentences[20]);
#block11.add(rrrV_sentences[21]);
#block11.add(rrrr_sentences[21]);
#block11.add(ADVP_sentences[21]);
#block11.add(ANAN_sentences[21]);
#block11.add(AVAV_sentences[21]);
#block11.add(phrase_sentences[21]);
#block11.add(rrrV_sentences[22]);
#block11.add(rrrr_sentences[22]);
#block11.add(ADVP_sentences[22]);
#block11.add(ANAN_sentences[22]);
#block11.add(AVAV_sentences[22]);
#block11.add(phrase_sentences[22]);
#block12.add(rrrV_sentences[23]);
#block12.add(rrrr_sentences[23]);
#block12.add(ADVP_sentences[23]);
#block12.add(ANAN_sentences[23]);
#block12.add(AVAV_sentences[23]);
#block12.add(phrase_sentences[24]);
#block12.add(rrrV_sentences[24]);
#block12.add(rrrr_sentences[24]);
#block12.add(ADVP_sentences[24]);
#block12.add(ANAN_sentences[24]);
#block12.add(AVAV_sentences[24]);
#block12.add(phrase_sentences[24]);
#block13.add(rrrV_sentences[25]);
#block13.add(rrrr_sentences[25]);
#block13.add(ADVP_sentences[25]);
#block13.add(ANAN_sentences[25]);
#block13.add(AVAV_sentences[25]);
#block13.add(phrase_sentences[25]);

block1.shuffle();
block2.shuffle();
block3.shuffle();
block4.shuffle();
block5.shuffle();
block6.shuffle();
block7.shuffle();
block8.shuffle();
block9.shuffle();
block10.shuffle();
block11.shuffle();
block12.shuffle();
block13.shuffle();
block14.shuffle();
block15.shuffle();
block16.shuffle();
block17.shuffle();
block18.shuffle();
block19.shuffle();
block20.shuffle();
block21.shuffle();
block22.shuffle();
block23.shuffle();
block24.shuffle();
block25.shuffle();


sub present_block (array <sound> block[number_of_trials_in_each_block])
begin
	loop int i = 1 until i>number_of_trials_in_each_block begin
      string code = block[i].description();
		int port_code = int(code);
		term.print(code);
		event1.set_stimulus(block[i]);
      event1.set_event_code( code );
      event1.set_port_code( port_code );
      main_trial.present();
		make_choice.present();
		break_choice.present();
		i = i + 1;
	end;
end;


begin_trial_a.present();
begin_trial_b.present();
begin_trial_c.present();

present_block(block1);
present_block(block2);

inter_block.present();

present_block(block3);
present_block(block4);

inter_block.present();

present_block(block5);
present_block(block6);

inter_block.present();

present_block(block7);
present_block(block8);

inter_block.present();

present_block(block9);
present_block(block10);

inter_block.present();

present_block(block11);
present_block(block12);

break_halfway.present();
resume_experiment.present();

present_block(block13);
present_block(block14);

inter_block.present();

present_block(block15);
present_block(block16);

inter_block.present();

present_block(block17);
present_block(block18);

inter_block.present();

present_block(block19);
present_block(block20);

inter_block.present();

present_block(block21);
present_block(block22);

inter_block.present();

present_block(block23);
present_block(block24);
present_block(block25);

end_experiment.present();	