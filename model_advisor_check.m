global modelName

%RUN_CONFIGURATION Check systems with Model Advisor
%   Check systems given as input and return number of warnings and failures
load Pedal_data.mat
%cd C:\Users\yangbo_91\Desktop\MBD\2020¼Æ»®\¹¤×÷\Ñî²©\MBDÓëjenkins½»»¥
modelName = 'pedal_req_02'
TbTestSys = modelName; 
Chk_fileName = 'model_advisor_checklist.mat';
fail=0;
warn=0;
%1.Specify a list of checks

%Create a Model Advisor configuration file

%Create a list of check IDs

%2.Specify a list of systems to check

%3.Run the Model Advisor checks on the list of systems
SysResultObjArray = ModelAdvisor.run(TbTestSys,'Configuration',Chk_fileName,'ParallelMode','Off','DisplayResults','Summary');


%%4.view the results
%4.0Archive and review the results of the run displayed on command line
for i=1:length(SysResultObjArray)
    fail = fail + SysResultObjArray{i}.numFail;
    warn = warn + SysResultObjArray{i}.numWarn;
end

%4.1.view the Model Advisor Command-Line Summary report after loading an
%object on Webview
%  ModelAdvisor.summaryReport(SysResultObjArray);

%4.2.View Results in Model Advisor GUI
% viewReport(SysResultObjArray{1});
% viewReport(SysResultObjArray{2});
 viewReport(SysResultObjArray{1}, 'MA');
% viewReport(SysResultObjArray{2},'Cmd');

%5.Save the SystResulObj for use at a later time
% save my_model_advisor_run SysResultObjArray;
% 
% %6.Clear the workspace to simulate viewing the results at a different time
% clear;
% 
% %7.Load the results of the Model Advisor run
% load my_model_advisor_run SysResultObjArray;
% 
% %4.2
% viewReport(SysResultObjArray{1},'MA');

%%
disp('model_advisor_check.m completed');
f = warndlg('Model Advisor Check Done','Warning');
