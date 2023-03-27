# Konaka_Honda_2023


<Computing　environment>
・OS: Mac OC Catalina version10.15.7
・MATLAB (version:R2020b (9.9.0)).

These matlab codes require System Identification Toolbox.

The codes to create each figure is stored in the following three folders.
- Codes_of_Konaka_Honda_1_Main_fig
- Codes_of_Konaka_Honda_2_Extended_data_fig1-4
- Codes_of_Konaka_Honda_3_Extended_data_fig5-7

# Codes_of_Konaka_Honda_1_Main_fig

## fig2
 
 Run files named as  “A_mainfunc — ” in each folder.

## fig3
 
 Run files named as  “fig3_BC.m” and “fig3_EF.m”.

## fig5
 
 All you have to do is to run ‘A_mainfunc_fig5.m’.

 ・A_mainfunc_fig5.m
 
 This is the main function of fig5. You can draw fig5 if you run this file.
 It takes about 1 minutes.

 ・get_doyalabdata.m
 
 The file to load Doya labs data(animal_data.mat).

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・animal_data.mat
 
 This file contains a rat behavior data from Ito,Doya 2009.
  
## fig6
 
 About fig6 A-C
 
 All you have to do is to run ‘A_mainfunc_fig6ABC.m’.

 ・A_mainfunc_fig6ABC.m
 
 This is the main function of fig5. You can draw fig6A-C if you run this file.
 It takes about 1 minutes.

 ・get_doyalabdata.m
 
 The file to load Doya labs data(animal_data.mat).

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・plot_fig_iFEP.m
 
 The file for draw figure.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・animal_data.mat
 
 This file contains a rat behavior data from Ito,Doya 2009.

  
 About fig6 D-G 
 
 ・A_mainfunc_fig6DEFG.m
 
 This is the main function of fig5. You can draw fig6D-G if you run this file.
 It takes about 1 minutes.

 ・get_doyalabdata.m
 
 The file to load Doya labs data(animal_data.mat).

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・plot_fig_iFEP.m
 
 The file for draw figure.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・animal_data.mat
 
 This file contains a rat behavior data from Ito,Doya 2009.

 ・SGfilt_1D.m
 
 The file to run Savitzky-Golay filter.

# Codes_of_Konaka_Honda_2_Supplementary_data_fig1-4

 
## Supplementary fig1
 
 Run files named as  “A_mainfunc — ” in each folder.
 
## Supplementary fig2
 
 All you have to do is to run ‘A_mainfunc_figE3.m’.
 
 ・A_mainfunc_figS2.m
 
 This is the main function of figE3. You can draw figE3 if you run this file.
 It takes about 1 minutes.

 ・get_para_FEP.m
 
 The file to set parameters for ReCU model.

 ・get_para_iFEP.m
 
 The file to set parameters for iFEP.

 ・run_FEP.m
 
 The file to run ReCU model.

 ・run_iFEP.m
 
 The file to to run iFEP.

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・plot_fig_iFEP.m
 
 The file to draw figure.


## Supplementary fig3

 All you have to do is to run ‘A_mainfunc_figS3.m’.

 ・A_mainfunc_figS3.m
 
 This is the main function of figE3. You can draw figE3 if you run this file.
 It takes about 1 minutes.

 ・get_epsilon_option.m
 
 The file to set epsilon.

 ・get_para_FEP.m
 
 The file to set parameters for ReCU model.

 ・get_para_iFEP.m
 
 The file to set parameters for iFEP.

 ・run_FEP.m
 
 The file to run ReCU model.

 ・run_iFEP.m
 
 The file to to run iFEP.

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・plot_fig_iFEP.m
 
 The file to draw figure.


## Supplementary fig4
 
 Run "A_main_func_figS4.m".
 
# Codes_of_Konaka_Honda_2_Supplementary_data_fig5-8
 
## Supplementary fig5
 
 All you have to do is to run ‘A_mainfunc_figS5.m’.

 ・A_mainfunc_figS5.m
 
 This is the main function of figE3. You can draw figE3 if you run this file.
 It takes about 1 minutes.

 ・get_para_FEP.m
 
 The file to set parameters for ReCU model.

 ・get_para_iFEP.m
 
 The file to set parameters for iFEP.

 ・run_FEP.m
 
 The file to run ReCU model.

 ・run_iFEP.m
 
 The file to to run iFEP.

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・plot_fig_iFEP.m 
 
 The file to draw figure.
 
## Supplementary fig6
 
 All you have to do is to run ‘A_mainfunc_figS6.m’.

 ・A_mainfunc_figS6.m
 
 This is the main function of figE7. You can draw fig5 if you run this file.
 It takes about 1 minutes.

 ・get_doyalabdata.m
 
 The file to load Doya labs data(animal_data.mat).

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・animal_data.mat
 
 This file contains a rat behavior data from Ito,Doya 2009.

## Supplementary fig7
 
 ・A_mainfunc_fig7.m
 
 This is the main function of figS7. You can draw figS7 if you run this file.
 It takes about 1 minutes.

 ・get_doyalabdata.m
 
 The file to load Doya labs data(animal_data.mat).

 ・get_para_iFEP.m
 
 The file for setting parameters for iFEP.

 ・get_para_iQL.m
 
 The file for setting parameters for iQL.

 ・run_iFEP.m
 
 The file for running iFEP.

 ・run_iQL.m
 
 The file for running iQL.

 ・state_transition.m
 
 This file describes probabilities of state transition in state space model.

 ・likelihood.m
 
 This file describes likelihood of observation in state space model.

 ・run_smoother.m
 
 This is for smoother after particle filter.

 ・animal_data.mat
 
 This file contains a rat behavior data from Ito,Doya 2009.
 
 
 
## Supplementary fig8

 Run "A_mainfunc_figS8.m".
