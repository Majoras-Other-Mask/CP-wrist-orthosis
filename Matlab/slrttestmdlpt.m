function pt=slrttestmdlpt
pt = [];

  
pt(1).blockname = 'Gain';
pt(1).paramname = 'Gain';
pt(1).class     = 'scalar';
pt(1).nrows     = 1;
pt(1).ncols     = 1;
pt(1).subsource = 'SS_DOUBLE';
pt(1).ndims     = '2';
pt(1).size      = '[]';
pt(1).isStruct  = false;
pt(1).symbol     = 'slrttestmdl_P.Gain_Gain';
pt(1).baseaddr   = '&slrttestmdl_P.Gain_Gain';
pt(1).dtname     = 'real_T';

pt(getlenPT) = pt(1);


  
pt(2).blockname = 'Gain1';
pt(2).paramname = 'Gain';
pt(2).class     = 'scalar';
pt(2).nrows     = 1;
pt(2).ncols     = 1;
pt(2).subsource = 'SS_DOUBLE';
pt(2).ndims     = '2';
pt(2).size      = '[]';
pt(2).isStruct  = false;
pt(2).symbol     = 'slrttestmdl_P.Gain1_Gain';
pt(2).baseaddr   = '&slrttestmdl_P.Gain1_Gain';
pt(2).dtname     = 'real_T';



  
pt(3).blockname = 'Gain2';
pt(3).paramname = 'Gain';
pt(3).class     = 'scalar';
pt(3).nrows     = 1;
pt(3).ncols     = 1;
pt(3).subsource = 'SS_DOUBLE';
pt(3).ndims     = '2';
pt(3).size      = '[]';
pt(3).isStruct  = false;
pt(3).symbol     = 'slrttestmdl_P.Gain2_Gain';
pt(3).baseaddr   = '&slrttestmdl_P.Gain2_Gain';
pt(3).dtname     = 'real_T';



  
pt(4).blockname = 'Integrator';
pt(4).paramname = 'InitialCondition';
pt(4).class     = 'scalar';
pt(4).nrows     = 1;
pt(4).ncols     = 1;
pt(4).subsource = 'SS_DOUBLE';
pt(4).ndims     = '2';
pt(4).size      = '[]';
pt(4).isStruct  = false;
pt(4).symbol     = 'slrttestmdl_P.Integrator_IC';
pt(4).baseaddr   = '&slrttestmdl_P.Integrator_IC';
pt(4).dtname     = 'real_T';



  
pt(5).blockname = 'Integrator1';
pt(5).paramname = 'InitialCondition';
pt(5).class     = 'scalar';
pt(5).nrows     = 1;
pt(5).ncols     = 1;
pt(5).subsource = 'SS_DOUBLE';
pt(5).ndims     = '2';
pt(5).size      = '[]';
pt(5).isStruct  = false;
pt(5).symbol     = 'slrttestmdl_P.Integrator1_IC';
pt(5).baseaddr   = '&slrttestmdl_P.Integrator1_IC';
pt(5).dtname     = 'real_T';



  
pt(6).blockname = 'Signal Generator';
pt(6).paramname = 'Amplitude';
pt(6).class     = 'scalar';
pt(6).nrows     = 1;
pt(6).ncols     = 1;
pt(6).subsource = 'SS_DOUBLE';
pt(6).ndims     = '2';
pt(6).size      = '[]';
pt(6).isStruct  = false;
pt(6).symbol     = 'slrttestmdl_P.SignalGenerator_Amplitude';
pt(6).baseaddr   = '&slrttestmdl_P.SignalGenerator_Amplitude';
pt(6).dtname     = 'real_T';



  
pt(7).blockname = 'Signal Generator';
pt(7).paramname = 'Frequency';
pt(7).class     = 'scalar';
pt(7).nrows     = 1;
pt(7).ncols     = 1;
pt(7).subsource = 'SS_DOUBLE';
pt(7).ndims     = '2';
pt(7).size      = '[]';
pt(7).isStruct  = false;
pt(7).symbol     = 'slrttestmdl_P.SignalGenerator_Frequency';
pt(7).baseaddr   = '&slrttestmdl_P.SignalGenerator_Frequency';
pt(7).dtname     = 'real_T';


function len = getlenPT
len = 7;

