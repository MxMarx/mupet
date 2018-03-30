% ------------------------------------------------------------------------
% Copyright (C) 2015 University of Southern California, SAIL, U.S.
% Author: Maarten Van Segbroeck
% Mail: mvansegbroeck@gmail.com
% Date: 08-22-2017
% ------------------------------------------------------------------------

function varargout = mupet(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mupet_OpeningFcn, ...
                   'gui_OutputFcn',  @mupet_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
delete(findall(0,'tag','Msgbox_MUPET info'));
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

end

% End initialization code - DO NOT EDIT
%%%
%%% MUPET INITIALIZATION
%%%
function mupet_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for mupet
handles.output = hObject;
% add path
% addpath util;
% Initalize mupet
handles=mupet_initialize(handles);
% Update handles structure
guidata(hObject, handles);
end

function varargout = mupet_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;
end

%%%
%%% AUDIO FILES
%%%
% function selectAudioFiles_Callback(hObject, eventdata, handles)
% handles=load_wavfiles(handles);
% guidata(hObject, handles);
% end

% MOVED AND RENAMED TO: editAudioSettings_Callback
% function edit_settings_Callback(hObject, eventdata, handles)
% create_configfile(handles);
% edit(handles.configfile);
% end

% function load_settings_Callback(hObject, eventdata, handles)
% create_configfile(handles);
% handles=load_configfile(handles);
% guidata(hObject, handles);
% end

% function default_settings_Callback(hObject, eventdata, handles)
% default_configfile(handles);
% end

% function wav_list_Callback(hObject, eventdata, handles)
% end

% function noisereduction_Callback(hObject, eventdata, handles)
% handles=noise_reduction(hObject, handles);
% guidata(hObject, handles);
% end

% function process_file_Callback(hObject, eventdata, handles)
% handles=processAudioFile(handles);
% guidata(hObject, handles);
% end

% function ignore_file_Callback(hObject, eventdata, handles)
% handles=ignoreFile_Callback(handles);
% guidata(hObject, handles);
% end

% function processAllAudio_Callback(hObject, eventdata, handles)
% handles=process_all_files(handles);
% guidata(hObject, handles);
% end

% function file_report_Callback(hObject, eventdata, handles)
% fileReport_Callback(handles);
% end

% function wav_list_CreateFcn(hObject, eventdata, handles)
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% end

% function process_restart_Callback(hObject, eventdata, handles)
% processRestart_Callback(handles);
% end

%%%
%%% SYLLABLE INSPECTOR
%%%
% function syllable_slider_Callback(hObject, eventdata, handles)
% move_syllable_slider(handles);
% end

% function syllable_slider_CreateFcn(hObject, eventdata, handles)
% if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor',[.9 .9 .9]);
% end
% end

%%%
%%% DATASETS
%%%
% function create_dataset_Callback(hObject, eventdata, handles)
% create_dataset(handles);
% end

% function print_content_Callback(hObject, eventdata, handles)
% printContent(handles);
% end

% function dataset_list_Callback(hObject, eventdata, handles)
% end

% function datasetList_CreateFcn(hObject, eventdata, handles)
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% end

% function refresh_datasets_Callback(hObject, eventdata, handles)
% refreshDatasets(handles);
% end

% function delete_dataset_Callback(hObject, eventdata, handles)
% delete_datasets(handles);
% end

% function datasetName_Callback(hObject, eventdata, handles)
% end

% function datasetName_CreateFcn(hObject, eventdata, handles)
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% end

%%%
%%% USV PROFILE
%%%

% function show_psd_Callback(hObject, eventdata, handles)
% show_psd_curve(handles);
% end

% function show_freq_bandwidth_Callback(hObject, eventdata, handles)
% showFreqBandwidth(handles);
% end

% function show_vocalization_time_Callback(hObject, eventdata, handles)
% showVocalizationTime(handles);
% end

% function syllable_rate_Callback(hObject, eventdata, handles)
% show_syllable_counts(handles);
% end

% function syllable_duration_Callback(hObject, eventdata, handles)
% show_syllable_duration(handles);
% end

% function syllable_distance_Callback(hObject, eventdata, handles)
% show_syllable_distance(handles);
% end

% function print_dataset_stats_Callback(hObject, eventdata, handles)
% export_csv_dataset_stats(handles);
% end

%%%
%%% REPERTOIRES
%%%

% function build_repertoire_Callback(hObject, eventdata, handles)
% buildRepertoire(handles);
% end

% function nbunits_Callback(hObject, eventdata, handles)
% set_nbUnits(handles);
% end

% function nbunits_CreateFcn(hObject, eventdata, handles)
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% end

% function repertoire_list_Callback(hObject, eventdata, handles)
% end

% function repertoire_list_CreateFcn(hObject, eventdata, handles)
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% end

% function refresh_repertoires_Callback(hObject, eventdata, handles)
% refreshRepertoires(handles);
% end

% function delete_repertoire_Callback(hObject, eventdata, handles)
% delete_repertoires(handles);
% end
% 
% function export_repertoires_Callback(hObject, eventdata, handles)
% exportRepertoires(handles);
% end

%%%
%%% REPERTOIRE PROFILE
%%%

function show_repertoire_Callback(hObject, eventdata, handles)
show_repertoire(handles);
end

function refine_repertoire_Callback(hObject, eventdata, handles)
refine_repertoire(handles);
end

function categories_Callback(hObject, eventdata, handles)
end

function categories_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function syllable_category_counts_Callback(hObject, eventdata, handles)
syllable_category_counts(handles);
end

% REPERTOIRE COMPARISON

function select_repertoire_A_Callback(hObject, eventdata, handles)
select_repertoire(handles);
end

function compare_A_against_all_repertoires_match_Callback(hObject, eventdata, handles)
compare_A_against_all_repertoires_match(handles);
end

function compare_A_against_all_repertoires_activity_Callback(hObject, eventdata, handles)
compare_A_against_all_repertoires_activity(handles)
end

%%%
%%% UTILITY FUNCTIONS - MUPET INITIALIZATION
%%%

function handles=mupet_initialize(handles)
    %add 'utils' path
    addpath(genpath('./utils'))
    addpath(genpath('./gui_setup'))
    addpath(genpath('./core'))
    handles.flist='';
    handles.datadir='';
    handles.repertoiredir='repertoires';
    handles.datasetdir='datasets';
    handles.denoising=false;

    % feature extraction
    handles.feature_ext_segment_duration=10; % seconds
    handles.frame_shift_ms=0.0004*4; % ms
    handles.frame_win_ms=0.002; % ms

    % syllable detection
    handles.syllable_stats='';
    handles.sample_frequency=0;
    handles.filename='';
    handles.max_inter_syllable_distance=200;
    handles.psd_smoothing_window_freq=10;

    % repertoire learning
    handles.repertoire_learning_min_nb_syllables_fac=1;
    handles.repertoire_unit_size_seconds=200;
    handles.patch_window=handles.repertoire_unit_size_seconds/handles.frame_shift_ms*1e-3; % ms divided by frameshift

    % user interface
    makeurl(handles.wiki,'https://github.com/mvansegbroeck/mupet/wiki/MUPET-wiki');
    makeurl(handles.code,'https://github.com/mvansegbroeck/mupet/');
    defaultFigPos=get(0,'DefaultFigurePosition');
    set(0,'DefaultFigurePosition',[1 defaultFigPos(2) defaultFigPos(3) defaultFigPos(4)]);
    [handles.FontSize1, handles.FontSize2, handles.FontSize3, handles.FontSize4]=setGuiFonts(handles);
    set(handles.syllableSlider,'Visible','off');
    set(handles.syllable_axes_fft,'Visible','off');
    set(handles.syllable_axes_gt,'Visible','off');
%     set(handles.noisereduction,'Visible','off');
    set(handles.nbunits,'Value',4);
    units=get(handles.nbunits,'String');
    NbUnits=str2double(units(get(handles.nbunits,'Value')));
    repertoire_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i.mat',NbUnits)));
    repertoire_refined_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i*+.mat',NbUnits)));
    repertoire_content(end+1:end+length(repertoire_refined_content))=repertoire_refined_content;
    set(handles.repertoireList,'string',{repertoire_content.name});
    datasetNames=dir(fullfile(handles.datasetdir,'*.mat'));
    set(handles.datasetList,'string',strrep({datasetNames.name},'.mat',''));

    % title
    mupet_title='MUPET v2.0';
    set(handles.mupet_title,'String',mupet_title,'Fontsize',handles.FontSize4)

    % config file
    handles.configdefault{1}=5; % noise_reduction_sigma_default
    handles.configdefault{2}=8; % min_syllable_duration_default
    handles.configdefault{3}=handles.repertoire_unit_size_seconds; % max_syllable_duration_default
    handles.configdefault{4}=-15; % min_syllable_total_energy_default
    handles.configdefault{5}=-25; % min_syllable_peak_amplitude_default
    handles.configdefault{6}=5; % min_syllable_distance_default
    handles.configfile=fullfile(pwd,'config.csv');
    handles = create_configfile(handles, true)

end

%%%
%%% UTILITY FUNCTIONS - REPERTOIRES
%%%

% buildRepertoire
function build_repertoire(handles)
    dataset_items=get(handles.datasetList,'string');
    selected_dataset=get(handles.datasetList,'value');
    if isempty(dataset_items)
        errordlg('Please create a dataset first.','No dataset created');
    else
        load(fullfile(handles.datasetdir,sprintf('%s.mat',dataset_items{selected_dataset})),'dataset_dir');
        units=get(handles.nbunits,'String');
        NbUnits=str2double(units(get(handles.nbunits,'Value')));
        datasetName=dataset_items{selected_dataset};
        [~,repertoireName]=fileparts(sprintf('%s.mat',datasetName));
        repertoireFile=fullfile(handles.repertoiredir,sprintf('%s_N%i.mat',repertoireName,NbUnits));
        if ~exist(repertoireFile,'file')
            [bases, activations, bic, logL, syllable_similarity, syllable_correlation, repertoire_similarity, err, NbChannels, NbPatternFrames, NbUnits, NbIter, ndx_V] = repertoire_learning(handles,datasetName,NbUnits);
            if isempty(bases)
                errordlg('Repertoire learning stopped. Too few syllables were detected in the audio data.','repertoire error');
            else
                if ~exist(handles.repertoiredir,'dir')
                    mkdir(handles.repertoiredir);
                end
                save(repertoireFile,'bases','activations','bic','logL','syllable_similarity','syllable_correlation','repertoire_similarity','NbUnits','NbChannels','NbPatternFrames','NbUnits','NbIter','dataset_dir','ndx_V','datasetName','-v6');
            end
        else
            errordlg('Requested repertoire exist. Delete first for rebuild.','Repertoire exist');
        end
        repertoire_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i.mat',NbUnits)));
        repertoire_refined_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i*+.mat',NbUnits)));
        repertoire_content(end+1:end+length(repertoire_refined_content))=repertoire_refined_content;
        set(handles.repertoireList,'value',1);
        set(handles.repertoireList,'string',{repertoire_content.name});
        categoriesel=cellfun(@num2str,mat2cell([5:5:length(repertoire_content)*NbUnits]',ones(length(repertoire_content)*NbUnits/5,1)),'un',0);
        if ~isempty(categoriesel)
            set(handles.categories,'string',categoriesel);
        end
    end
end

% set_nbUnits
function set_nbUnits(handles)
    units=get(handles.nbunits,'String');
    NbUnits=str2double(units(get(handles.nbunits,'Value')));
    repertoire_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i.mat',NbUnits)));
    repertoire_refined_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i*+.mat',NbUnits)));
    repertoire_content(end+1:end+length(repertoire_refined_content))=repertoire_refined_content;
    categoriesel=cellfun(@num2str,mat2cell([5:5:length(repertoire_content)*NbUnits]',ones(length(repertoire_content)*NbUnits/5,1)),'un',0);
    if ~isempty(categoriesel)
        set(handles.categories,'string',categoriesel);
    end
    set(handles.repertoireList,'value',1);
    set(handles.repertoireList,'string',{repertoire_content.name});
    set(handles.selected_repertoire_A,'string','');
end

% refreshRepertoires
function refresh_repertoires(handles)
    units=get(handles.nbunits,'String');
    NbUnits=str2double(units(get(handles.nbunits,'Value')));
    repertoire_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i.mat',NbUnits)));
    repertoire_refined_content=dir(fullfile(handles.repertoiredir,sprintf('*_N%i*+.mat',NbUnits)));
    repertoire_content(end+1:end+length(repertoire_refined_content))=repertoire_refined_content;
    categoriesel=cellfun(@num2str,mat2cell([5:5:length(repertoire_content)*NbUnits]',ones(length(repertoire_content)*NbUnits/5,1)),'un',0);
    if ~isempty(categoriesel)
        set(handles.categories,'string',categoriesel);
    end
    set(handles.repertoireList,'string',sort({repertoire_content.name}));
    set(handles.selected_repertoire_A,'string','');
end

% delete_repertoires
function delete_repertoires(handles)
    repertoire_items=get(handles.repertoireList,'string');
    selected_repertoire=get(handles.repertoireList,'value');
    if ~isempty(repertoire_items)
        delete(fullfile(handles.repertoiredir,repertoire_items{selected_repertoire}));
        ndx_delete=strcmp(repertoire_items,repertoire_items{selected_repertoire});
        repertoire_items(ndx_delete)=[];
        repertoire_content=strcat(handles.repertoiredir,'/',repertoire_items);
        units=get(handles.nbunits,'String');
        NbUnits=str2double(units(get(handles.nbunits,'Value')));
        categoriesel=cellfun(@num2str,mat2cell([5:5:length(repertoire_content)*NbUnits]',ones(length(repertoire_content)*NbUnits/5,1)),'un',0);
        if ~isempty(categoriesel)
            set(handles.categories,'string',categoriesel);
        end
        set(handles.repertoireList,'value',1);
        set(handles.repertoireList,'string',repertoire_items);
    end
    set(handles.selected_repertoire_A,'string','');
end

% exportRepertoires
function export_repertoires(handles)
    repertoire_content=dir(fullfile(handles.repertoiredir,sprintf('*_N*.mat')));
    repertoire_items={repertoire_content.name};
    repertoire_items = sort_nat(repertoire_items);
    if isempty(repertoire_items)
        errordlg('Please create a repertoire first.','No repertoire created');
    else
        export_csv_repertoires(handles,repertoire_items);
        export_csv_model_stats_repertoires(handles,repertoire_items);
        msgbox(sprintf('***              All repertoires exported to CSV files              ***\n See folder %s/CSV',handles.repertoiredir),'MUPET info');
    end
end

%%%
%%% UTILITY FUNCTIONS - REPERTOIRE COMPARISON
%%%

% select_repertoire
function select_repertoire(handles)
    repertoire_items=get(handles.repertoireList,'string');
    selected_repertoire=get(handles.repertoireList,'value');
    if isempty(repertoire_items)
        errordlg('Please create a repertoire first.','No repertoire created');
    else
        set(handles.selected_repertoire_A,'string',repertoire_items{selected_repertoire});
    end
end

% compare_A_against_all_repertoires_match
function compare_A_against_all_repertoires_match(handles)
    repertoire_A=get(handles.selected_repertoire_A,'string');
    repertoire_items=get(handles.repertoireList,'string');
    if isempty(repertoire_A)
        errordlg('Please select base repertoire A.','Select repertoire');
    else
        if length(repertoire_items)<2
            errordlg('Please compare between multiple repertoires.','Create more repertoires');
        else
            compare_repertoires_match(handles,repertoire_items,repertoire_A);
        end
    end
    set(handles.selected_repertoire_A,'string','');
end

% compare_A_against_all_repertoires_activity
function compare_A_against_all_repertoires_activity(handles)
    repertoire_A=get(handles.selected_repertoire_A,'string');
    repertoire_items=get(handles.repertoireList,'string');
    if isempty(repertoire_A)
        errordlg('Please select base repertoire A.','Select repertoire');
    else
        if length(repertoire_items)<2
           errordlg('Please compare between multiple repertoires.','Create more repertoires');
        else
           repertoire_items=get(handles.repertoireList,'string');
           compare_repertoires_activity(handles,repertoire_items,repertoire_A);
        end
    end
    set(handles.selected_repertoire_A,'string','');
end

%%%
%%% UTILITY FUNCTIONS - REPERTOIRE PROFILE
%%%

% show_repertoire
function show_repertoire(handles)
    repertoire_items=get(handles.repertoireList,'string');
    selected_repertoire=get(handles.repertoireList,'value');
    if isempty(repertoire_items)
        errordlg('Please create a repertoire first.','No repertoire created');
    else
        show_repertoire_figures(handles,repertoire_items{selected_repertoire});
    end
end

% refine_repertoire
function refine_repertoire(handles)
    repertoire_items=get(handles.repertoireList,'string');
    selected_repertoire=get(handles.repertoireList,'value');
    if isempty(repertoire_items)
        errordlg('Please create a repertoire first.','No repertoire created');
    else
        refine_selected_repertoire(handles,repertoire_items{selected_repertoire});
    end
    refresh_datasets(handles);
    refresh_repertoires(handles);
end

% syllable_category_counts
function syllable_category_counts(handles)
    repertoire_items=get(handles.repertoireList,'string');
    categories=get(handles.categories,'String');
    NbCategories=str2double(categories(get(handles.categories,'Value')));
    if isempty(repertoire_items)
        errordlg('Please create a repertoire first.','No repertoire created');
    else
        show_syllable_category_counts(handles,repertoire_items,NbCategories);
    end
end

%%%
%%% UTILITY FUNCTION - LEVEL DOWN
%%%

% make_url
function makeurl(h,url,varargin)

    FOREGROUNDCOLOR = 'b';
    CLICKEDCOLOR    = 'b';

    if nargin < 2, error('Not enough input arguments.'); end
    if ~strcmp(get(h,'style'),'text'), error('The UICONTROL h must be of style text.'); end
    if exist('varargin','var')
       L = length(varargin);
       if rem(L,2) ~= 0, error('Parameters/Values must come in pairs.'); end
       for i = 1:2:L
          switch lower(varargin{i}(1))
          case 'f', FOREGROUNDCOLOR = varargin{i+1};
          case 'c',    CLICKEDCOLOR = varargin{i+1};
          end
       end
    end

    if ischar(CLICKEDCOLOR), CLICKEDCOLOR = ['''' CLICKEDCOLOR '''']; end

    OldUnits = get(h,'Units'); set(h,'Units','pixels');
    Ext   = get(h,'Extent');
    Pos   = get(h,'Pos');
    Horiz = get(h,'HorizontalAlignment');

    ButtonDownFcn =  ...
       ['set([gcbo getappdata(gcbo,''hFrame'')],''ForeGroundColor'', ' CLICKEDCOLOR ');'];
    ButtonDownFcn = [ ButtonDownFcn 'web(''' url ''',''-browser'');' ];
    set(h,'ForegroundColor',FOREGROUNDCOLOR, ...
       'ButtonDownFcn',ButtonDownFcn,'Enable','Inactive','Units',OldUnits);

end

% setGuiFonts
function [FontSize1, FontSize2, FontSize3, FontSize4]=setGuiFonts(handles)
    % make all fonts bigger on a mac-osx computer
    persistent fontDefault
    fontDefault = [];
    FontSize1=10;
    FontSize2=9;
    FontSize3=8;
    FontSize4=24;
    FontSize5=16;
    if isempty(fontDefault)
        if ismac()
            FontSize1=FontSize1*1.15;
            FontSize2=FontSize2*1.15;
            FontSize3=FontSize3*1.25;
            FontSize4=FontSize4*1.25;
            FontSize5=FontSize5*1.25;
        end
        if ispc()
            FontSize1=FontSize1*.9;
            FontSize2=FontSize2*.9;
            FontSize3=FontSize3*.9;
            FontSize4=FontSize4*.9;
            FontSize5=FontSize5*.9;
        end
        for afield = fieldnames(handles)'
            afield = afield{1}; %#ok<FXSET>
            try %#ok<TRYNC>
                if ismac()
                    set(handles.(afield),'FontSize',FontSize1);
                    if ~isempty(handles.(afield).String)
                        if strcmp(handles.(afield).String,'MUPET')
                        set(handles.(afield),'FontSize',FontSize4);
                        elseif strcmp(handles.(afield).String,'Mice Ultrasonic Profile ExTractor')
                        set(handles.(afield),'FontSize',FontSize5);
                        end
                    end
                    % decrease font size
%                     bgc=get(handles.(afield),'BackgroundColor');
%                     if (sum(fix(bgc*1e5)==[92549 83921 83921])+sum(fix(bgc*1e5)==[70196 78039 100000]))>1
%                         set(handles.(afield),'BackgroundColor',[1 1 1]);
%                     end
                end
                if ispc()
                    set(handles.(afield),'FontSize',FontSize1);
                    if ~isempty(handles.(afield).String)
                        if strcmp(handles.(afield).String,'MUPET')
                        set(handles.(afield),'FontSize',FontSize4);
                        elseif strcmp(handles.(afield).String,'Mice Ultrasonic Profile ExTractor')
                        set(handles.(afield),'FontSize',FontSize5);
                        end
                    end
                    % decrease font size
%                     bgc=get(handles.(afield),'BackgroundColor');
%                     if (sum(fix(bgc*1e5)==[92549 83921 83921])+sum(fix(bgc*1e5)==[70196 78039 100000]))>1
%                         set(handles.(afield),'BackgroundColor',[1 1 1]);
%                     end
                end
                set(handles.(afield),'FontName','default'); % decrease font size
            end
        end
        fontDefault=1; % do not perform this step again.
    end
end








% export_csv_model_stats_repertoires
function export_csv_model_stats_repertoires(handles, repertoireNames)

    csvdir=fullfile(handles.repertoiredir,'CSV');
    if ~exist(csvdir,'dir')
      mkdir(csvdir)
    end

    % csv header
    csv_header=sprintf('%s,%s,%s,%s\n', ...
        'repertoire name', ...
        'overall repertoire modeling score', ...
        'average log-likelihood', ...
        'Bayesian Information Criterion (BIC)');

    csvfile=fullfile(csvdir, 'repertoire_modeling_info.csv');
    fid = fopen(csvfile,'wt');
    fwrite(fid, csv_header);

    for repertoireID = 1:length(repertoireNames)
        repertoireName=repertoireNames{repertoireID};
        repertoire_filename=fullfile(handles.repertoiredir,repertoireName);

        % load
        load(repertoire_filename,'bic','logL','repertoire_similarity');

        repertoire_info=sprintf('%s,%.3f,%.1f,%.1f\n', ...
                strrep(repertoireName,'.mat',''), ...
                repertoire_similarity(1), ...
                logL, ...
                bic);
        fwrite(fid, repertoire_info);
    end
    fclose(fid);
end

% export_csv_repertoires
function export_csv_repertoires(handles,repertoireNames)

    csvdir=fullfile(handles.repertoiredir,'CSV');
    if ~exist(csvdir,'dir')
      mkdir(csvdir)
    end

    % csv header
    csv_header=sprintf('%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n', ...
        'repertoire unit (RU) number', ...
        'number of syllables', ...
        'syllable-to-centroid distance (mean)', ...
        'syllable-to-centroid distance (std)', ...
        'syllable-to-centroid correlation (mean)', ...
        'syllable-to-centroid correlation (std)', ...
        'final freq - start freq (+/- kHz)', ...
        'mean freq - start freq (+/- kHz)', ...
        'mean freq - final freq (+/- kHz)', ...
        'average frequency bandwidth (kHz)', ...
        'RU duration (msec)');
    csv_header1=sprintf('%s,%s,%s,%s,%s,%s\n', ...
        'dataset', ...
        'repertoire file', ...
        'syllable number', ...
        'syllable start time (sec)', ...
        'syllable end time (sec)', ...
        'repertoire unit (RU) number');

    for repertoireID = 1:length(repertoireNames)
        repertoireName=repertoireNames{repertoireID};
        repertoire_filename=fullfile(handles.repertoiredir,repertoireName);

        fprintf('Exporting repertoire %s \n', strrep(repertoireName,'.mat','') );

        % load
        load(repertoire_filename,'activations','NbUnits','ndx_V','datasetName','bic','logL','syllable_similarity','syllable_correlation','repertoire_similarity');
        H=activations';

        [number_of_calls]=hist(H,NbUnits);
        %[percentage_of_calls,~]=sort(number_of_calls./sum(number_of_calls)*100,'descend');
        number_of_calls=sort(number_of_calls,'descend');

        csvfile=fullfile(csvdir, strrep(repertoireName,'.mat','.csv'));
        fid = fopen(csvfile,'wt');
        fwrite(fid, csv_header);

        csvfile1=fullfile(csvdir, strrep(repertoireName,'.mat','_syllable_sequence.csv'));
        fid1 = fopen(csvfile1,'wt');
        fwrite(fid1, csv_header1);

        % Gammatone features data
        datasetfile = fullfile(handles.datasetdir,datasetName);
        if ~exist(sprintf('%s.mat', datasetfile),'file')
            datasetfile = fullfile(handles.datasetdir,sprintf('%s+',datasetName));
        end
        load(datasetfile,'dataset_content','dataset_dir','fs');
        flist=dataset_content;

        % Accumulate GT sonogram frames
        freq_start=[];
        freq_final=[];
        freq_min=[];
        freq_max=[];
        freq_mean=[];
        freq_bw=[];
        syl_tot_en=[];
        syl_dur=[];
        syl_cnts=0;
        repertoire_unit_sequence=cell(length(flist),1);
        fnameID = 1;
        for fname = flist
             [~, filename]= fileparts(fname{1});
             syllable_file=fullfile(dataset_dir, sprintf('%s.mat', filename));

             if exist(syllable_file,'file'),
                fprintf('Loading MUSV of %s\n', filename);

                load(syllable_file,'syllable_stats');
                nb_syllables = size(syllable_stats,2);
                repertoire_unit_sequence{fnameID} = activations(syl_cnts+1:syl_cnts + nb_syllables);
                syl_cnts = syl_cnts + size(syllable_stats,2);
                if ~strcmp(repertoire_filename(end-4:end),'+.mat') && strcmp(datasetfile(end),'+'),
                    load(syllable_file,'syllable_stats_orig');
                    syllable_stats=syllable_stats_orig;
                end

                freq_start=[freq_start syllable_stats{2,:}];
                freq_final=[freq_final syllable_stats{3,:}];
                freq_min=[freq_min syllable_stats{4,:}];
                freq_max=[freq_max syllable_stats{5,:}];
                freq_bw=[freq_bw syllable_stats{6,:}];
                freq_mean=[freq_mean syllable_stats{10,:}];
                syl_tot_en=[syl_tot_en syllable_stats{11,:}];
                syl_dur=[syl_dur syllable_stats{13,:}];

             else
                continue;
             end

             for syllableID = 1:nb_syllables
                 syllable_seq_info=sprintf('%s,%s,%i,%.4f,%.4f,%i\n', ...
                     datasetName, ...
                     filename, ...
                     syllableID, ...
                     syllable_stats{8,syllableID}, ...
                     syllable_stats{9,syllableID}, ...
                     repertoire_unit_sequence{fnameID}(syllableID));
                fwrite(fid1, syllable_seq_info);
             end

             fnameID = fnameID + 1;
        end
        fclose(fid1);

        plus_sign={'','+'};
        for unitID = 1:length(number_of_calls)

            % final - start
            % if final>>start and mean frequency between (upward)
            % if final<<start and mean frequency between (upward)
            % if final~=start and mean frequency between and bandwidth small (flat)
            % ...
            freq_final_minus_start=freq_final(ndx_V{unitID})-freq_start(ndx_V{unitID});
            [tmp1,tmp2]=hist(freq_final_minus_start,5); [tmp3,tmp4]=max(tmp1); freq_final_minus_start_avg=tmp2(tmp4);

            freq_mean_minus_start=freq_mean(ndx_V{unitID})-freq_start(ndx_V{unitID});
    %         [tmp1,tmp2]=hist(freq_mean_minus_start,5); [tmp3,tmp4]=max(tmp1); freq_mean_minus_start_avg=tmp2(tmp4);
            freq_mean_minus_start_avg=mean(freq_mean_minus_start);
            freq_min_minus_start=freq_min(ndx_V{unitID})-freq_start(ndx_V{unitID});
    %         [tmp1,tmp2]=hist(freq_min_minus_start,5); [tmp3,tmp4]=max(tmp1); freq_min_minus_start_avg=tmp2(tmp4);
            freq_min_minus_start_avg=mean(freq_min_minus_start);
            freq_max_minus_start=freq_max(ndx_V{unitID})-freq_start(ndx_V{unitID});
    %         [tmp1,tmp2]=hist(freq_max_minus_start,5); [tmp3,tmp4]=max(tmp1); freq_max_minus_start_avg=tmp2(tmp4);
            freq_max_minus_start_avg=mean(freq_max_minus_start);

            freq_mean_minus_final=freq_mean(ndx_V{unitID})-freq_final(ndx_V{unitID});
    %         [tmp1,tmp2]=hist(freq_mean_minus_final,5); [tmp3,tmp4]=max(tmp1); freq_mean_minus_final_avg=tmp2(tmp4);
            freq_mean_minus_final_avg=mean(freq_mean_minus_final);
            freq_min_minus_final=freq_min(ndx_V{unitID})-freq_final(ndx_V{unitID});
    %         [tmp1,tmp2]=hist(freq_min_minus_final,5); [tmp3,tmp4]=max(tmp1); freq_min_minus_final_avg=tmp2(tmp4);
            freq_min_minus_final_avg=mean(freq_min_minus_final);
            freq_max_minus_final=freq_max(ndx_V{unitID})-freq_final(ndx_V{unitID});
    %         [tmp1,tmp2]=hist(freq_max_minus_final,5); [tmp3,tmp4]=max(tmp1); freq_max_minus_final_avg=tmp2(tmp4);
            freq_max_minus_final_avg=mean(freq_max_minus_final);

            [tmp1,tmp2]=hist(freq_start(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); freq_start_avg=tmp2(tmp4);
            [tmp1,tmp2]=hist(freq_final(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); freq_final_avg=tmp2(tmp4);
            [tmp1,tmp2]=hist(freq_min(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); freq_min_avg=tmp2(tmp4);
            [tmp1,tmp2]=hist(freq_max(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); freq_max_avg=tmp2(tmp4);
            [tmp1,tmp2]=hist(freq_bw(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); freq_bw_avg=tmp2(tmp4);
            [tmp1,tmp2]=hist(freq_mean(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); freq_mean_avg=tmp2(tmp4);
            [tmp1,tmp2]=hist(syl_tot_en(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); syl_en_avg=tmp2(tmp4);
            [tmp1,tmp2]=hist(syl_dur(ndx_V{unitID}),5); [tmp3,tmp4]=max(tmp1); syl_dur_avg=tmp2(tmp4);

            % print unit information
            dataset_info=sprintf('%i,%i,%.4f,%.4f,%.4f,%.4f,%+.2f,%+.2f,%+.2f,%.2f,%.2f\n', ...
                unitID, ...
                number_of_calls(unitID), ...
                syllable_similarity(1,unitID), ...
                syllable_similarity(2,unitID), ...
                syllable_correlation(1,unitID), ...
                syllable_correlation(2,unitID), ...
                freq_final_minus_start_avg, ...
                freq_mean_minus_start_avg, ...
                freq_mean_minus_final_avg, ...
                freq_bw_avg, ...
                syl_dur_avg);
            fwrite(fid, dataset_info);
        end
        fclose(fid);
    end
end

% show_repertoire_figures
function show_repertoire_figures(handles,repertoireName)

    guihandle=handles.output;
    repertoiredir=handles.repertoiredir;

    % figure
    set(guihandle, 'HandleVisibility', 'off');
    %close all;
    set(guihandle, 'HandleVisibility', 'on');
    screenSize=get(0,'ScreenSize');
    defaultFigPos=get(0,'DefaultFigurePosition');
    repertoire_filename=fullfile(repertoiredir,repertoireName);

    % load
    load(repertoire_filename,'bases','activations','NbUnits','NbChannels','NbPatternFrames','ndx_V');

    figure('Position',[defaultFigPos(1) 0.90*screenSize(4)-defaultFigPos(4) defaultFigPos(3)*(1+fix(NbUnits/40)) defaultFigPos(4)]);

    W=bases;
    H=activations';

    [number_of_calls]=hist(H,NbUnits);
    linebases=W;

    NbRows=5;
    NbCols=floor(NbUnits/NbRows);
    linebases_mat=zeros(NbChannels*NbRows,(NbPatternFrames+1)*NbCols);
    for kk=1:NbRows
    for ll=1:NbCols
      base_unit_normalized = linebases{(NbRows-kk)*NbCols+ll}./max(max(linebases{(NbRows-kk)*NbCols+ll}));
      linebases_mat((kk-1)*NbChannels+1:kk*NbChannels,(ll-1)*(NbPatternFrames+1)+1:ll*(NbPatternFrames+1))=base_unit_normalized;
    end
    end
    imagesc(linebases_mat,[0 0.85]); axis xy; hold on;
    for kk=1:NbCols-1
    plot([(NbPatternFrames+1)*kk+1,(NbPatternFrames+1)*kk+1],[1 NbRows*NbChannels],'Color',[0.2 0.2 0.2],'LineWidth',1);
    end
    for kk=1:NbRows-1
    plot([1 size(linebases_mat,2)],[kk*NbChannels+1 kk*NbChannels+1 ],'Color',[0.2 0.2 0.2],'LineWidth',1);
    end
    cnt=0;
    for kk=NbRows-1:-1:0
      for jj=0:NbCols-1
          cnt=cnt+1;
          text(floor(NbPatternFrames*.05)+jj*(NbPatternFrames+1),(kk+1)*NbChannels-10,num2str(cnt),'Color','k','FontSize',handles.FontSize2,'fontweight','bold');
          text(jj*(NbPatternFrames+1)+floor(NbPatternFrames*.05),(kk+1)*NbChannels-(NbChannels-10),sprintf('%i',number_of_calls(cnt)),'Color','b','FontSize',handles.FontSize2,'fontweight','normal');
      end
    end
    set(gcf, 'Color', 'w');
    set(gca,'XTick',[]);
    set(gca,'YTick',[]);
    %ylabel('Gammatone channels','FontSize',handles.FontSize1);
    colormap pink; colormap(flipud(colormap));

    [~,repertoire_titlename]=fileparts(repertoireName);
    repertoire_titlename=strtrim(regexprep(repertoire_titlename,'[_([{}()=''.(),;%{%}!@])]',' '));
    repertoire_titlename=strtrim(regexprep(repertoire_titlename,':','/'));
    title(sprintf('Syllable repertoire: %s',repertoire_titlename),'FontSize',handles.FontSize1,'fontweight','bold');
    set(gca, 'looseinset', get(gca, 'tightinset'));
    hold off;

    %xlabel('Frames','FontSize',handles.FontSize1);
    set(gca, 'FontSize',handles.FontSize2);

end

% refine_selected_repertoire
function refine_selected_repertoire(handles,repertoireName)

    repertoiredir=handles.repertoiredir;
    repertoire_filename=fullfile(repertoiredir,repertoireName);
    refined_repertoire_filename=strrep(repertoire_filename,'.mat','+.mat');

    NbIterRefine=10;

    choice='Yes';
    if exist(refined_repertoire_filename,'file') || ~isempty(strfind(repertoire_filename,'+.mat'));
    %     qstring='Repertoire was already refined. This operation will overwrite the existing repertoire. Would you like to continue refining?';
    %     choice=questdlg(qstring, 'Further repertoire refinement','Yes','No','No');
        qstring='Repertoire was already refined.';
        errordlg(qstring, 'Repertoire refined stopped');
        choice='No';
    end

    load(repertoire_filename,'datasetName');
    datasetNameRefine=fullfile(handles.datasetdir, sprintf('%s+.mat',datasetName));
    if exist(datasetNameRefine,'file')
        qstring='Dataset was already refined through a different repertoire.';
        qstring=sprintf('Dataset %s already exists. Probably refined through a different repertoire.', sprintf('%s+',datasetName)) ;
        errordlg(qstring, 'Multiple dataset refinements conflict');
        choice='No';
    end

    switch choice
        case 'No'
            return;
        case 'Yes'
            % load
            load(repertoire_filename,'bases','activations','NbUnits','NbChannels','NbPatternFrames','NbIter','dataset_dir','ndx_V','datasetName');

            x = inputdlg('Enter space-separated numbers:', sprintf('Units to be removed from repertoire %s:',strrep(repertoireName,'.mat','')),[1 80]);

            if isempty(x)
                return
            elseif isempty(str2num(x{:}))
                 errordlg('Invalid input.','Repertoire refinement stopped',[1 80]);
            else
                units = fix(str2num(x{:}));
                units = unique(units);

                if ~isempty(find(units > NbUnits | units <= 0, 1))
                    errordlg('Invalid input.','Repertoire refinement stopped',[1 80]);
                else

                    % remove elements from repertoire
                    remove_ndx_refine=vertcat(ndx_V{units});

                    % compute initial centroid for refined repertoire learning
                    bases_tmp=bases;
                    bases_init=bases;
                    bases_tmp(units)=[];
                    bases_init(units)=bases_tmp(1:length(units));
    %                 bases_init(units)=bases_tmp(end-length(units)+1:end);
                    W_init=zeros(NbChannels*(NbPatternFrames+1),NbUnits);
                    for k=1:NbUnits
                        W_init(:,k)=reshape(bases_init{k},NbChannels*(NbPatternFrames+1),1);
                    end
                    W_init=W_init';

                    % recompute repertoire
                    [bases, activations, bic, logL, syllable_similarity, syllable_correlation, repertoire_similarity, err, NbChannels, NbPatternFrames, NbUnits, NbIter, ndx_V, datasetNameRefined,msg] = repertoire_learning(handles, datasetName, NbUnits, NbChannels, NbIterRefine, remove_ndx_refine, W_init);
                    if isempty(bases)
                        if isempty(msg)
                            errordlg('Repertoire learning stopped. Too few syllables were detected in the audio data.','repertoire error');
                        else
                            errordlg(msg,'repertoire error');
                        end
                    else
                        % save
                        [~,datasetName]=fileparts(datasetNameRefined);
                        save(refined_repertoire_filename,'bases','activations','bic','logL','syllable_similarity','syllable_correlation','repertoire_similarity','NbUnits','NbChannels','NbPatternFrames','NbIter','dataset_dir','remove_ndx_refine','ndx_V','datasetName','-v6');
                        set(handles.repertoireList,'value',1);
                        delete(repertoire_filename);
                    end
                end
            end
    end
end

% show_syllable_category_counts
function show_syllable_category_counts(handles,repertoireNames,NbCategories)

    guihandle=handles.output;

    csvdir=fullfile(handles.repertoiredir,'CSV');
    if ~exist(csvdir)
      mkdir(csvdir)
    end

    % csv header
    csv_header=sprintf('%s,%s,%s,%s,%s\n', ...
        'repertoire unit (RU) cluster', ...
        'number of RUs', ...
        'RU-to-centroid correlation (mean)', ...
        'RU-to-centroid correlation (std)', ...
        'total number of syllables');

    %figure
    set(guihandle, 'HandleVisibility', 'off');
    close all;
    set(guihandle, 'HandleVisibility', 'on');
    screenSize=get(0,'ScreenSize');
    defaultFigPos=get(0,'DefaultFigurePosition');
    basesunits=[];
    basesactivations=cell(length(repertoireNames),1);
    basesmap=cell(length(repertoireNames),1);

    for repertoireID = 1:length(repertoireNames)

        repertoire_filename = fullfile(handles.repertoiredir,repertoireNames{repertoireID});

        if ~exist(repertoire_filename)
            fprintf('Repertoire of data set does not exist. Build the repertoire.\n');
        else
            load(repertoire_filename,'bases','activations','NbUnits','NbChannels','NbPatternFrames');
        end
        basesmap{repertoireID}=[length(basesunits)+1:length(basesunits)+length(bases)];
        basesunits=[basesunits; bases];
        basesactivations{repertoireID}=activations;

    end

    %
    figure('Position',[defaultFigPos(1) 0.90*screenSize(4)-defaultFigPos(4) defaultFigPos(3)*(1+fix(NbCategories/40)) defaultFigPos(4)]);
    V=zeros(NbChannels*(NbPatternFrames+1), length(basesunits));
    for k=1:length(basesunits)
      V(:,k)=reshape(basesunits{k}, NbChannels*(NbPatternFrames+1), 1);
    end

    % meta clustering
    [W,J]=kmedoids(V, NbCategories);

    syllable_category_correlation=zeros(length(repertoireNames),2,NbCategories);
    nb_of_repertoire_units=zeros(NbCategories,length(repertoireNames));
    for repertoireID = 1:length(repertoireNames)

        d_repertoire=V(:,basesmap{repertoireID});
        J_repertoire=J(basesmap{repertoireID});
        for categoryID=1:NbCategories
            s = J_repertoire==categoryID;
            nb_of_repertoire_units(categoryID,repertoireID) = sum(s);
            if nb_of_repertoire_units(categoryID,repertoireID) == 0
                syllable_category_correlation(repertoireID,1,categoryID) = 0;
                syllable_category_correlation(repertoireID,2,categoryID) = 0;
            else
                measure_corr = corr(d_repertoire(:,s),W(:,categoryID));
                syllable_category_correlation(repertoireID,1,categoryID) = mean(measure_corr);
                syllable_category_correlation(repertoireID,2,categoryID) = std(measure_corr);
            end
        end
    end

    % prepare outputs
    linebases=cell(NbCategories,1);
    for kk=1:NbCategories
        linebases{kk} = reshape(W(1:NbChannels*(NbPatternFrames+1),kk),NbChannels,(NbPatternFrames+1));
    end

    NbRows=5;
    NbCols=floor(NbCategories/NbRows);
    linebases_mat=zeros(NbChannels*NbRows,(NbPatternFrames+1)*NbCols);
    for kk=1:NbRows
      for ll=1:NbCols
        base_unit_normalized = linebases{(NbRows-kk)*NbCols+ll}./max(max(linebases{(NbRows-kk)*NbCols+ll}));
        linebases_mat((kk-1)*NbChannels+1:kk*NbChannels,(ll-1)*(NbPatternFrames+1)+1:ll*(NbPatternFrames+1))=base_unit_normalized;
      end
    end
    imagesc(linebases_mat,[0 0.85]); axis xy; hold on;
    for kk=1:NbCols-1
      plot([(NbPatternFrames+1)*kk+1,(NbPatternFrames+1)*kk+1],[1 NbRows*NbChannels],'Color',[0.2 0.2 0.2],'LineWidth',1);
    end
    for kk=1:NbRows-1
      plot([1 size(linebases_mat,2)],[kk*NbChannels+1 kk*NbChannels+1 ],'Color',[0.2 0.2 0.2],'LineWidth',1);
    end
    cnt=0;
    for kk=NbRows-1:-1:0
        for jj=0:NbCols-1
            cnt=cnt+1;
            text(floor(0.05*NbPatternFrames)+jj*(NbPatternFrames+1),(kk+1)*NbChannels-10,num2str(cnt),'Color','k','FontSize',handles.FontSize2,'fontweight','normal');
        end
    end
    set(gcf, 'Color', 'w');
    set(gca,'XTick',[]);
    set(gca,'YTick',[]);
    % ylabel('Gammatone channels','FontSize',handles.FontSize1);
    colormap pink; colormap(flipud(colormap));
    title(sprintf('Meta USV syllable repertoire'),'FontSize',handles.FontSize1,'fontweight','bold');
    hold off;
    set(gca, 'looseinset', get(gca, 'tightinset'));

    % figure
    xtickunits=2;
    colormap_mupet=load_colormap;
    activation_pie=zeros(NbCategories,length(repertoireNames));
    nb_of_calls_pie=zeros(NbCategories,length(repertoireNames));
    for repertoireID = 1:length(repertoireNames)

        lineactivity=basesactivations{repertoireID};
        Jline=J((repertoireID-1)*NbUnits+1:repertoireID*NbUnits);
        lineactivity_mapped=Jline(lineactivity);
        for k=1:NbCategories
          activation_pie(k,repertoireID)=sum(lineactivity_mapped==k);
        end
        nb_of_calls_pie(:,repertoireID)=activation_pie(:,repertoireID);
        activation_pie(:,repertoireID)=100*activation_pie(:,repertoireID)./sum(activation_pie(:,repertoireID));
    end

    for repertoireID = 1:length(repertoireNames)

        figure('Position',[defaultFigPos(1)+(repertoireID)*25 0.90*screenSize(4)-defaultFigPos(4)-(repertoireID)*25 defaultFigPos(3) defaultFigPos(4)]);

        % pie diagram
        h=bar(nb_of_calls_pie(:,repertoireID)',1,'grouped');
        bar_child=get(h,'Children');
        colormap(colormap_mupet);
        %set(bar_child,'CData',max(log(activation_pie(:,repertoireID)'),0));
        set(bar_child,'CData',max(log(min(activation_pie(:,repertoireID),25)'),0));
        set(gca,'XTick',[0:xtickunits:NbCategories]);
        xlim([.5 NbCategories+.5]);
        %ylim([0 40]);
        set(gca,'XGrid','off','YGrid','on','XMinorGrid','off');
        set(gca, 'Box', 'off', 'TickDir','out')
        repertoireName=strtrim(regexprep(strrep(repertoireNames{repertoireID},'.mat',''),'[_([{}()=''.(),;:%{%}!@])]',' '));
        title(sprintf('%s',strrep(repertoireName,'_',' ')),'FontSize',handles.FontSize1,'fontweight','bold');
        set(gca, 'FontSize',handles.FontSize2);
        set(gca, 'looseinset', get(gca, 'tightinset'));
    %     ylabel('Activity counts (%%)','FontSize',handles.FontSize1);
        ylabel('Number of syllables','FontSize',handles.FontSize1);
        xlabel('Repertoire units (RUs)','FontSize',handles.FontSize1);
        axis('square')

        % CSV
        csvfile=fullfile(csvdir, sprintf('%s_RU_cluster_counts_of_%i.csv',strrep(repertoireNames{repertoireID},'.mat',''),NbCategories));
        fid = fopen(csvfile,'wt');
        fwrite(fid, csv_header);
        for categoryID = 1:NbCategories
            % print category information
            syl_cat_cor_mn = syllable_category_correlation(repertoireID,1,categoryID);
            syl_cat_cor_st = syllable_category_correlation(repertoireID,2,categoryID);
            if syl_cat_cor_mn == 0 && syl_cat_cor_st == 0
                syl_cat_cor_mn_str = '-';
                syl_cat_cor_st_str = '-';
            elseif syl_cat_cor_st == 0;
                if abs(syl_cat_cor_mn - 1 ) < 1e-10 % not exactly 1
                    syl_cat_cor_mn_str = sprintf('%.0f',syl_cat_cor_mn);
                else
                    syl_cat_cor_mn_str = sprintf('%.4f',syl_cat_cor_mn);
                end
                syl_cat_cor_st_str = sprintf('%i',syl_cat_cor_st);
            else
                syl_cat_cor_mn_str = sprintf('%.4f',syl_cat_cor_mn);
                syl_cat_cor_st_str = sprintf('%.4f',syl_cat_cor_st);
            end

            category_info=sprintf('%i,%i,%s,%s,%i\n', ...
                categoryID, ...
                nb_of_repertoire_units(categoryID,repertoireID), ...
                syl_cat_cor_mn_str, ...
                syl_cat_cor_st_str, ...
                nb_of_calls_pie(categoryID,repertoireID));
            fwrite(fid, category_info);
        end
        fclose(fid);
    end
end

% kmedoids
function [medoids, label, energy, index] = kmedoids(X,k)
% X: d x n data matrix
% k: number of cluster

    v = dot(X,X,1);
    D1 = bsxfun(@plus,v,v')-2*(X'*X);

    dotproduct = bsxfun(@(x, y) x'*y,X,X);
    normX = sqrt(sum(X.^2,1));
    normproduct = normX'*normX;
    D2 = 1-dotproduct./normproduct;

    D = D1;

    n = size(X,2);
    [~,tmp]=sort(mean(D,2),'descend');
    [~, label] = min(D(tmp(1:k),:),[],1);
    last = 0;
    while any(label ~= last)
        [~, index] = min(D*sparse(1:n,label,1,n,k,n),[],1);
        last = label;
        [val, label] = min(D(index,:),[],1);
    end
    energy = sum(val);
    medoids = X(:,index);
end

% syllable_activity_stats_refine
function [syllables, fs, syllable_dur, syllable_distance, syllable_activity, syllable_count_per_minute, syllable_count_per_second] = syllable_activity_stats_refine(handles, datasetName, Nfft)

    if ~exist('Nfft', 'var')
        Nfft=512;
    end
    fs=250000;
    frame_shift=floor(handles.frame_shift_ms*fs);

    % Accumulate GT sonogram frames
    dataset_stats.syllable_dur=[];
    dataset_stats.syllable_distance=[];
    dataset_stats.syllable_activity=[];
    dataset_stats.syllable_count_per_minute=[];
    dataset_stats.syllable_count_per_second=[];
    dataset_stats.file_length=[];
    dataset_stats.filenames=[];
    dataset_stats.length=0;
    Xn_frames=0; Xn_tot=0;
    nb_of_syllables=0;

    % Gammatone features data
    load(fullfile(handles.datasetdir,datasetName),'dataset_content','dataset_dir');
    flist=dataset_content;

    for fname = flist
        [~, filename]= fileparts(fname{1});
        syllable_file=fullfile(dataset_dir, sprintf('%s.mat', filename));
        if exist(syllable_file,'file'),
            load(syllable_file,'syllable_data','syllable_stats','filestats');
            syllable_data(2,:)={[]};
            syllable_use=cell2mat(syllable_stats(1,:));
            syllable_data=syllable_data(:,syllable_use==1);

            if filestats.nb_of_syllables >=1

                % accumulate syllable stats
                dataset_stats.syllable_dur = [dataset_stats.syllable_dur filestats.syllable_dur];
                dataset_stats.syllable_distance = [dataset_stats.syllable_distance filestats.syllable_distance];
                dataset_stats.file_length = [dataset_stats.file_length; filestats.syllable_activity*filestats.TotNbFrames];
                dataset_stats.syllable_count_per_minute = [dataset_stats.syllable_count_per_minute; filestats.syllable_count_per_minute ];
                dataset_stats.syllable_count_per_second = [dataset_stats.syllable_count_per_second; filestats.syllable_count_per_second ];
                dataset_stats.length = dataset_stats.length + filestats.TotNbFrames;
                dataset_stats.filenames = [dataset_stats.filenames syllable_data(1,:)];

                % accumulate psd
                for syllableID = 1:filestats.nb_of_syllables
                    E=cell2mat(syllable_data(4,syllableID));
                    E(E==0)=1;
                    sumXn=sum(cell2mat(syllable_data(3,syllableID))./(ones(Nfft,1)*E),2);
                    Xn_tot = Xn_tot + sumXn;
                    Xn_frames=Xn_frames+length(E);
                end
                nb_of_syllables=nb_of_syllables+filestats.nb_of_syllables;

            end
        end
        clear syllable_data filestats;
    end

    % PSD
    psdn = Xn_tot / Xn_frames;

    % syllable activity
    dataset_stats.syllable_activity = sum(dataset_stats.file_length)/dataset_stats.length;
    dataset_stats.nb_of_syllables = nb_of_syllables;
    dataset_stats.recording_time = dataset_stats.length*frame_shift/fs;
    dataset_stats.syllable_time = Xn_frames*frame_shift/fs;

    % save to data set file
    save(fullfile(handles.datasetdir,datasetName),'dataset_stats','psdn','-append','-v6');

end

% compare_A_against_all_repertoires_match
function compare_repertoires_match(handles,repertoireNames,repertoireA)

    guihandle=handles.output;
    repertoiredir=handles.repertoiredir;

    % figure
    set(guihandle, 'HandleVisibility', 'off');
%     close all;
    set(guihandle, 'HandleVisibility', 'on');
    screenSize=get(0,'ScreenSize');
    defaultFigPos=get(0,'DefaultFigurePosition');

    cnt=0;

    for repertoireID = 1:length(repertoireNames)

        if strcmp(repertoireA,repertoireNames{repertoireID})
           continue;
        end
        cnt=cnt+1;

        repertoirePairNames={repertoireA,repertoireNames{repertoireID}};
        basesunits=cell(length(repertoirePairNames),1);
        basesactivations=cell(length(repertoirePairNames),1);
        basesnames=cell(length(repertoirePairNames),1);
        for repertoirePairID = 1:length(repertoirePairNames)

            repertoire_filename = fullfile(repertoiredir,repertoirePairNames{repertoirePairID});
            [~, repertoirename]=fileparts(repertoire_filename);

            if ~exist(repertoire_filename)
                fprintf('Repertoire of data set does not exist. Build the repertoire.\n');
            else
                load(repertoire_filename,'bases','activations','NbUnits','NbChannels','NbPatternFrames');
            end
            basesunits{repertoirePairID}=bases;
            basesactivations{repertoirePairID}=activations;
            basesnames{repertoirePairID}=strrep(repertoirename,'_',' ');

        end

        [mssim, mssim_diag , similarity_score_mean, sim_scores_highact, diag_score, ndx_permutation, ndx_permutation_second ] = ...
            repertoire_comparison(basesunits{1}, basesactivations{1}, basesunits{2}, basesactivations{2} );

        % figure
%         %figure('Position',[defaultFigPos(1)+(cnt-1) 0.90*screenSize(4)-defaultFigPos(4)-(cnt-1) defaultFigPos(3)*3 defaultFigPos(4)*1]);

%         subplot(1,3,2:3);

        %%% PRIMARY %%%
        figure;
        linebases=basesunits{1};
        [number_of_calls]=hist(basesactivations{1}',NbUnits);
        % permutate
        linebases=linebases(ndx_permutation);
        number_of_calls=number_of_calls(ndx_permutation);

        NbRows=5;
        NbCols=floor(NbUnits/NbRows);
        linebases_mat=zeros(NbChannels*NbRows,(NbPatternFrames+1)*NbCols);
        for kk=1:NbRows
        for ll=1:NbCols
          base_unit_normalized = linebases{(NbRows-kk)*NbCols+ll}./max(max(linebases{(NbRows-kk)*NbCols+ll}));
          linebases_mat((kk-1)*NbChannels+1:kk*NbChannels,(ll-1)*(NbPatternFrames+1)+1:ll*(NbPatternFrames+1))=base_unit_normalized;
        end
        end
        hsubplot(2)=imagesc(linebases_mat,[0 0.85]); axis xy; hold on;
        for kk=1:NbCols-1
        plot([(NbPatternFrames+1)*kk+1,(NbPatternFrames+1)*kk+1],[1 NbRows*NbChannels],'Color',[0.2 0.2 0.2],'LineWidth',1);
        end
        for kk=1:NbRows-1
        plot([1 size(linebases_mat,2)],[kk*NbChannels+1 kk*NbChannels+1 ],'Color',[0.2 0.2 0.2],'LineWidth',1);
        end
        cnt=0;
        for kk=NbRows-1:-1:0
          for jj=0:NbCols-1
              cnt=cnt+1;
              text(floor(NbPatternFrames*.05)+jj*(NbPatternFrames+1),(kk+1)*NbChannels-10,sprintf('%i (%i)', cnt, ndx_permutation(cnt)),'Color','k','FontSize',handles.FontSize2,'fontweight','bold');
              text(jj*(NbPatternFrames+1)+floor(NbPatternFrames*.05),(kk+1)*NbChannels-(NbChannels-10),sprintf('%i',number_of_calls(cnt)),'Color','b','FontSize',handles.FontSize2,'fontweight','normal');

          end
        end
        set(gcf, 'Color', 'w');
        set(gca,'XTick',[]);
        set(gca,'YTick',[]);
%         ylabel('Gammatone channels','FontSize',handles.FontSize1);
        colormap pink; colormap(flipud(colormap));

        title(sprintf('Syllable repertoire: %s',strtrim(regexprep(basesnames{1},'[_([{}()=''.(),;:%{%}!@])]',' '))),'FontSize',handles.FontSize1,'fontweight','bold');
        set(gca, 'looseinset', get(gca, 'tightinset'));
        hold off;

%         xlabel('Frames','FontSize',handles.FontSize1);
        set(gca, 'FontSize',handles.FontSize2);
        freezeColors;

        %%% SECOND %%%
        figure;
        linebases=basesunits{2};
        [number_of_calls]=hist(basesactivations{2}',NbUnits);
        % permutate
        linebases=linebases(ndx_permutation_second);
        number_of_calls=number_of_calls(ndx_permutation_second);

        NbRows=5;
        NbCols=floor(NbUnits/NbRows);
        linebases_mat=zeros(NbChannels*NbRows,(NbPatternFrames+1)*NbCols);
        for kk=1:NbRows
        for ll=1:NbCols
          base_unit_normalized = linebases{(NbRows-kk)*NbCols+ll}./max(max(linebases{(NbRows-kk)*NbCols+ll}));
          linebases_mat((kk-1)*NbChannels+1:kk*NbChannels,(ll-1)*(NbPatternFrames+1)+1:ll*(NbPatternFrames+1))=base_unit_normalized;
        end
        end
        hsubplot(2)=imagesc(linebases_mat,[0 0.85]); axis xy; hold on;
        for kk=1:NbCols-1
        plot([(NbPatternFrames+1)*kk+1,(NbPatternFrames+1)*kk+1],[1 NbRows*NbChannels],'Color',[0.2 0.2 0.2],'LineWidth',1);
        end
        for kk=1:NbRows-1
        plot([1 size(linebases_mat,2)],[kk*NbChannels+1 kk*NbChannels+1 ],'Color',[0.2 0.2 0.2],'LineWidth',1);
        end
        cnt=0;
        for kk=NbRows-1:-1:0
          for jj=0:NbCols-1
              cnt=cnt+1;
              text(floor(NbPatternFrames*.05)+jj*(NbPatternFrames+1),(kk+1)*NbChannels-10,sprintf('%i (%i)', cnt, ndx_permutation_second(cnt)),'Color','k','FontSize',handles.FontSize2,'fontweight','bold');
              text(jj*(NbPatternFrames+1)+floor(NbPatternFrames*.05),(kk+1)*NbChannels-(NbChannels-10),sprintf('%i',number_of_calls(cnt)),'Color','b','FontSize',handles.FontSize2,'fontweight','normal');

          end
        end
        set(gcf, 'Color', 'w');
        set(gca,'XTick',[]);
        set(gca,'YTick',[]);
%         ylabel('Gammatone channels','FontSize',handles.FontSize1);
        colormap pink; colormap(flipud(colormap));

        title(sprintf('Syllable repertoire: %s',strtrim(regexprep(basesnames{2},'[_([{}()=''.(),;:%{%}!@])]',' '))),'FontSize',handles.FontSize1,'fontweight','bold');
        set(gca, 'looseinset', get(gca, 'tightinset'));
        hold off;

%         xlabel('Frames','FontSize',handles.FontSize1);
        set(gca, 'FontSize',handles.FontSize2);
        freezeColors;

%         subplot(1,3,1);
        figure;
        colormap_mupet=load_colormap;
        colormap(colormap_mupet);
        cmap_sim=colormap_mupet;
        barcolors=colormap_mupet([1:floor(size(colormap_mupet,1)/size(sim_scores_highact,1)):size(colormap_mupet,1)],:);
        ipfac=1;
        mssim_diag_show=mssim_diag{6};

        ipfac=4;
        mssim_diag_show=padarray(mssim_diag{6},[1,1],0,'both');
        mssim_diag_show=interp2(mssim_diag_show,ipfac,'nearest'); %interpolate
        mssim_diag_show=mssim_diag_show(ipfac*2+1:end-ipfac*2-1,ipfac*2+1:end-ipfac*2-1);

        hsubplot(1)=imagesc(mssim_diag_show,[.0 1]);
        colormap(colormap_mupet);
        axis('square');
        set(gca,'XTick',[0:NbUnits/5*ipfac^2:NbUnits*ipfac^2]) % frequency
        set(gca,'XTickLabel',[0:NbUnits/5:NbUnits]) % frequency
        set(gca,'YTick',[0:NbUnits/5*ipfac^2:NbUnits*ipfac^2]) % frequency
        set(gca,'YTickLabel',[0:NbUnits/5:NbUnits]) % frequency
        ylabel(sprintf('Repertoire %s', basesnames{1}),'FontSize',handles.FontSize1,'FontWeight','bold');
        xlabel(sprintf('Repertoire %s', basesnames{2}),'FontSize',handles.FontSize1,'FontWeight','bold');
        set(gca, 'FontSize',handles.FontSize2);
        hcb=colorbar;
        set(get(hcb,'Title'),'String','Pearson''s correlation','FontSize',handles.FontSize2);
        axvals=axis;
        % text(axvals(1)+(axvals(2)-axvals(1))/2,axvals(3)+(axvals(4)-axvals(3))/2,{'MUPET version 1.0', '(unreleased)'},'Color',[0.5 0.5 0.5],'FontSize',handles.FontSize1+10,'HorizontalAlignment','center','Rotation',45);

        csvdir=fullfile(handles.repertoiredir,'CSV');
        if ~exist(csvdir)
          mkdir(csvdir)
        end

        % csv header
        csv_header=sprintf(',%s\n', ...
            'Pearson''s correlation (diagonal)');

        csvfile=fullfile(csvdir,sprintf('Repertoire_%s_vs_%s_comparison_with_best_match_sorting.csv',sprintf('%s', basesnames{1}),sprintf('%s', basesnames{2})));
        fid = fopen(csvfile,'wt');
        fwrite(fid, csv_header);

        mssim_diag_only = diag(mssim_diag{6});
        for diagID = 1:length(mssim_diag_only)
            fwrite(fid, sprintf('%i, %.3f\n',diagID, mssim_diag_only(diagID)));
        end
        fclose(fid);

    end
end

% compare_repertoires_activity
function compare_repertoires_activity(handles,repertoireNames,repertoireA)

    guihandle=handles.output;
    repertoiredir=handles.repertoiredir;

    csvdir=fullfile(handles.repertoiredir,'CSV');
    if ~exist(csvdir)
      mkdir(csvdir)
    end

    % csv header
    csv_header=sprintf('%s,%s,%s,%s,%s,%s\n', ...
        'dataset', ...
        'similarity score (top 5%)', ...
        'similarity score (Q1)', ...
        'similarity score (median)', ...
        'similarity score (Q3)', ...
        'similarity score (top 95%)');

    csvfile=fullfile(csvdir,sprintf('%s_vs_all_repertoire_comparison.csv',strrep(repertoireA,'.mat','')));
    fid = fopen(csvfile,'wt');
    fwrite(fid, csv_header);

    % csv header detailed
    csv_header_detailed=sprintf('%s','dataset');
    for percID=1:100
        csv_header_detailed=sprintf('%s',csv_header_detailed,sprintf('%s',sprintf(',%i%% PCTL',percID)));
    end
    csv_header_detailed=sprintf('%s\n',csv_header_detailed);
    csvfile_detailed=fullfile(csvdir,sprintf('%s_vs_all_repertoire_comparison_detailed.csv',strrep(repertoireA,'.mat','')));
    fid_detailed = fopen(csvfile_detailed,'wt');
    fwrite(fid_detailed, csv_header_detailed);

    % figure
    set(guihandle, 'HandleVisibility', 'off');
    %close all;
    set(guihandle, 'HandleVisibility', 'on');
    screenSize=get(0,'ScreenSize');
    defaultFigPos=get(0,'DefaultFigurePosition');
    basesunits=cell(length(repertoireNames),1);
    basesactivations=cell(length(repertoireNames),1);
    basesnames=cell(length(repertoireNames),1);
    for repertoireID = 1:length(repertoireNames)

        repertoire_filename = fullfile(repertoiredir,repertoireNames{repertoireID});
        [~, repertoirename]=fileparts(repertoire_filename);

        if ~exist(repertoire_filename)
            fprintf('Repertoire of data set does not exist. Build the repertoire.\n');
        else
            load(repertoire_filename,'bases','activations','NbUnits','NbChannels','NbPatternFrames');
        end
        basesunits{repertoireID}=bases;
        basesactivations{repertoireID}=activations;
        basesnames{repertoireID}=strrep(repertoirename,'_',' ');

    end

    ndx_A=find(strcmp(repertoireNames,repertoireA));
    ndx_comparing=find(~strcmp(repertoireNames,repertoireA));
    filename_A=basesnames(ndx_A);
    filenames_comparingrepertoire=basesnames(ndx_comparing);
    sim_scores=[];
    sim_scores_highact=[];
    sim_scores_highact_detailed=[];
    diag_scores=[];
    for repertoireID = 1:length(ndx_comparing)
        [mssim, mssim_diag , similarity_score_mean, similarity_score_highactivity, diag_score, ~, ~, similarity_score_highactivity_detailed ] = ...
            repertoire_comparison(basesunits{ndx_A}, basesactivations{ndx_A}, basesunits{ndx_comparing(repertoireID)}, basesactivations{ndx_comparing(repertoireID)} );
        sim_scores = [sim_scores; similarity_score_mean];
        sim_scores_highact = [sim_scores_highact; similarity_score_highactivity];
        sim_scores_highact_detailed = [sim_scores_highact_detailed; similarity_score_highactivity_detailed];
        diag_scores = [diag_scores; diag_score'];
    end

    % figure
    figure('Position',[defaultFigPos(1) 0.90*screenSize(4)-defaultFigPos(4) defaultFigPos(3)*(1+fix(length(ndx_comparing)/16)) defaultFigPos(4)]);
    minY=0.65;
    maxY=1.0;
    rec_width=.2;
    colormap_mupet=load_colormap;
    colormap(colormap_mupet);
    barcolors=colormap_mupet([1:floor(size(colormap_mupet,1)/size(sim_scores_highact,1)):size(colormap_mupet,1)],:);
    barcolors=0.5*ones(size(barcolors));
    bwqs=cell(1,size(sim_scores_highact,1));
    bwq=cell(1,size(sim_scores_highact,1));
    bwmin=cell(1,size(sim_scores_highact,1));
    bwmax=cell(1,size(sim_scores_highact,1));
    bwcnt=cell(1,size(sim_scores_highact,1));
    for barID=1:size(sim_scores_highact,1)
       bwqs{barID} = min(sim_scores_highact(barID, 4),sim_scores_highact(barID, 2));
       bwq{barID} = abs(sim_scores_highact(barID, 2) - sim_scores_highact(barID, 4));
       bwmin{barID} = sim_scores_highact(barID, 5);
       minY = min(minY,bwmin{barID}-0.025);
       bwmax{barID} = sim_scores_highact(barID, 1);
       bwcnt{barID} = sim_scores_highact(barID, 3);
       % print comparison information
       dataset_info=sprintf('%s,%.2f,%.2f,%.2f,%.2f,%.2f\n', ...
         strrep(filenames_comparingrepertoire{barID},' ','_'), ...
         sim_scores_highact(barID, 1), ...
         sim_scores_highact(barID, 2), ...
         sim_scores_highact(barID, 3), ...
         sim_scores_highact(barID, 4), ...
         sim_scores_highact(barID, 5));
       fwrite(fid, dataset_info);

       % print detailed comparison information
       dataset_info_detailed=sprintf('%s',strrep(filenames_comparingrepertoire{barID},' ','_'));
       fwrite(fid_detailed, dataset_info_detailed);
       for percID=1:100
           dataset_info_detailed=sprintf(',%.2f',sim_scores_highact_detailed(barID, percID));
           fwrite(fid_detailed, dataset_info_detailed);
       end
       fwrite(fid_detailed, sprintf('\n',''));

    end

    [~,ndx_sort]=sort(cell2mat(bwcnt),'descend');
    filenames_comparingrepertoire=filenames_comparingrepertoire(ndx_sort);
    for ndx=1:size(sim_scores_highact,1)
        barID = ndx_sort(ndx);
        rectangle('Position',[ndx-rec_width/2 bwqs{barID} rec_width bwq{barID}],'FaceColor',barcolors(barID,:)); hold on;
        plot([ndx], [bwmin{barID}], '+', 'MarkerEdgeColor','k', 'MarkerFaceColor','k');
        plot([ndx], [bwmax{barID}], '*', 'MarkerEdgeColor','k', 'MarkerFaceColor','w');
        plot([ndx-rec_width ndx+rec_width], [bwcnt{barID} bwcnt{barID}], 'k', 'LineWidth', 2);
    end
    grid on
    set(gca, 'Box', 'off', 'TickDir','out')
    ylim([minY maxY]);
    xlim([0.5 size(sim_scores_highact,1)+.5]);
%     axis('square');
    set(gca,'xtick',[1:length(filenames_comparingrepertoire)]);
    set(gca,'XTickLabel',filenames_comparingrepertoire);
    set(gca,'ytick',[0:0.1:maxY]);
    set(gca,'yTickLabel',[0:0.1:maxY]);
    ylabel('Similarity score (%)', 'FontSize',handles.FontSize1);
    title(filename_A,'FontSize',handles.FontSize1, 'FontWeight','bold');
    set(gca, 'FontSize',handles.FontSize2);
    hold off
    % text(axvals(1)+(axvals(2)-axvals(1))/2,axvals(3)+(axvals(4)-axvals(3))/2,{'MUPET version 1.0', '(unreleased)'},'Color',[0.9 0.9 0.9],'FontSize',handles.FontSize1+10,'HorizontalAlignment','center','Rotation',45);

end

% repertoire_comparison
function [mssim, mssim_diag, similarity_score_mean, similarity_score_highactivity, diag_ssim, ndx_permutation, ndx_permutation_second, similarity_score_highactivity_detailed] = repertoire_comparison(W1, H1, W2, H2 )

    % parameters
    rDim = length(W1);

    % rescale range
    L=255;
    W1max = max(cellfun(@(x) max(max(x)), W1, 'UniformOutput',1));
    W2max = max(cellfun(@(x) max(max(x)), W2, 'UniformOutput',1));

    % rerank based on occurency
    [activations_tot]=hist(H1,rDim);
    [~,ondx]=sort(activations_tot./sum(activations_tot)*100,'descend');
    activations_cumsum=(cumsum(activations_tot./sum(activations_tot)*100));
    [~, nbestMin]=min(abs(activations_cumsum-5));
    [~, nbest25]=min(abs(activations_cumsum-25));
    [~, nbest50]=min(abs(activations_cumsum-50));
    [~, nbest75]=min(abs(activations_cumsum-75));
    [~, nbestMax]=min(abs(activations_cumsum-95));

    nbestPerc=zeros(1,100);
    for percID = 1:100
        [~, nbestPerc(percID)]=min(abs(activations_cumsum-percID));
    end

    nbestAll=length(activations_cumsum);
    H1=H1(ondx);
    W1=W1(ondx);
    [activations_tot]=hist(H2,rDim);
    [~,ondx]=sort(activations_tot./sum(activations_tot)*100,'descend');
    H2=H2(ondx);
    W2=W2(ondx);

    % smooth
    %W1=cellfun(@(x) smooth2(x,1), W1,'uni',0);
    %W2=cellfun(@(x) smooth2(x,1), W2,'uni',0);

    % reshape
    W1=cell2mat( cellfun(@(x) reshape(x,prod(size(x)),1), W1,'uni',0)');
    W2=cell2mat( cellfun(@(x) reshape(x,prod(size(x)),1), W2,'uni',0)');

    % correlation distance
    measure_corr = bsxfun(@(x, y) corr(x,y), W1, W2);

    % cosine distance
    dotproduct = bsxfun(@(x, y) x'*y, W1, W2);
    normW1 = sqrt(sum(W1.^2,1));
    normW2 = sqrt(sum(W2.^2,1));
    normproduct = normW1'*normW2;
    measure_cosd = dotproduct./normproduct;

    mssim  = ( measure_cosd + measure_corr )./2 ;
    mssim  = ( measure_corr )./1 ;
    [similarity_score_mean, mssim_diag, diag_ssim, ndx_permutation, ndx_permutation_second ] = diag_score( mssim );
    similarity_score_highactivity=zeros(1,3);
    mssim_diag=cell(1,5);
    [similarity_score_highactivity(1), mssim_diag{1}] = highactivity_score(mssim, nbestMin);
    [similarity_score_highactivity(2), mssim_diag{2}] = highactivity_score(mssim, nbest25);
    [similarity_score_highactivity(3), mssim_diag{3}] = highactivity_score(mssim, nbest50);
    [similarity_score_highactivity(4), mssim_diag{4}]= highactivity_score(mssim, nbest75);
    [similarity_score_highactivity(5), mssim_diag{5}]= highactivity_score(mssim, nbestMax);
    [similarity_score_highactivity(6), mssim_diag{6}]= highactivity_score(mssim, nbestAll);

    similarity_score_highactivity_detailed=zeros(1,100);
    for percID=1:100
       similarity_score_highactivity_detailed(percID) = highactivity_score(mssim, nbestPerc(percID));
    end
end

% normalize
function Anorm = normalize(A)
    Anorm = (A - min(min(A)))/(max(max(A)) - min(min(A)));
end

% diag_score
function [sim_score_mean, mssim_diag, diag_ssim, ndx_permutation, ndx_permutation_second] = diag_score(mssim)

    % diagonalize
    rDim=size(mssim,1);
    tmp = mssim;
    mssim_diag = zeros(size(mssim));
    for l=1:rDim,
        [val1,ndx1]=max(tmp);
        [val2,ndx2]=max(val1);
        col = ndx2;
        row = ndx1(ndx2);
        mssim_diag(row+(l-1),l:end)=tmp(row, :);
        mssim_diag(l:end, col+(l-1))=tmp(:, col);
        mssim_diag(:,[l col+(l-1)])=mssim_diag(:,[col+(l-1) l]);
        mssim_diag([l row+(l-1)],:)=mssim_diag([row+(l-1) l],:);
        tmp(row, :)=[];
        tmp(:, col)=[];
    end;

    % main
    ndx_permutation=zeros(rDim,1);
    for l=1:rDim,
        ndx=find(sum(mssim==mssim_diag(l,l),2));
        k=0;
        while k<length(ndx)
            if ~ismember(ndx_permutation,ndx(k+1))
                ndx_permutation(l)=ndx(k+1);
            end
            k=k+1;
        end
    end

    % comparing
    ndx_permutation_second=zeros(rDim,1);
    for l=1:rDim,
        ndx=find(sum(mssim==mssim_diag(l,l),1));
        k=0;
        while k<length(ndx)
            if ~ismember(ndx_permutation_second,ndx(k+1))
                ndx_permutation_second(l)=ndx(k+1);
            end
            k=k+1;
        end
    end

    diag_energy = sum(diag(mssim_diag))./rDim;
    tot_energy = (sum(sum(mssim_diag))-diag_energy)./(rDim*rDim-rDim);
    diag_ssim = diag(mssim_diag);
    sim_score_mean=[];
    sim_score_mean(3) = mean(diag_ssim(1:floor(1.0*rDim)));
    sim_score_mean(2) = mean(diag_ssim(1:floor(0.75*rDim)));
    sim_score_mean(1) = mean(diag_ssim(1:floor(0.5*rDim)));

end

% highactivity_score
function [sim_score_highactivity, mssim_diag] = highactivity_score(mssim, nbest)

    % diagonalize
    tmp = mssim(1:nbest, 1:end);
    mssim_diag = zeros(nbest, size(tmp,2));
    mssim_diag_diag = [];
    for l=1:nbest,
        if l==nbest,
          ndx1 = ones(size(tmp,2),1);
          val1 = tmp;
        else
          [val1,ndx1]=max(tmp);
        end
        [val2,ndx2]=max(val1);
        col = ndx2;
        row = ndx1(ndx2);
        mssim_diag_diag = [ mssim_diag_diag tmp(row, col)];
        mssim_diag(row+(l-1),l:end)=tmp(row, :);
        mssim_diag(l:end, col+(l-1))=tmp(:, col);
        mssim_diag(:,[l col+(l-1)])=mssim_diag(:,[col+(l-1) l]);
        mssim_diag([l row+(l-1)],:)=mssim_diag([row+(l-1) l],:);
        tmp(row, :)=[];
        tmp(:, col)=[];
    end;


    mssim_diag=mssim_diag(1:nbest, 1:nbest);
    sim_score_highactivity = mean( mssim_diag_diag );

end

% freezeColors
function freezeColors(varargin)

    appdatacode = 'JRI__freezeColorsData';

    [h, nancolor] = checkArgs(varargin);

    %gather all children with scaled or indexed CData
    cdatah = getCDataHandles(h);

    %current colormap
    cmap = colormap;
    nColors = size(cmap,1);
    cax = caxis;

    % convert object color indexes into colormap to true-color data using
    %  current colormap
    for hh = cdatah',

        g = get(hh);

        %preserve parent axis clim
        parentAx = getParentAxes(hh);
        originalClim = get(parentAx, 'clim');

        %   Note: Special handling of patches: For some reason, setting
        %   cdata on patches created by bar() yields an error,
        %   so instead we'll set facevertexcdata instead for patches.
        if ~strcmp(g.Type,'patch'),
            cdata = g.CData;
        else
            cdata = g.FaceVertexCData;
        end

        %get cdata mapping (most objects (except scattergroup) have it)
        if isfield(g,'CDataMapping'),
            scalemode = g.CDataMapping;
        else
            scalemode = 'scaled';
        end

        %save original indexed data for use with unfreezeColors
        siz = size(cdata);
        setappdata(hh, appdatacode, {cdata scalemode});

        %convert cdata to indexes into colormap
        if strcmp(scalemode,'scaled'),
            %4/19/06 JRI, Accommodate scaled display of integer cdata:
            %       in MATLAB, uint * double = uint, so must coerce cdata to double
            %       Thanks to O Yamashita for pointing this need out
            idx = ceil( (double(cdata) - cax(1)) / (cax(2)-cax(1)) * nColors);
        else %direct mapping
            idx = cdata;
            %10/8/09 in case direct data is non-int (e.g. image;freezeColors)
            % (Floor mimics how matlab converts data into colormap index.)
            % Thanks to D Armyr for the catch
            idx = floor(idx);
        end

        %clamp to [1, nColors]
        idx(idx<1) = 1;
        idx(idx>nColors) = nColors;

        %handle nans in idx
        nanmask = isnan(idx);
        idx(nanmask)=1; %temporarily replace w/ a valid colormap index

        %make true-color data--using current colormap
        realcolor = zeros(siz);
        for i = 1:3,
            c = cmap(idx,i);
            c = reshape(c,siz);
            c(nanmask) = nancolor(i); %restore Nan (or nancolor if specified)
            realcolor(:,:,i) = c;
        end

        %apply new true-color color data

        %true-color is not supported in painters renderer, so switch out of that
        if strcmp(get(gcf,'renderer'), 'painters'),
            set(gcf,'renderer','zbuffer');
        end

        %replace original CData with true-color data
        if ~strcmp(g.Type,'patch'),
            set(hh,'CData',realcolor);
        else
            set(hh,'faceVertexCData',permute(realcolor,[1 3 2]))
        end

        %restore clim (so colorbar will show correct limits)
        if ~isempty(parentAx),
            set(parentAx,'clim',originalClim)
        end
    end

end

% getCDataHandles
function hout = getCDataHandles(h)
    % getCDataHandles  Find all objects with indexed CData

    %recursively descend object tree, finding objects with indexed CData
    % An exception: don't include children of objects that themselves have CData:
    %   for example, scattergroups are non-standard hggroups, with CData. Changing
    %   such a group's CData automatically changes the CData of its children,
    %   (as well as the children's handles), so there's no need to act on them.

    error(nargchk(1,1,nargin,'struct'))

    hout = [];
    if isempty(h),return;end

    ch = get(h,'children');
    for hh = ch'
        g = get(hh);
        if isfield(g,'CData'),     %does object have CData?
            %is it indexed/scaled?
            if ~isempty(g.CData) && isnumeric(g.CData) && size(g.CData,3)==1,
                hout = [hout; hh]; %#ok<AGROW> %yes, add to list
            end
        else %no CData, see if object has any interesting children
                hout = [hout; getCDataHandles(hh)]; %#ok<AGROW>
        end
    end

end

% getParentAxes
function hAx = getParentAxes(h)
% getParentAxes  Return enclosing axes of a given object (could be self)

    error(nargchk(1,1,nargin,'struct'))
    %object itself may be an axis
    if strcmp(get(h,'type'),'axes'),
        hAx = h;
        return
    end

    parent = get(h,'parent');
    if (strcmp(get(parent,'type'), 'axes')),
        hAx = parent;
    else
        hAx = getParentAxes(parent);
    end

end

% checkArgs
function [h, nancolor] = checkArgs(args)
% checkArgs  Validate input arguments to freezeColors

    nargs = length(args);
    error(nargchk(0,3,nargs,'struct'))

    %grab handle from first argument if we have an odd number of arguments
    if mod(nargs,2),
        h = args{1};
        if ~ishandle(h),
            error('JRI:freezeColors:checkArgs:invalidHandle',...
                'The first argument must be a valid graphics handle (to an axis)')
        end
        % 4/2010 check if object to be frozen is a colorbar
        if strcmp(get(h,'Tag'),'Colorbar'),
          if ~exist('cbfreeze.m'),
            warning('JRI:freezeColors:checkArgs:cannotFreezeColorbar',...
                ['You seem to be attempting to freeze a colorbar. This no longer'...
                'works. Please read the help for freezeColors for the solution.'])
          else
            cbfreeze(h);
            return
          end
        end
        args{1} = [];
        nargs = nargs-1;
    else
        h = gca;
    end

    %set nancolor if that option was specified
    nancolor = [nan nan nan];
    if nargs == 2,
        if strcmpi(args{end-1},'nancolor'),
            nancolor = args{end};
            if ~all(size(nancolor)==[1 3]),
                error('JRI:freezeColors:checkArgs:badColorArgument',...
                    'nancolor must be [r g b] vector');
            end
            nancolor(nancolor>1) = 1; nancolor(nancolor<0) = 0;
        else
            error('JRI:freezeColors:checkArgs:unrecognizedOption',...
                'Unrecognized option (%s). Only ''nancolor'' is valid.',args{end-1})
        end
    end

end

% cbfreeze
function CBH = cbfreeze(varargin)


    % INPUTS CHECK-IN
    % -------------------------------------------------------------------------

    % Parameters:
    appName = 'cbfreeze';

    % Set defaults:
    OPT  = 'on';
    H    = get(get(0,'CurrentFigure'),'CurrentAxes');
    CMAP = [];

    % Checks inputs:
    assert(nargin<=3,'CAVARGAS:cbfreeze:IncorrectInputsNumber',...
        'At most 3 inputs are allowed.')
    assert(nargout<=1,'CAVARGAS:cbfreeze:IncorrectOutputsNumber',...
        'Only 1 output is allowed.')

    % Checks from where CBFREEZE was called:
    if (nargin~=2) || (isempty(varargin{1}) || ...
            ~all(reshape(ishandle(varargin{1}),[],1)) ...
            || ~isempty(varargin{2}))
        % CBFREEZE called from Command Window or M-file:

        % Reads H in the first input: Version 2.1
        if ~isempty(varargin) && ~isempty(varargin{1}) && ...
                all(reshape(ishandle(varargin{1}),[],1))
            H = varargin{1};
            varargin(1) = [];
        end

        % Reads CMAP in the first input: Version 2.1
        if ~isempty(varargin) && ~isempty(varargin{1})
            if isnumeric(varargin{1}) && (size(varargin{1},2)==3) && ...
                    (size(varargin{1},1)==numel(varargin{1})/3)
                CMAP = varargin{1};
                varargin(1) = [];
            elseif ischar(varargin{1}) && ...
                    (size(varargin{1},2)==numel(varargin{1}))
                temp = figure('Visible','off');
                try
                    CMAP = colormap(temp,varargin{1});
                catch
                    close temp
                    error('CAVARGAS:cbfreeze:IncorrectInput',...
                        'Incorrrect colormap name ''%s''.',varargin{1})
                end
                close temp
                varargin(1) = [];
            end
        end

        % Reads options: Version 2.1
        while ~isempty(varargin)
            if isempty(varargin{1}) || ~ischar(varargin{1}) || ...
                    (numel(varargin{1})~=size(varargin{1},2))
                varargin(1) = [];
                continue
            end
            switch lower(varargin{1})
                case {'off','of','unfreeze','unfreez','unfree','unfre', ...
                        'unfr','unf','un','u'}
                    OPT = 'off';
                case {'delete','delet','dele','del','de','d'}
                    OPT = 'delete';
                otherwise
                    OPT = 'on';
            end
        end

        % Gets colorbar handles or creates them:
        CBH = cbhandle(H,'force');

    else

        % Check for CallBacks functionalities:
        % ------------------------------------

        varargin{1} = double(varargin{1});

        if strcmp(get(varargin{1},'BeingDelete'),'on')
            % CBFREEZE called from DeletFcn:

            if (ishandle(get(varargin{1},'Parent')) && ...
                    ~strcmpi(get(get(varargin{1},'Parent'),'BeingDeleted'),'on'))
                % The handle input is being deleted so do the colorbar:
                OPT = 'delete';

                if strcmp(get(varargin{1},'Tag'),'Colorbar')
                    % The frozen colorbar is being deleted:
                    H = varargin{1};
                else
                    % The peer axes is being deleted:
                    H = ancestor(varargin{1},{'figure','uipanel'});
                end
            else
                % The figure is getting close:
                return
            end

        elseif ((gca==varargin{1}) && ...
                (gcf==ancestor(varargin{1},{'figure','uipanel'})))
            % CBFREEZE called from ButtonDownFcn:

            cbdata = getappdata(varargin{1},appName);
            if ~isempty(cbdata)
                if ishandle(cbdata.peerHandle)
                    % Sets the peer axes as current (ignores mouse click-over):
                    set(gcf,'CurrentAxes',cbdata.peerHandle);
                    return
                end
            else
                % Clears application data:
                rmappdata(varargin{1},appName)
            end
            H = varargin{1};
        end

        % Gets out:
        CBH = cbhandle(H);

    end

    % -------------------------------------------------------------------------
    % MAIN
    % -------------------------------------------------------------------------

    % Keeps current figure:
    cfh = get(0,'CurrentFigure');

    % Works on every colorbar:
    for icb = 1:length(CBH)

        % Colorbar handle:
        cbh = double(CBH(icb));

        % This application data:
        cbdata = getappdata(cbh,appName);

        % Gets peer axes handle:
        if ~isempty(cbdata)
            peer = cbdata.peerHandle;
            if ~ishandle(peer)
                rmappdata(cbh,appName)
                continue
            end
        else
            % No matters, get them below:
            peer = [];
        end

        % Choose functionality:
        switch OPT

            case 'delete'
                % Deletes:
                if ~isempty(peer)
                    % Returns axes to previous size:
                    oldunits = get(peer,'Units');
                    set(peer,'Units','Normalized');
                    set(peer,'Position',cbdata.peerPosition)
                    set(peer,'Units',oldunits)
                    set(peer,'DeleteFcn','')
                    if isappdata(peer,appName)
                        rmappdata(peer,appName)
                    end
                end
                if strcmp(get(cbh,'BeingDelete'),'off')
                    delete(cbh)
                end

            case 'off'
                % Unfrozes:
                if ~isempty(peer)
                    delete(cbh);
                    set(peer,'DeleteFcn','')
                    if isappdata(peer,appName)
                        rmappdata(peer,appName)
                    end
                    oldunits = get(peer,'Units');
                    set(peer,'Units','Normalized')
                    set(peer,'Position',cbdata.peerPosition)
                    set(peer,'Units',oldunits)
                    CBH(icb) = colorbar(...
                        'Peer'    ,peer,...
                        'Location',cbdata.cbLocation);
                end

            case 'on'
                % Freezes:

                % Gets colorbar axes properties:
                cbprops = get(cbh);

                % Current axes on colorbar figure:
                fig = ancestor(cbh,{'figure','uipanel'});
                cah = get(fig,'CurrentAxes');

                % Gets colorbar image handle. Fixed BUG, Sep 2009
                himage = findobj(cbh,'Type','image');

                % Gets image data and transforms them to RGB:
                CData = get(himage,'CData');
                if size(CData,3)~=1
                    % It's already frozen:
                    continue
                end

                % Gets image tag:
                imageTag = get(himage,'Tag');

                % Deletes previous colorbar preserving peer axes position:
                if isempty(peer)
                    peer = cbhandle(cbh,'peer');
                end
                oldunits = get(peer,'Units');
                set(peer,'Units','Normalized')
                position = get(peer,'Position');
                delete(cbh)
                oldposition = get(peer,'Position');

                % Seves axes position
                cbdata.peerPosition = oldposition;
                set(peer,'Position',position)
                set(peer,'Units',oldunits)

                % Generates a new colorbar axes:
                % NOTE: this is needed because each time COLORMAP or CAXIS
                %       is used, MATLAB generates a new COLORBAR! This
                %       eliminates that behaviour and is the central point
                %       on this function.
                cbh = axes(...
                    'Parent'  ,cbprops.Parent,...
                    'Units'   ,'Normalized',...
                    'Position',cbprops.Position...
                    );

                % Saves location for future calls:
                cbdata.cbLocation = cbprops.Location;

                % Move ticks because IMAGE draws centered pixels:
                XLim = cbprops.XLim;
                YLim = cbprops.YLim;
                if     isempty(cbprops.XTick)
                    % Vertical:
                    X = XLim(1) + diff(XLim)/2;
                    Y = YLim    + diff(YLim)/(2*length(CData))*[+1 -1];
                else % isempty(YTick)
                    % Horizontal:
                    Y = YLim(1) + diff(YLim)/2;
                    X = XLim    + diff(XLim)/(2*length(CData))*[+1 -1];
                end

                % Gets colormap:
                if isempty(CMAP)
                    cmap = colormap(fig);
                else
                    cmap = CMAP;
                end

                % Draws a new RGB image:
                image(X,Y,ind2rgb(CData,cmap),...
                    'Parent'            ,cbh,...
                    'HitTest'           ,'off',...
                    'Interruptible'     ,'off',...
                    'SelectionHighlight','off',...
                    'Tag'               ,imageTag)

                % Moves all '...Mode' properties at the end of the structure,
                % so they won't become 'manual':
                % Bug found by Rafa at the FEx. Thanks!, which also solves the
                % bug found by Jenny at the FEx too. Version 2.0
                cbfields = fieldnames(cbprops);
                indmode  = strfind(cbfields,'Mode');
                temp     = repmat({'' []},length(indmode),1);
                cont     = 0;
                for k = 1:length(indmode)
                    % Removes the '...Mode' properties:
                    if ~isempty(indmode{k})
                        cont = cont+1;
                        temp{cont,1} = cbfields{k};
                        temp{cont,2} = getfield(cbprops,cbfields{k});
                        cbprops = rmfield(cbprops,cbfields{k});
                    end
                end
                for k=1:cont
                    % Now adds them at the end:
                    cbprops = setfield(cbprops,temp{k,1},temp{k,2});
                end

                % Removes special COLORBARs properties:
                cbprops = rmfield(cbprops,{...
                    'CurrentPoint','TightInset','BeingDeleted','Type',...       % read-only
                    'Title','XLabel','YLabel','ZLabel','Parent','Children',...  % handles
                    'UIContextMenu','Location',...                              % colorbars
                    'ButtonDownFcn','DeleteFcn',...                             % callbacks
                    'CameraPosition','CameraTarget','CameraUpVector', ...
                    'CameraViewAngle',...
                    'PlotBoxAspectRatio','DataAspectRatio','Position',...
                    'XLim','YLim','ZLim'});

                % And now, set new axes properties almost equal to the unfrozen
                % colorbar:
                set(cbh,cbprops)

                % CallBack features:
                set(cbh,...
                    'ActivePositionProperty','position',...
                    'ButtonDownFcn'         ,@cbfreeze,...  % mhh...
                    'DeleteFcn'             ,@cbfreeze)     % again
                set(peer,'DeleteFcn'        ,@cbfreeze)     % and again!

                % Do not zoom or pan or rotate:
                %if isAllowAxesZoom(fig,cbh)
                setAllowAxesZoom  (    zoom(fig),cbh,false)
                %end
                %if isAllowAxesPan(fig,cbh)
                setAllowAxesPan   (     pan(fig),cbh,false)
                %end
                %if isAllowAxesRotate(fig,cbh)
                setAllowAxesRotate(rotate3d(fig),cbh,false)
                %end

                % Updates data:
                CBH(icb) = cbh;

                % Saves data for future undo:
                cbdata.peerHandle = peer;
                cbdata.cbHandle   = cbh;
                setappdata(cbh ,appName,cbdata);
                setappdata(peer,appName,cbdata);

                % Returns current axes:
                if ishandle(cah)
                    set(fig,'CurrentAxes',cah)
                end

        end % switch functionality

    end  % MAIN loop

    % Resets the current figure
    if ishandle(cfh)
        set(0,'CurrentFigure',cfh)
    end

    % OUTPUTS CHECK-OUT
    % -------------------------------------------------------------------------

    % Output?:
    if ~nargout
        clear CBH
    else
        CBH(~ishandle(CBH)) = [];
    end

end

% cbhandle
function CBH = cbhandle(varargin)

% INPUTS CHECK-IN
% -------------------------------------------------------------------------

    % Parameters:
    appName = 'cbfreeze';

    % Sets default:
    H      = get(get(0,'CurrentFigure'),'CurrentAxes');
    FORCE  = false;
    UNHIDE = false;
    PEER   = false;

    % Checks inputs/outputs:
    assert(nargin<=5,'CAVARGAS:cbhandle:IncorrectInputsNumber',...
        'At most 5 inputs are allowed.')
    assert(nargout<=1,'CAVARGAS:cbhandle:IncorrectOutputsNumber',...
        'Only 1 output is allowed.')

    % Gets H: Version 2.1
    if ~isempty(varargin) && ~isempty(varargin{1}) && ...
            all(reshape(ishandle(varargin{1}),[],1))
        H = varargin{1};
        varargin(1) = [];
    end

    % Gets UNHIDE:
    while ~isempty(varargin)
        if isempty(varargin) || isempty(varargin{1}) || ~ischar(varargin{1})...
                || (numel(varargin{1})~=size(varargin{1},2))
            varargin(1) = [];
            continue
        end

        switch lower(varargin{1})
            case {'force','forc','for','fo','f'}
                FORCE  = true;
            case {'unhide','unhid','unhi','unh','un','u'}
                UNHIDE = true;
            case {'peer','pee','pe','p'}
                PEER   = true;
        end
        varargin(1) = [];
    end

    % -------------------------------------------------------------------------
    % MAIN
    % -------------------------------------------------------------------------

    % Show hidden handles:
    if UNHIDE
        UNHIDE = strcmp(get(0,'ShowHiddenHandles'),'off');
        set(0,'ShowHiddenHandles','on')
    end

    % Forces colormaps
    if isempty(H) && FORCE
        H = gca;
    end
    H = H(:);
    nH = length(H);

    % Checks H type:
    newH = [];
    for cH = 1:nH
        switch get(H(cH),'type')

            case {'figure','uipanel'}
                % Changes parents to its children axes
                haxes = findobj(H(cH), '-depth',1, 'Type','Axes', ...
                    '-not', 'Tag','legend');
                if isempty(haxes) && FORCE
                    haxes = axes('Parent',H(cH));
                end
                newH = [newH; haxes(:)];

            case 'axes'
                % Continues
                newH = [newH; H(cH)];
        end

    end
    H  = newH;
    nH = length(H);

    % Looks for CBH on axes:
    CBH = NaN(size(H));
    for cH = 1:nH

        % If its peer axes then one of the following is not empty:
        hin  = double(getappdata(H(cH),'LegendColorbarInnerList'));
        hout = double(getappdata(H(cH),'LegendColorbarOuterList'));

        if ~isempty([hin hout]) && any(ishandle([hin hout]))
            % Peer axes:

            if ~PEER
                if ishandle(hin)
                    CBH(cH) = hin;
                else
                    CBH(cH) = hout;
                end
            else
                CBH(cH) = H(cH);
            end

        else
            % Not peer axes:

            if isappdata(H(cH),appName)
                % CBFREEZE axes:

                appdata = getappdata(H(cH),appName);
                if ~PEER
                    CBH(cH) = double(appdata.cbHandle);
                else
                    CBH(cH) = double(appdata.peerHandle);
                end

            elseif strcmp(get(H(cH),'Tag'),'Colorbar')
                % Colorbar axes:

                if ~PEER

                    % Saves its handle:
                    CBH(cH) = H(cH);

                else

                    % Looks for its peer axes:
                    peer = findobj(ancestor(H(cH),{'figure','uipanel'}), ...
                        '-depth',1, 'Type','Axes', ...
                        '-not', 'Tag','Colorbar', '-not', 'Tag','legend');
                    for l = 1:length(peer)
                        hin  = double(getappdata(peer(l), ...
                            'LegendColorbarInnerList'));
                        hout = double(getappdata(peer(l), ...
                            'LegendColorbarOuterList'));
                        if any(H(cH)==[hin hout])
                            CBH(cH) = peer(l);
                            break
                        end
                    end

                end

            else
                % Just some normal axes:

                if FORCE
                    temp = colorbar('Peer',H(cH));
                    if ~PEER
                        CBH(cH) = temp;
                    else
                        CBH(cH) = H(cH);
                    end
                end
            end

        end

    end

    % Hidden:
    if UNHIDE
        set(0,'ShowHiddenHandles','off')
    end

    % Clears output:
    CBH(~ishandle(CBH)) = [];

% % %
end



function [cs,index] = sort_nat(c,mode)
%sort_nat: Natural order sort of cell array of strings.
% usage:  [S,INDEX] = sort_nat(C)
%
% where,
%    C is a cell array (vector) of strings to be sorted.
%    S is C, sorted in natural order.
%    INDEX is the sort order such that S = C(INDEX);
%
% Natural order sorting sorts strings containing digits in a way such that
% the numerical value of the digits is taken into account.  It is
% especially useful for sorting file names containing index numbers with
% different numbers of digits.  Often, people will use leading zeros to get
% the right sort order, but with this function you don't have to do that.
% For example, if C = {'file1.txt','file2.txt','file10.txt'}, a normal sort
% will give you
%
%       {'file1.txt'  'file10.txt'  'file2.txt'}
%
% whereas, sort_nat will give you
%
%       {'file1.txt'  'file2.txt'  'file10.txt'}
%
% See also: sort

    % Set default value for mode if necessary.
    if nargin < 2
        mode = 'ascend';
    end

    % Make sure mode is either 'ascend' or 'descend'.
    modes = strcmpi(mode,{'ascend','descend'});
    is_descend = modes(2);
    if ~any(modes)
        error('sort_nat:sortDirection',...
            'sorting direction must be ''ascend'' or ''descend''.')
    end

    % Replace runs of digits with '0'.
    c2 = regexprep(c,'\d+','0');

    % Compute char version of c2 and locations of zeros.
    s1 = char(c2);
    z = s1 == '0';

    % Extract the runs of digits and their start and end indices.
    [digruns,first,last] = regexp(c,'\d+','match','start','end');

    % Create matrix of numerical values of runs of digits and a matrix of the
    % number of digits in each run.
    num_str = length(c);
    max_len = size(s1,2);
    num_val = NaN(num_str,max_len);
    num_dig = NaN(num_str,max_len);
    for i = 1:num_str
        num_val(i,z(i,:)) = sscanf(sprintf('%s ',digruns{i}{:}),'%f');
        num_dig(i,z(i,:)) = last{i} - first{i} + 1;
    end

    % Find columns that have at least one non-NaN.  Make sure activecols is a
    % 1-by-n vector even if n = 0.
    activecols = reshape(find(~all(isnan(num_val))),1,[]);
    n = length(activecols);

    % Compute which columns in the composite matrix get the numbers.
    numcols = activecols + (1:2:2*n);

    % Compute which columns in the composite matrix get the number of digits.
    ndigcols = numcols + 1;

    % Compute which columns in the composite matrix get chars.
    charcols = true(1,max_len + 2*n);
    charcols(numcols) = false;
    charcols(ndigcols) = false;

    % Create and fill composite matrix, comp.
    comp = zeros(num_str,max_len + 2*n);
    comp(:,charcols) = double(s1);
    comp(:,numcols) = num_val(:,activecols);
    comp(:,ndigcols) = num_dig(:,activecols);

    % Sort rows of composite matrix and use index to sort c in ascending or
    % descending order, depending on mode.
    [unused,index] = sortrows(comp);
    if is_descend
        index = index(end:-1:1);
    end
    index = reshape(index,size(c));
    cs = c(index);

end
