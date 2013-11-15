% Perform non-regression tests on within-subject ANOVA in SnPM. 
% Check that results obtained using the batch version are identical to the 
% results computed manually (using the interactive GUI).
%_______________________________________________________________________
% Copyright (C) 2013 The University of Warwick
% Id: test_multisub_withinsubanova.m  SnPM13 2013/10/12
% Camille Maumet
classdef test_multisub_withinsubanova < generic_test_snpm
    properties
    end
    
    methods (TestMethodSetup)
        function set_stat(testCase)
            testCase.stattype = 'f';
        end
        
        function create_basis_matlabbatch(testCase)
            testCase.compaWithSpm = false;
            
            % Fill the design part in the batch
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(1).scans = {
                 fullfile(testCase.testDataDir, 'su_control01', 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control01', 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control01', 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control01', 'cn_sess4', 'con_0001.img,1')
                 };
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(2).scans = {
                 fullfile(testCase.testDataDir, 'su_control02', 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control02', 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control02', 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control02', 'cn_sess4', 'con_0001.img,1')
                 };
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(3).scans = {
                 fullfile(testCase.testDataDir, 'su_control03', 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control03', 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control03', 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control03', 'cn_sess4', 'con_0001.img,1')
                 };
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(4).scans = {
                 fullfile(testCase.testDataDir, 'su_control04', 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control04', 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control04', 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control04', 'cn_sess4', 'con_0001.img,1')
                 };
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(5).scans = {
                 fullfile(testCase.testDataDir, 'su_control05', 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control05', 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control05', 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control05', 'cn_sess4', 'con_0001.img,1')
                 };
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(6).scans = {
                 fullfile(testCase.testDataDir, 'su_control06', 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control06', 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control06', 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control06', 'cn_sess4', 'con_0001.img,1')
                 };
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(7).scans = {
                 fullfile(testCase.testDataDir, 'su_control07', 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control07', 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control07', 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, 'su_control07', 'cn_sess4', 'con_0001.img,1')
                 };
        end
    end
    
    methods (Test)
        % No covariate, no variance smoothing
        function test_multisub_withinsubanova_1(testCase)
            % Nominal test
            testCase.testName = 'multisub_withinsubanova_1';
        end

        % With variance smoothing
        function test_multisub_withinsubanova_var(testCase)
            testCase.testName = 'multisub_withinsubanova_var';
            
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.vFWHM = [6 6 6];
        end

        % With approximate test
        function test_multisub_withinsubanova_approx(testCase)
            testCase.testName = 'multisub_withinsubanova_approx';
            
            rand('seed',200);
            
            for sub = 8:13
                testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.fsubject(sub).scans = {
                 fullfile(testCase.testDataDir, ['su_control' num2str(sub, '%02d')], 'cn_sess1', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, ['su_control' num2str(sub, '%02d')], 'cn_sess2', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, ['su_control' num2str(sub, '%02d')], 'cn_sess3', 'con_0001.img,1')
                 fullfile(testCase.testDataDir, ['su_control' num2str(sub, '%02d')], 'cn_sess4', 'con_0001.img,1')
                 };
            end
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.nPerm = 100;
        end
    end
    
    methods (TestMethodTeardown)
        function complete_batch(testCase)
            % Find the result directory for the batch execution and the
            % corresponding result directory computed manually using the
            % original spm2-like interface
            testCase.batchResDir = fullfile(testCase.parentDataDir, 'results', 'batch', testCase.testName);
            testCase.interResDir = fullfile(spm_str_manip(testCase.batchResDir,'hh'), 'interactive', testCase.testName);
            testCase.matlabbatch{1}.spm.tools.snpm.des.ANOVAwithinS.dir = {testCase.batchResDir};
        end
    end
end